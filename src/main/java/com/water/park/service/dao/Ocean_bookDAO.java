package com.water.park.service.dao;

import java.util.ArrayList;

import com.water.park.vo.BookVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;

public interface Ocean_bookDAO {

	ArrayList<Ocean_bookVO> getAllOcean_book();

	ArrayList<Ocean_bookVO> getAllOceanInfo();

	ArrayList<BookVO> getAllResortInfo();
	
	ArrayList<Package_bookVO> getAllPackageInfo();
	

	Ocean_bookVO getOceanInfo(Ocean_bookVO ocean_bookVO);

	Ocean_bookVO getBookInfo(Ocean_bookVO ocean_bookVO);


	void updateResortinfo(BookVO resort_bookVO);

	Ocean_bookVO getBookInfo(int ocbook_id);
	BookVO getResortInfo(int rebook_id);
	Package_bookVO getPackageInfo(int pabook_id);
	
	void updateinfoW(Ocean_bookVO ocean_bookVO);
	void updateinfoR(BookVO bookVO);
	void updateinfoP(Package_bookVO package_bookVO);

}
