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
@Service("gongjiService")		//DAO
public class GongjiServiceImpl implements GongjiService{

	
	@Autowired //생성자
	private GongjiDAO gongjidao;
	
	@Transactional
	public ArrayList<GongjiVO> getAllGongji(){
		return gongjidao.getAllGongji();
	}

		@Override
		public void insertGongji(GongjiVO gongjiVO ) {
			gongjidao.insertGongji(gongjiVO);
			
		}

		@Override
		public GongjiVO gongjiGet(String g_title) {
			return gongjidao.gongjiGet(g_title);
		}

		@Override
		public void deleteGongji(int g_id) {
			gongjidao.deleteGongji(g_id);
		}

		 @Override 
		 public void updateGongji(GongjiVO gongjiVO) {
			 gongjidao.updateGongji(gongjiVO);
		 }
		 

		/*
		 * @Override public void updateGongji(int g_id, String g_title1, String
		 * g_content1) { // 기존 내용이 있는지 확인하고, 있으면 해당 공지를 삭제 GongjiVO existingGongji =
		 * gongjidao.gongjiGet(g_title1); if (existingGongji != null) {
		 * gongjidao.deleteGongji(existingGongji.getG_id()); }
		 * 
		 * // 새로운 내용으로 공지를 추가 GongjiVO newGongji = new GongjiVO();
		 * newGongji.setG_title(g_title1); newGongji.setG_content(g_content1);
		 * gongjidao.insertGongji(newGongji); }
		 */

		

		/*
		 * public void updateGongji(@Param("g_id") int g_id ,@Param("g_title") String
		 * g_title,@Param("g_content") String g_content) {
		 * gongjidao.updateGongji(g_id,g_title, g_content);
		 * 
		 * }
		 */
	





	
}
