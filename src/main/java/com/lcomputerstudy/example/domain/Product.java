package com.lcomputerstudy.example.domain;

import java.util.List;

public class Product {
	private String i_idx;
	private String i_name;

	private int p_idx;
	private String p_name;
	private String p_content;
	private String p_date;
	private int p_price;
	private String fileName;
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int bf_idx;
	
	public int getBf_idx() {
		return bf_idx;
	}
	public void setBf_idx(int bf_idx) {
		this.bf_idx = bf_idx;
	}
	private List<BoardFile> boardFiles;
	private List<String> fileNames;
	private List<Comment> comments;
	
	
	
	
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	
	public List<BoardFile> getBoardFiles() {
		return boardFiles;
	}
	public void setBoardFiles(List<BoardFile> boardFiles) {
		this.boardFiles = boardFiles;
	}
	public List<String> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<String> fileNames) {
		this.fileNames = fileNames;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public String getI_idx() {
		return i_idx;
	}
	public void setI_idx(String i_idx) {
		this.i_idx = i_idx;
	}
	
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	
}
