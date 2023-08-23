package com.water.park.service;

import java.util.ArrayList;

import com.water.park.vo.GongjiVO;

public interface GongjiService {

	ArrayList<GongjiVO> getAllGongji()     throws Exception;
	
    void insertGongji(GongjiVO gongjiVO);
    
 
    void updateGongji(GongjiVO gongjiVO);
    
    void deleteGongji(int g_id);
    

	GongjiVO gongjiGet(String g_title);

	
	
	
	
	//공지 전체보기
	int getTotalCount();

	ArrayList<GongjiVO> getList(int page,int page2) throws Exception;
	
	//공지 전체검색
	static int getFilterTotal(String gongjiFilter, String gongjiSearch2) {
		return 0;
	}

	static ArrayList<GongjiVO> getFilterList(String gongjiFilter, String gongjiSearch2, int page, int page2) {
		return null;
	}

	
}
