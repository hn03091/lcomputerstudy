package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.BoardFile;
import com.lcomputerstudy.example.domain.Page;
import com.lcomputerstudy.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServicelmpl implements BoardService {
	
	@Autowired BoardMapper boardmapper;
	
	@Override
	public List<Board> selectBoardList(){
		return boardmapper.selectBoardList();
	}
	@Override
	public void boardwrite(Board board) {
		boardmapper.boardwrite(board);
	}
	/*@Override
	public List<MultipartFile> boardfile(Board board) {
		return boardmapper.boardfile(board);
	}*/
	@Override
	public void fileNames(Board board) {
		 boardmapper.fileNames(board);
	}
	@Override
	public Board boarddetail(Board board) {
		return boardmapper.boarddetail(board);
	}
	@Override
	public void boardcomment(Board board) {
		boardmapper.boardcomment(board);
	}
	@Override
	public List<Board> comments(Board board){
		return boardmapper.comments(board);
	}
	@Override
	public List<BoardFile> boardFiles(BoardFile boardFile){
		return boardmapper.boardFiles(boardFile);
	}
	@Override
	public void boardDelete(Board board) {
		 boardmapper.boardDelete(board);
	}
	@Override
	public void updateProcess(Board board) {
		boardmapper.updateProcess(board);
	}
	@Override
	public void fileDelete(BoardFile boardFile) {
		boardmapper.fileDelete(boardFile);
	}
	@Override
	public void commentDelete(Board board) {
		boardmapper.commentDelete(board);
	}
	@Override
	public int countBoard() {
		return boardmapper.countBoard();
	}
	@Override
	public List<Board> selectBoard(Page page){
		return boardmapper.selectBoard(page);
	}
	@Override
	public List<Board> searchBoard(Page page){
		return boardmapper.searchBoard(page);
	}
	/*@Override
	public List<Board> commentlist(int bId){
		return boardmapper.commentlist(bId);  댓글 목록
	}*/

}
