package com.water.park.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.water.park.service.GongjiService;
import com.water.park.service.dao.GongjiDAO;
import com.water.park.vo.GongjiVO;

@Service("gongjiService") // DAO
public class GongjiServiceImpl implements GongjiService {

	@Autowired // 생성자
	private GongjiDAO gongjidao;

	@Transactional
	public ArrayList<GongjiVO> getAllGongji() {
		return gongjidao.getAllGongji();
	}

	@Override
	public void insertGongji(GongjiVO gongjiVO) {
		gongjidao.insertGongji(gongjiVO);

	}

	@Override
	public GongjiVO gongjiGet(int g_id) {
		return gongjidao.gongjiGet(g_id);
	}

	@Override
	public void deleteGongji(int g_id) {
		gongjidao.deleteGongji(g_id);
	}

	@Override
	public void updateGongji(GongjiVO gongjiVO) {
		gongjidao.updateGongji(gongjiVO);
	}

	// 전체공지 (페이징)
	@Override
	public int getTotalCount() {
		return gongjidao.getTotalCount();
	}

	@Override
	@Transactional
	public ArrayList<GongjiVO> getList(int page, int page2) throws Exception {
		return gongjidao.getList(page, page2);
	}

	// 공지 검색
	@Override
	public int getFilterTotal(String gongjiFilter, String gongjiSearch) {
	    return gongjidao.getFilterTotal(gongjiFilter, gongjiSearch);
	}

	@Override
	public ArrayList<GongjiVO> getFilterList(String gongjiFilter, String gongjiSearch2, int page, int page2) {
	    return gongjidao.getFilterList(gongjiFilter, gongjiSearch2, page, page2);
	}
}