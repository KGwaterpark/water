package com.water.park.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.water.park.service.Ocean_bookService;
import com.water.park.service.dao.Ocean_bookDAO;
import com.water.park.vo.BookVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;

@Service("ocean_bookService")	
public class Ocean_bookServiceImpl implements Ocean_bookService{

		
		@Autowired //생성자
		private Ocean_bookDAO ocean_bookimsi;
		
		@Transactional
		public ArrayList <Ocean_bookVO> getAllOcean_book() {
			return ocean_bookimsi.getAllOcean_book();		
	}
		
		@Override
		public ArrayList<Ocean_bookVO> getAllOcean() throws Exception {
			// TODO Auto-generated method stub
			return null;
		}


		@Transactional
		public ArrayList<Ocean_bookVO> getAllOceanInfo(){
			return ocean_bookimsi.getAllOceanInfo();
		}
		
		public ArrayList<BookVO> getAllResortInfo(){
			return ocean_bookimsi.getAllResortInfo();
		}
		
		public ArrayList<Package_bookVO> getAllPackageInfo(){
			return ocean_bookimsi.getAllPackageInfo();
		}

		public Ocean_bookVO getOceanInfo(Ocean_bookVO ocean_bookVO) {
			return ocean_bookimsi.getOceanInfo(ocean_bookVO);
			
		}
		
		public Ocean_bookVO getBookInfo(int ocbook_id) {
			System.out.println(ocbook_id);
			return ocean_bookimsi.getBookInfo(ocbook_id);
			
		}
		
	
		@Override
		public void updateResortinfo(BookVO resort_bookVO) {
			ocean_bookimsi.updateResortinfo(resort_bookVO);
		}

		@Override
		public BookVO getResortInfo(int rebook_id) {
			return ocean_bookimsi.getResortInfo(rebook_id);
		}
		
		@Override
		public Package_bookVO getPackageInfo(int pabook_id) {
		// TODO Auto-generated method stub
		return ocean_bookimsi.getPackageInfo(pabook_id);
		}

		@Override
		public void updateinfoW(Ocean_bookVO ocean_bookVO) {
		// TODO Auto-generated method stub
		ocean_bookimsi.updateinfoW(ocean_bookVO);
		}

		@Override
		public void updateinfoR(BookVO bookVO) {
		// TODO Auto-generated method stub
		ocean_bookimsi.updateinfoR(bookVO);
		}

		@Override
		public void updateinfoP(Package_bookVO package_bookVO) {
		// TODO Auto-generated method stub
		ocean_bookimsi.updateinfoP(package_bookVO);

		}

		
		
}