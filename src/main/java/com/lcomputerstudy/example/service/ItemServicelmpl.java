package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Item;
import com.lcomputerstudy.example.domain.Top;
import com.lcomputerstudy.example.mapper.ItemMapper;

@Service("ItemServiceImpl")
public class ItemServicelmpl implements ItemService {
	
	@Autowired ItemMapper itemmapper;
	
	@Override
	public List<Item> getItemList(){
		return itemmapper.getItemList();
	}
	
	
	@Override //카테고리 등록
	public void itemInsert(Item item){
		itemmapper.itemInsert(item);
	}
	@Override //카테고리삭제
	public void itemsetDelete(Item item) {
		itemmapper.itemsetDelete(item);
	}
	@Override //카테고리 상세정보
	public Item itemsetDetail(Item item){
		return itemmapper.itemsetDetail(item);
	}
	
	@Override //상품등록
	public void itemwriteInsert(Item item) { 
		itemmapper.itemwriteInsert(item);
	}
	@Override //상품 파일 등록
	public void fileNames(Item item) {
		itemmapper.fileNames(item);
	} 
	@Override //상품 상세 정보
	public Item itemdetail(Item item) {
		return itemmapper.itemdetail(item);
	}
}
