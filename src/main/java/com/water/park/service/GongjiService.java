package com.water.park.service;

import java.util.ArrayList;

import com.water.park.vo.GongjiVO;

public interface GongjiService {

	ArrayList<GongjiVO> getAllGongji()     throws Exception;
	
    void insertGongji(GongjiVO gongjiVO);
    
 
    void updateGongji(GongjiVO gongjiVO);
    
    void deleteGongji(int g_id);
    

	GongjiVO gongjiGet(String g_title);

	
}
