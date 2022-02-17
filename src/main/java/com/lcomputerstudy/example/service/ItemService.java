package com.lcomputerstudy.example.service;

import java.util.List;

import com.lcomputerstudy.example.domain.BoardFile;
import com.lcomputerstudy.example.domain.Item;
import com.lcomputerstudy.example.domain.MidleItem;
import com.lcomputerstudy.example.domain.Product;

public interface ItemService {
	public List<Item> getItemList();
	
	/*****대분류*****/
	public Item itemsetDetail(Item item); //대분류 카테고리 상세정보
	
	public void itemInsert(Item item); //대분류 카테고리 등록
	
	public void itemsetUpdate(Item item); //대분류 카테고리 수정
	
	public void itemsetDelete(Item item); //대분류 카테고리 삭제
	
	
	/*****중분류*****/
	public List<MidleItem> getMidleList();
	
	public MidleItem midlesetDetail(MidleItem midleItem); //중분류 카테고리 상세정보
	
	public void midleitemInsert(MidleItem midleItem); //중분류 카테고리 등록
	
	public void midlesetUpdate(MidleItem midleItem); //중분류 카테고리 수정
	
	public void midlesetDelete(MidleItem midleItem); //중분류 카테고리 삭제
	
	
	/***** 상품 *****/
	public List<Product> getProductList();
	
	public void productInsert(Product product); //상품등록
	
	public void productsetUpdate(Product product); // 상품 수정
	
	public void productsetDelete(Product product); // 상품 삭제
	
	public void fileNames(Product product); //상품 파일 등록
	
	public Product productsetDetail(Product product); //상품 상세정보
	
	public void productfileDelete(BoardFile boardfile); //상품 이미지 파일 삭제
	
	public List<Product> productsetfileUpdate(Product product); // 상품 이미지만 불러오기
	
	public Product productdetail(Product product); //상품 상세정보
}
