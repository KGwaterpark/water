package com.water.park.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.water.park.vo.BookVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;


public interface BookService {
	ArrayList<BookVO> getAllBook()     throws Exception;
	ArrayList<BookVO> paymentAll(String token, String status, String search, String query,int sItem, int eItem)     throws Exception;
	ArrayList<BookVO> Booked_date(String indate, String outdate) throws Exception;
	BookVO rebook(HttpServletRequest rq,String indate, String outdate,String reType, int price) throws Exception;

	public void insertbook(Ocean_bookVO ocean_bookVO);
	public void insertbook(BookVO resort_bookVO);
	public void insertbook(Package_bookVO package_bookVO);
	
	Ocean_bookVO oceanbook(HttpServletRequest rq,  String selectedLocker,String indate2, int adultsCount,int teenagersCounts,int ocean_price) throws Exception;

	Ocean_bookVO waterpackbook(HttpServletRequest rq, String indate2, int adultsCount, int ocean_price);

	Ocean_bookVO allpackbook(HttpServletRequest rq, String indate2, int adultsCount, int ocean_price);
	String payCancle(String token,String merchant_uid,String reason, String type, String amount) throws Exception;
}
