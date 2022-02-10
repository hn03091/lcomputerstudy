package com.lcomputerstudy.example.service;

import java.util.List;


import com.lcomputerstudy.example.domain.Item;
import com.lcomputerstudy.example.domain.Top;

public interface ItemService {
	public List<Item> getItemList();
	
	public List<Top> detailTopList();
	
	public void itemInsert(Item item);
	
	public void topInsert(Top top);
}
