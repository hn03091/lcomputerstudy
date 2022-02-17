package com.lcomputerstudy.example.domain;

import java.util.List;

public class Item {
	private String i_idx;
	private String i_name;
	private String Field;
	private String Query;
	private int ROWNUM;
	
	
	
	
	public String getField() {
		return Field;
	}
	public void setField(String field) {
		Field = field;
	}
	public String getQuery() {
		return Query;
	}
	public void setQuery(String query) {
		Query = query;
	}
	public int getROWNUM() {
		return ROWNUM;
	}
	public void setROWNUM(int rOWNUM) {
		ROWNUM = rOWNUM;
	}
	public String getI_idx() {
		return i_idx;
	}
	public void setI_idx(String i_idx) {
		this.i_idx = i_idx;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	
	

}
