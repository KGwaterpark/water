package com.water.park.service;

import java.util.ArrayList;

import com.water.park.vo.ResortVO;

public interface ResortService {
	
	ArrayList<ResortVO> getAllResort()     throws Exception;
	
}
