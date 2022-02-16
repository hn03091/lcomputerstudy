package com.lcomputerstudy.example.controller;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.apache.taglibs.standard.tag.common.fmt.SetBundleSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.BoardFile;
import com.lcomputerstudy.example.domain.Item;
import com.lcomputerstudy.example.domain.MidleItem;
import com.lcomputerstudy.example.domain.Page;
import com.lcomputerstudy.example.domain.Product;
import com.lcomputerstudy.example.domain.Search;

import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.ItemService;
import com.lcomputerstudy.example.service.UserService;

/*
spring:
	  servlet:
	    multipart:
	      maxFileSize: 10MB
	      maxRequestSize: 20MB
*/
@org.springframework.stereotype.Controller
public class Controller {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	BoardService boardservice;
	@Autowired
	UserService userservice;
	@Autowired
	ItemService itemservice;
	
	@Secured({ "ROLE_ADMIN" })			//관리자 페이지
	@RequestMapping(value = "/admin")
	public String admin(Model model) {
		return "/admin";
	}
	@RequestMapping("/")
	public String home(Model model, Page page, Board board,Search search,Item item) {
		page.setCount(boardservice.countBoard(page));
		page.init();
		List<Board> list = boardservice.selectBoard(page);
		List<Item> itemList = itemservice.getItemList();
		
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("list", list);
		logger.debug("debug");
		logger.info("info");
		logger.error("error");

		return "/index";
	}
	@RequestMapping("/itemdetail") //상품 상세보기
	public String itemdetail(Model model,BoardFile boardfile,Product product) {
		
		product =itemservice.productdetail(product);
		model.addAttribute(product);
		return "/itemdetail";
	}
	@RequestMapping("/itemset")	//분류관리 메인
	public String itemset(Model model) {
		
		List<Item> itemList=itemservice.getItemList();
		List<MidleItem> midleList= itemservice.getMidleList();
				
		model.addAttribute("itemList", itemList);
		model.addAttribute("midleList", midleList);
		
		return "/itemset";
	}
	
	@RequestMapping("/itemsetwrite") //대분류 카테고리 등록
	public String itemsetwrite(Model model,Item item) {
		List<Item> itemList=itemservice.getItemList();
		model.addAttribute("itemList", itemList);
		
		return "/itemsetwrite";
	}
	@RequestMapping("/itemsetwriteProcess") //대분류 카테고리 등록 프로세스
	public String itemsetwriteProcess(Model model,Item item) {
	
		itemservice.itemInsert(item);
		
		
		return "/itemsetwriteProcess";
	}
	
	@RequestMapping("/itemsetUpdate") //대분류 카테고리 수정
	public String itemsetUpdate(Model model,Item item) {
		item =itemservice.itemsetDetail(item);
		
		model.addAttribute(item);
		
		return "/itemsetUpdate";
	}
	@RequestMapping("/itemsetUpdateProcess") //대분류 카테고리 수정 프로세스
	public String itemsetUpdateProcess(Model model,Item item) {
		itemservice.itemsetUpdate(item);
		
		return "/itemsetUpdateProcess";
	}
	
