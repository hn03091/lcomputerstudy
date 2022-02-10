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
	
	@Override
	public List<Top> detailTopList(){
		return itemmapper.detailTopList();
	}
	@Override
	public void itemInsert(Item item){
		itemmapper.itemInsert(item);
	}
	@Override
	public void topInsert(Top top) {
		itemmapper.topInsert(top);
	}
}
