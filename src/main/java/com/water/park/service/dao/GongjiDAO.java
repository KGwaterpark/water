package com.water.park.service.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

import com.water.park.vo.GongjiVO;

public interface GongjiDAO {
	
	ArrayList<GongjiVO> getAllGongji();

	void insertGongji(GongjiVO gongjiVO);
	

    
	void deleteGongji(int g_id);
    

	GongjiVO gongjiGet(String g_title);

	public void updateGongji(GongjiVO gongjiVO );
	
}