	@RequestMapping("/itemsetDelete") //대분류 카테고리삭제
	public String itemsetDelete(Item item) {
		itemservice.itemsetDelete(item);
		return "/itemsetDelete";
		
	}
	
	
	@RequestMapping("/midleitemsetwrite") //중분류 카테고리 등록
	public String midleitemsetwrite(Model model,MidleItem midleItem) {
		List<Item> itemList=itemservice.getItemList();
		model.addAttribute("itemList", itemList);
		
		return "/midleitemsetwrite";
	}
	@RequestMapping("/mdwriteProcess") //중분류 카테고리 등록 프로세스
	public String mdwriteProcess(Model model,MidleItem mdItem) {
		String iIdx=mdItem.getI_idx();
		String mIdx=mdItem.getM_idx();
		String midleIdx=iIdx + mIdx;
		mdItem.setM_idx(midleIdx);
		
		itemservice.midleitemInsert(mdItem);
		return "/midleitemwriteProcess";
	}
	@RequestMapping("/midlesetUpdate") //중분류 카테고리 수정
	public String midlesetUpdate(Model model,MidleItem mdItem) {
		mdItem=itemservice.midlesetDetail(mdItem);
		
		model.addAttribute("mdItem" ,mdItem);
		
		return "/midlesetUpdate";
	}
	@RequestMapping("/midlesetUpdateProcess") //대분류 카테고리 수정 프로세스
	public String midlesetUpdateProcess(Model model,MidleItem mdItem) {
		itemservice.midlesetUpdate(mdItem);
		
		return "/midlesetUpdateProcess";
	}
	@RequestMapping("/midlesetDelete") //중분류 카테고리 삭제
	public String midlesetDelete(MidleItem mdItem) {
		
		itemservice.midlesetDelete(mdItem);
		
		return "/midlesetDelete";
	}
	@RequestMapping("/productset")	//상품관리 메인
	public String productset(Model model) {
		List<Product> pdList=itemservice.getProductList();
		
		model.addAttribute("pdList", pdList);
		
		return "/productset";
	}
	@RequestMapping("/productwrite") //상품등록
	public String productwrite(Model model){
		List<Item> itemList=itemservice.getItemList();
		List<MidleItem> midleList= itemservice.getMidleList();
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("midleList", midleList);
		return "/productwrite";
	}
	@RequestMapping("/productProcess") //상품 등록 프로세스
	public String productProcess( BoardFile boardFile,Product product, Authentication authentication, Model model) throws IOException {
		Date nowTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowTimeStr = date.format(nowTime);
		
	
		List<String> SavefileNames = new ArrayList<String>();
		List<MultipartFile> files = boardFile.getFiles();		
		String path = "C:\\Users\\l2-morning\\Documents\\work10\\lcomputerstudy\\src\\main\\resources\\static\\image";
		
		for (MultipartFile file : files) {
		      if (!file.getOriginalFilename().isEmpty()) { // 업로드 파일 존재 확인
		        String saveFileName = System.nanoTime() + file.getOriginalFilename(); //저장 파일명
		        
		         BufferedOutputStream outputStream = new BufferedOutputStream(
			               new FileOutputStream(
			                     new File(path +"/" +saveFileName)));
		        
		            
		         outputStream.write(file.getBytes());
		         outputStream.flush();
		         outputStream.close();		         
		 
		       
		         
		         
		         String ext = saveFileName.substring(saveFileName.lastIndexOf(".")+1);
		         String thumbPath = "C:\\Users\\l2-morning\\Documents\\work10\\lcomputerstudy\\src\\main\\resources\\static\\image\\thumb"; //이미지 미리보기 저장경로
		        
		         File nfile = new File(path + "/" +saveFileName);
		         File thumbFile = new File(thumbPath + "/"+"thumb"+saveFileName ); //썸네일 파일
		         BufferedImage imageBuf = ImageIO.read(nfile);
		        	int fixWidth = 500;
		        	double ratio = imageBuf.getWidth() / (double)fixWidth;
					int thumbWidth = fixWidth;
					int thumbHeight = (int)(imageBuf.getHeight() / ratio);
					BufferedImage thumbImageBf = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_3BYTE_BGR);
					Graphics2D g = thumbImageBf.createGraphics();
					Image thumbImage = imageBuf.getScaledInstance(thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
					g.drawImage(thumbImage, 0, 0, thumbWidth, thumbHeight, null);
					g.dispose();
					ImageIO.write(thumbImageBf, ext, thumbFile);
					String fileName = ("thumb"+saveFileName);
					SavefileNames.add(fileName);
		      } else {		        
		         return "/productProcess";
		      }
		}
		
	
		product.setP_date(nowTimeStr);
		boardFile.setFiles(files);		
		product.setFileNames(SavefileNames);
		
		
		String mIdx=product.getM_idx();
		String pIdx=product.getP_idx();
		
		String p_idx=mIdx+pIdx;
		product.setP_idx(p_idx);
		
		itemservice.productInsert(product);
		itemservice.fileNames(product);
		
		
		return "/productProcess";
	}
	@RequestMapping("/productsetUpdate") //상품 수정
	public String productsetUpdate(Model model,Product product) {
		product=itemservice.productsetDetail(product);
		
		model.addAttribute("product", product);
		
		return "/productsetUpdate";
	}
	@RequestMapping("/productsetUpdateProcess") //상품 수정 프로세스
	public String productsetUpdateProcess(BoardFile boardFile,Product product, Authentication authentication, Model model) throws IOException {
		Date nowTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowTimeStr = date.format(nowTime);
		
	
		List<String> SavefileNames = new ArrayList<String>();
		List<MultipartFile> files = boardFile.getFiles();		
		String path = "C:\\Users\\l2-morning\\Documents\\work10\\lcomputerstudy\\src\\main\\resources\\static\\image";
		
		for (MultipartFile file : files) {
		      if (!file.getOriginalFilename().isEmpty()) { // 업로드 파일 존재 확인
		        String saveFileName = System.nanoTime() + file.getOriginalFilename(); //저장 파일명
		        
		         BufferedOutputStream outputStream = new BufferedOutputStream(
			               new FileOutputStream(
			                     new File(path +"/" +saveFileName)));
		        
		            
		         outputStream.write(file.getBytes());
		         outputStream.flush();
		         outputStream.close();		         
		 
		       
		         
		         
		         String ext = saveFileName.substring(saveFileName.lastIndexOf(".")+1);
		         String thumbPath = "C:\\Users\\l2-morning\\Documents\\work10\\lcomputerstudy\\src\\main\\resources\\static\\image\\thumb"; //이미지 미리보기 저장경로
		        
		         File nfile = new File(path + "/" +saveFileName);
		         File thumbFile = new File(thumbPath + "/"+"thumb"+saveFileName ); //썸네일 파일
		         BufferedImage imageBuf = ImageIO.read(nfile);
		        	int fixWidth = 500;
		        	double ratio = imageBuf.getWidth() / (double)fixWidth;
					int thumbWidth = fixWidth;
					int thumbHeight = (int)(imageBuf.getHeight() / ratio);
					BufferedImage thumbImageBf = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_3BYTE_BGR);
					Graphics2D g = thumbImageBf.createGraphics();
					Image thumbImage = imageBuf.getScaledInstance(thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
					g.drawImage(thumbImage, 0, 0, thumbWidth, thumbHeight, null);
					g.dispose();
					ImageIO.write(thumbImageBf, ext, thumbFile);
					String fileName = ("thumb"+saveFileName);
					SavefileNames.add(fileName);
		      } else {		        
		         return "/productProcess";
		      }
		}
		
	
		product.setP_date(nowTimeStr);
		boardFile.setFiles(files);		
		product.setFileNames(SavefileNames);
		
		itemservice.productsetUpdate(product);
		itemservice.fileNames(product);
		
		
		return "/productsetUpdateProcess";
	}
	@RequestMapping("/productfiledelete")//수정시 파일 삭제
	public String productfiledelete(Product product,BoardFile boardfile) {
		
		itemservice.productfileDelete(boardfile);
		
		return "/productfiledelete";
	}
	@RequestMapping("/productsetDelete") //상품 삭제
	public String productsetDelete(Product product) {
		
		itemservice.productsetDelete(product);
		
		
		
		return "/productsetDelete";
	}
	

