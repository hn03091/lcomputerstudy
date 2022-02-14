package com.lcomputerstudy.example.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardFile {
	private int bfIdx;
	private int bId;
	private String fileName;
	private List<MultipartFile> files;
	private int i_idx;
	
	
	
	public int getI_idx() {
		return i_idx;
	}
	public void setI_idx(int i_idx) {
		this.i_idx = i_idx;
	}
	public int getBfIdx() {
		return bfIdx;
	}
	public void setBfIdx(int bfIdx) {
		this.bfIdx = bfIdx;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}

	
	

}
