package com.water.park.service.dao;

import java.util.ArrayList;

import com.water.park.vo.ReviewVO;

public interface ReviewDAO {

	ArrayList<ReviewVO> getAllReview();

	//마이페이지
	ReviewVO getRevinfo(ReviewVO reviewVO);
	void updateRevinfo(ReviewVO reviewVO);
	void deleteRevinfo(ReviewVO reviewVO);
	void insert_review(ReviewVO reviewVO);
	void insert_review_W(ReviewVO reviewVO);
	void insert_review_R(ReviewVO reviewVO);
	
	
	//워터파크
	ArrayList<ReviewVO> getAllReviewWater();
	ArrayList<ReviewVO> getAllReviewResort();
	ArrayList<ReviewVO> getAllReviewPakage();
	
	//어드민
	ArrayList<ReviewVO> AllReviewWater();
	ArrayList<ReviewVO> AllReviewResort();
	ArrayList<ReviewVO> AllReviewPakage();
	ReviewVO getadminRevinfoW(ReviewVO reviewVO);
	ReviewVO getadminRevinfoR(ReviewVO reviewVO);
	ReviewVO getadminRevinfoP(ReviewVO reviewVO);
	
	void deleteRevinfoW(ReviewVO reviewVO);
	void deleteRevinfoR(ReviewVO reviewVO);
	void deleteRevinfoP(ReviewVO reviewVO);
	
	double getAverageReviewScore() throws Exception; //별점평균값
}
