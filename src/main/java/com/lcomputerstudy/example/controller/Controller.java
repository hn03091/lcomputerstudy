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
import com.lcomputerstudy.example.domain.Page;
import com.lcomputerstudy.example.domain.Search;
import com.lcomputerstudy.example.domain.Top;
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
	
	@RequestMapping("/itemset")	//분류관리 메인
	public String itemset(Model model) {
		
		List<Item> itemList=itemservice.getItemList();
		model.addAttribute("itemList", itemList);
		
		
		return "/itemset";
	}
	
	@RequestMapping("/itemsetwrite") //카테고리 등록
	public String itemsetwrite(Model model,Item item,Top top) {
		/*String Iidx=item.getI_idx();
		int idx = Integer.parseInt(Iidx); 
		if(idx == 10) {			
			List<Top> topList=itemservice.detailTopList();
			model.addAttribute("topList", topList);
		}else if(idx == 20){
			System.out.println("pants");
		}*/
		return "/itemsetwrite";
	}
	
	@RequestMapping("/itemsetwriteProcess") //카테고리 프로세스
	public String itemsetwriteProcess(Model model,Item item) {
		//top.setI_idx("10");
		//itemservice.topInsert(top);
		
		itemservice.itemInsert(item);
		
		
		return "/itemsetwriteProcess";
	}
	
	@RequestMapping("/itemList")	//상품관리 메인
	public String itemList(Model model) {
		
		return "/itemList";
	}
	@RequestMapping("/itemwrite") //상품등록
	public String itemwrite(Model model){
		List<Item> itemList=itemservice.getItemList();
		
		model.addAttribute("itemList", itemList);
		return "/itemwrite";
	}
	@RequestMapping("/")
	public String home(Model model, Page page, Board board,Search search) {
		page.setCount(boardservice.countBoard(page));
		page.init();
		List<Board> list = boardservice.selectBoard(page);
		
		
		model.addAttribute("list", list);
		logger.debug("debug");
		logger.info("info");
		logger.error("error");

		return "/index";
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
		
		
		
		
		//model.addAttribute("comments", commentlist);
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
