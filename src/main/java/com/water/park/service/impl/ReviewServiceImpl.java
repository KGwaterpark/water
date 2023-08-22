package com.water.park.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.water.park.service.ReviewService;
import com.water.park.service.dao.ReviewDAO;
import com.water.park.vo.ReviewVO;

	@Service("reviewService")		//DAO
	public class ReviewServiceImpl implements ReviewService{

		
		@Autowired //생성자
		private ReviewDAO reviewimsi;
		
		
		//마이페이지
		
		@Override
		public ArrayList<ReviewVO> getAllReview() throws Exception {
			// TODO Auto-generated method stub
			return reviewimsi.getAllReview();
		}
		public ReviewVO getRevinfo(ReviewVO reviewVO) {
			return reviewimsi.getRevinfo(reviewVO); 
				
		}
		
		@Override
		public void updateRevinfo(ReviewVO reviewVO) {
		    reviewimsi.updateRevinfo(reviewVO);
		}
		
		public void deleteRevinfo(ReviewVO reviewVO) {
			reviewimsi.deleteRevinfo(reviewVO);
		}
		
		public void insert_review(ReviewVO reviewVO) {
			reviewimsi.insert_review(reviewVO); 
		}
		
		public void insert_review_W(ReviewVO reviewVO) {
			reviewimsi.insert_review_W(reviewVO); 
		}
		
		public void insert_review_R(ReviewVO reviewVO) {
			reviewimsi.insert_review_R(reviewVO); 
		}
		
		//워터파크 
		
		@Transactional
		public ArrayList<ReviewVO> getAllReviewWater(){
			return reviewimsi.getAllReviewWater();
		}
		@Transactional
		public ArrayList<ReviewVO> getAllReviewResort(){
			return reviewimsi.getAllReviewResort();
		}
		@Transactional
		public ArrayList<ReviewVO> getAllReviewPakage(){
			return reviewimsi.getAllReviewPakage();
		}
		
		//어드민
		@Transactional
		public ArrayList<ReviewVO> AllReviewWater(){
			return reviewimsi.AllReviewWater();
		}
		@Transactional
		public ArrayList<ReviewVO> AllReviewResort(){
			return reviewimsi.AllReviewResort();
		}
		
		@Transactional
		public ArrayList<ReviewVO> AllReviewPakage(){
			return reviewimsi.AllReviewPakage();
		}
		
		
		public ReviewVO getadminRevinfoW(ReviewVO reviewVO) {
			return reviewimsi.getadminRevinfoW(reviewVO); 
				
		}
		public ReviewVO getadminRevinfoR(ReviewVO reviewVO) {
			return reviewimsi.getadminRevinfoR(reviewVO); 
				
		}
		public ReviewVO getadminRevinfoP(ReviewVO reviewVO) {
			return reviewimsi.getadminRevinfoP(reviewVO); 
				
		}
		
		public void deleteRevinfoW(ReviewVO reviewVO) {
			reviewimsi.deleteRevinfoW(reviewVO);
		}
		public void deleteRevinfoR(ReviewVO reviewVO) {
			reviewimsi.deleteRevinfoR(reviewVO);
		}
		public void deleteRevinfoP(ReviewVO reviewVO) {
			reviewimsi.deleteRevinfoP(reviewVO);
		}
		
		
		
		
		@Override //별점 평균값
		public double getAverageReviewScore() throws Exception {
		    ArrayList<ReviewVO> revlist = reviewimsi.getAllReview();

		    if (revlist.isEmpty()) {
		        return 0.0; // 빈 리스트인 경우 평균값은 0으로 반환
		    }

		    double totalScore = 0.0;
		    for (ReviewVO review : revlist) {
		        totalScore += review.getRev_score();
		    }

		    return totalScore / revlist.size();
		}
		
		
}
