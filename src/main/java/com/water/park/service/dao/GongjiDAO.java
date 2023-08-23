package com.water.park.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.water.park.vo.GongjiVO;

public interface GongjiDAO {
	
	ArrayList<GongjiVO> getAllGongji();

	void insertGongji(GongjiVO gongjiVO);

	void deleteGongji(int g_id);

	GongjiVO gongjiGet(String g_title);

	public void updateGongji(GongjiVO gongjiVO );
	

	
	
	int getTotalCount();
	
	ArrayList<GongjiVO> getList(@Param("page") int page,@Param("page2") int page2);
	
}
