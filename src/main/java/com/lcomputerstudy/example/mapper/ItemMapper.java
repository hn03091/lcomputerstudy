package com.lcomputerstudy.example.mapper;


import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.Item;
import com.lcomputerstudy.example.domain.Top;

@Mapper
public interface ItemMapper {
	public List<Item> getItemList();
	
	public List<Top> detailTopList();
	
	public void itemInsert(Item item);
	
	public void topInsert(Top top);
}
