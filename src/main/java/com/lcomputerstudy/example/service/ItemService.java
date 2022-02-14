package com.lcomputerstudy.example.service;

import java.util.List;


import com.lcomputerstudy.example.domain.Item;
import com.lcomputerstudy.example.domain.Top;

public interface ItemService {
	public List<Item> getItemList();
	
	
	public void itemInsert(Item item); //카테고리등록
	
	public void itemsetDelete(Item item); //카테고리 삭제
	
	public Item itemsetDetail(Item item); //카테고리 상세정보
	
	public void itemwriteInsert(Item item); //상품등록
	
	public void fileNames(Item item); //상품 파일 등록
	
	public Item itemdetail(Item item); //상품 상세정보
}
