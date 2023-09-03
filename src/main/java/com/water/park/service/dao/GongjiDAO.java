	package com.water.park.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.water.park.vo.GongjiVO;

public interface GongjiDAO {

	ArrayList<GongjiVO> getAllGongji();

	void insertGongji(GongjiVO gongjiVO);

	void deleteGongji(int g_id);

	GongjiVO gongjiGet(int g_id);

	public void updateGongji(GongjiVO gongjiVO);

	// 전체공지보기 (페이징)
	int getTotalCount();

	ArrayList<GongjiVO> getList(@Param("page") int page, @Param("page2") int page2);

	// 공지검색 (페이징)
	int getFilterTotal(@Param("gongjiFilter") String gongjiFilter, @Param("gongjiSearch") String gongjiSearch);

	ArrayList<GongjiVO> getFilterList(@Param("gongjiFilter") String gongjiFilter,
	        @Param("gongjiSearch2") String gongjiSearch2, 
	        @Param("page") int page, 
	        @Param("page2") int page2);
}
