package com.water.park.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.water.park.vo.BookVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;


public interface BookService {
	ArrayList<BookVO> getAllBook()     throws Exception;
	ArrayList<BookVO> Booked_date(String indate, String outdate) throws Exception;
	BookVO rebook(HttpServletRequest rq,String indate, String outdate,String reType, int price) throws Exception;

	public void insertbook(Ocean_bookVO ocean_bookVO);
	public void insertbook(BookVO resort_bookVO);
	public void insertbook(Package_bookVO package_bookVO,BookVO resort_bookVO);
	public void insertallpackbook(Package_bookVO package_bookVO);
	public void insertwaterpackbook(Package_bookVO package_bookVO);
	public void insertresortpackbook( Package_bookVO package_bookVO , BookVO resort_bookVO);
	Ocean_bookVO oceanbook(HttpServletRequest rq,  String selectedLocker,String indate2, int adultsCount,int teenagersCounts,int ocean_price) throws Exception;


	Package_bookVO waterpackbook2(HttpServletRequest rq, int adultsCount, String indate, int ocean_price, String outdate);
	
	Package_bookVO resortpackbook(HttpServletRequest rq, String re_type, int adultsCount, String indate,String outdate, int repack_price );
	
	Package_bookVO allpackbook2(HttpServletRequest rq, int adultsCount, String indate, int allpack_price, String outdate);
	
	
	
}
