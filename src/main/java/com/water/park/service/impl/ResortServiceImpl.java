package com.water.park.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.water.park.service.ResortService;
import com.water.park.service.dao.ResortDAO;
import com.water.park.vo.ResortVO;

@Service("resortService")		//DAO
public class ResortServiceImpl implements ResortService{

	
	@Autowired //생성자
	private ResortDAO resortimsi;
	
	@Transactional
	public ArrayList<ResortVO> getAllResort(){
		return resortimsi.getAllResort();
	}
}
