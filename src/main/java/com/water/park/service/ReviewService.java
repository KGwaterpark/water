package com.water.park.service;

import java.util.ArrayList;

import com.water.park.vo.ReviewVO;

public interface ReviewService {

	
	ArrayList<ReviewVO> getAllReview()     throws Exception;
	
	//마이페이지
	ReviewVO getRevinfo(ReviewVO reviewVO);
	
	void updateRevinfo(ReviewVO reviewVO);
	void deleteRevinfo(ReviewVO reviewVO);
	void insert_review(ReviewVO reviewVO);
	void insert_review_W(ReviewVO reviewVO);
	void insert_review_R(ReviewVO reviewVO);
	
	
	//워터파크 리뷰
	ArrayList<ReviewVO> getAllReviewWater()     throws Exception;
	
	ArrayList<ReviewVO> getAllReviewResort()     throws Exception;
	ArrayList<ReviewVO> getAllReviewPakage()     throws Exception;
	
	
	double getAverageReviewScore() throws Exception; //별점 평균
	//어드민
	ArrayList<ReviewVO> AllReviewWater()     throws Exception;
	ArrayList<ReviewVO> AllReviewResort()     throws Exception;
	ArrayList<ReviewVO> AllReviewPakage()     throws Exception;
	
	ReviewVO getadminRevinfoR(ReviewVO reviewVO);
	ReviewVO getadminRevinfoW(ReviewVO reviewVO);
	ReviewVO getadminRevinfoP(ReviewVO reviewVO);
	
	void deleteRevinfoW(ReviewVO reviewVO);
	void deleteRevinfoR(ReviewVO reviewVO);
	void deleteRevinfoP(ReviewVO reviewVO);
}