	@ResponseBody
	public String getUserName(Authentication authentication) {
		User user = (User) authentication.getPrincipal();
		return user.getuName();

	}
	

	@RequestMapping("/boardwrite")
	public String write(Model model) {
		return "/boardwrite";
	}
	@RequestMapping("/boardDelete")
	public String boardDelete(Board board) {
		boardservice.boardDelete(board);
		
		return "/boardDelete";
	}
	@RequestMapping("/commentDelete")
	public String commentDelete(Board board) {
		boardservice.commentDelete(board);
		
		return "/commentDelete";
	}
	@RequestMapping("/fileDelete")
	public String fileDelete(BoardFile boardFile) {
		boardservice.fileDelete(boardFile);
		
		return "/fileDelete";
	}
	@RequestMapping("/boardUpdate")
	public String boardUpdate(BoardFile boardFile,Board board,Model model) {
		Board data = boardservice.boarddetail(board);
		model.addAttribute("data", data);
		
		return "/boardUpdate";
	}
	@RequestMapping("/updateProcess")
	public String updateProcess(BoardFile boardFile,Board board, Authentication authentication, Model model) throws IOException {
		Date nowTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowTimeStr = date.format(nowTime);
		
	
		List<String> SavefileNames = new ArrayList<String>();
		List<MultipartFile> files = boardFile.getFiles();		
		String path = "C:\\Users\\l2-morning\\Documents\\work10\\lcomputerstudy\\src\\main\\resources\\static\\image";
		
		for (MultipartFile file : files) {
		      if (!file.getOriginalFilename().isEmpty()) { // 업로드 파일 존재 확인
		        String saveFileName = System.nanoTime() + file.getOriginalFilename(); //저장 파일명
		        
		         BufferedOutputStream outputStream = new BufferedOutputStream(
			               new FileOutputStream(
			                     new File(path +"/" +saveFileName)));
		        
		            
		         outputStream.write(file.getBytes());
		         outputStream.flush();
		         outputStream.close();		         
		 
		       
		         
		         
		         String ext = saveFileName.substring(saveFileName.lastIndexOf(".")+1);
		         String thumbPath = "C:\\Users\\l2-morning\\Documents\\work10\\lcomputerstudy\\src\\main\\resources\\static\\image\\thumb"; //이미지 미리보기 저장경로
		        
		         File nfile = new File(path + "/" +saveFileName);
		         File thumbFile = new File(thumbPath + "/"+"thumb"+saveFileName ); //썸네일 파일
		         BufferedImage imageBuf = ImageIO.read(nfile);
		        	int fixWidth = 500;
		        	double ratio = imageBuf.getWidth() / (double)fixWidth;
					int thumbWidth = fixWidth;
					int thumbHeight = (int)(imageBuf.getHeight() / ratio);
					BufferedImage thumbImageBf = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_3BYTE_BGR);
					Graphics2D g = thumbImageBf.createGraphics();
					Image thumbImage = imageBuf.getScaledInstance(thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
					g.drawImage(thumbImage, 0, 0, thumbWidth, thumbHeight, null);
					g.dispose();
					ImageIO.write(thumbImageBf, ext, thumbFile);
					String fileName = ("thumb"+saveFileName);
					SavefileNames.add(fileName);
		      } else {		        
		         return "/updateprocess";
		      }
		}
		
		board.setbDateTime(nowTimeStr);
		boardFile.setFiles(files);		
		board.setFileNames(SavefileNames);
		
		boardservice.updateProcess(board);
		boardservice.fileNames(board);
		
		
		return "/updateprocess";
	}
	@RequestMapping("/boardprocess")
	public String boardprocess(BoardFile boardFile,Board board, Authentication authentication, Model model) throws IOException {
	
		Date nowTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowTimeStr = date.format(nowTime);
		User user=(User)authentication.getPrincipal();
		String username= user.getuName();
		
	
		List<String> SavefileNames = new ArrayList<String>();
		List<MultipartFile> files = boardFile.getFiles();		
		String path = "C:\\Users\\l2-morning\\Documents\\work10\\lcomputerstudy\\src\\main\\resources\\static\\image";
		
		for (MultipartFile file : files) {
		      if (!file.getOriginalFilename().isEmpty()) { // 업로드 파일 존재 확인
		        String saveFileName = System.nanoTime() + file.getOriginalFilename(); //저장 파일명
		        
		         BufferedOutputStream outputStream = new BufferedOutputStream(
			               new FileOutputStream(
			                     new File(path +"/" +saveFileName)));
		        
		            
		         outputStream.write(file.getBytes());
		         outputStream.flush();
		         outputStream.close();		         
		 
		       
		         
		         
		         String ext = saveFileName.substring(saveFileName.lastIndexOf(".")+1);
		         String thumbPath = "C:\\Users\\l2-morning\\Documents\\work10\\lcomputerstudy\\src\\main\\resources\\static\\image\\thumb"; //이미지 미리보기 저장경로
		        
		         File nfile = new File(path + "/" +saveFileName);
		         File thumbFile = new File(thumbPath + "/"+"thumb"+saveFileName ); //썸네일 파일
		         BufferedImage imageBuf = ImageIO.read(nfile);
		        	int fixWidth = 500;
		        	double ratio = imageBuf.getWidth() / (double)fixWidth;
					int thumbWidth = fixWidth;
					int thumbHeight = (int)(imageBuf.getHeight() / ratio);
					BufferedImage thumbImageBf = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_3BYTE_BGR);
					Graphics2D g = thumbImageBf.createGraphics();
					Image thumbImage = imageBuf.getScaledInstance(thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
					g.drawImage(thumbImage, 0, 0, thumbWidth, thumbHeight, null);
					g.dispose();
					ImageIO.write(thumbImageBf, ext, thumbFile);
					String fileName = ("thumb"+saveFileName);
					SavefileNames.add(fileName);
		      } else {
		    	  	board.setbWriter(username);
		  			board.setbDateTime(nowTimeStr);
		  			boardservice.boardwrite(board);
		         return "/boardprocess";
		      }
		}
		

		board.setbWriter(username);
		board.setbDateTime(nowTimeStr);
		boardFile.setFiles(files);		
		board.setFileNames(SavefileNames);
		
		boardservice.boardwrite(board);
		boardservice.fileNames(board);
		
		
		return "/boardprocess";
	}
	@RequestMapping("/commentprocess")
	public String commentprocess(Board board, Authentication authentication) {

		Date nowTime = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowTimeStr = date.format(nowTime);
		User user = (User) authentication.getPrincipal();
		String username = user.getuName();

		board.setC_date(nowTimeStr);
		board.setC_writer(username);

		boardservice.boardcomment(board);

		return "/commentprocess";
	}


	@RequestMapping(value = "/boarddetail")
	public String detail(BoardFile boardFile, Model model, Board board) {

		
		board = boardservice.boarddetail(board);		
		
		
		
		
		model.addAttribute(board);

		return "/boarddetail";
	}

	
	

	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}

	@RequestMapping("/signup")
	public String signup(User user) {
		// 비밀번호를 암호화 db저장
		String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());

		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));

		userservice.createUser(user);
		userservice.createAuthorities(user);

		return "/login";
	}

	@RequestMapping(value = "/login")
	public String beforeLogin(Model model) {
		return "/login";
	}

	

	@Secured({ "ROLE_USER" })
	@RequestMapping(value = "/user/info")
	public String userInfo(Model model) {

		return "/user_info";
	}

	@RequestMapping(value = "/denied")
	public String denied(Model model) {
		return "/denied";
	}

}
