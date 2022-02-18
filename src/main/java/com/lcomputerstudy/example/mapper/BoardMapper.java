package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.BoardFile;
import com.lcomputerstudy.example.domain.Page;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList();
	
	public void boardwrite(Board board);
	
	public Board boarddetail(Board board);
	
	public void boardcomment(Board board);
	
	public  List<Board> comments(Board board);
	
	//public List<MultipartFile> boardfile(Board board);
	
	public void fileNames(Board board);
	
	public List<BoardFile> boardFiles(BoardFile boardFile);
	
	public void boardDelete(Board board);
	
	public void updateProcess(Board board);
	
	public void fileDelete(BoardFile boardFile);
	
	public void commentDelete(Board board);
	
	public int countBoard(Page page);
	
	public List<Board> selectBoard(Page page);
	
	public List<Board> searchBoard(Page page);
	
	public List<Board> getreviewBoard(Board board);
}
