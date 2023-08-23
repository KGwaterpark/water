package com.water.park.service.impl;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.water.park.service.BookService;
import com.water.park.service.dao.BookDAO;
import com.water.park.vo.BookVO;
import com.water.park.vo.MemberVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;


@Service("bookService")		//DAO
public class BookServiceImpl implements BookService {
//깃 다시!!!!!
	
	@Autowired //생성자
	private BookDAO bookdao;
	
	@Transactional
	public ArrayList <BookVO> getAllBook() {
		return bookdao.getAllBook();
	}
	
	
	
	@Override
	public ArrayList<BookVO> Booked_date(String indate, String outdate) throws Exception {
		 return bookdao.getBooked(outdate,indate);
	}
	
	// 숙박 예약정보를 세션에 저장
	@Override
	public BookVO rebook(HttpServletRequest rq, String indate, String outdate, String reType, int price) throws Exception {
		HttpSession session = rq.getSession();
		MemberVO mvo= (MemberVO) session.getAttribute("loginsession");
	    BookVO bvo = new BookVO(0, mvo.getM_id(),reType,indate,outdate,price);
		session.setAttribute("book_vo", bvo);
		return bvo;
	}
	
	@Override
	public void insertbook(Ocean_bookVO ocean_bookVO) {
		// TODO Auto-generated method stub
		bookdao.insertocean_book(ocean_bookVO);
	}

	//숙박 예약정보를 DB에 삽임
	@Override
	public void insertbook(BookVO resort_bookVO) {
		if(resort_bookVO.getRe_type2().equals("패밀리 스탠다드")) {
			resort_bookVO.setRe_type2("f_stand");
		}else if(resort_bookVO.getRe_type2().equals("패밀리 프리미엄")) {
			resort_bookVO.setRe_type2("f_prem");
		}else if(resort_bookVO.getRe_type2().equals("스위트 스탠다드")) {
			resort_bookVO.setRe_type2("s_stand");
		}else if(resort_bookVO.getRe_type2().equals("스위트 프리미엄")) {
			resort_bookVO.setRe_type2("s_prem");
		}
		bookdao.insertresort_book(resort_bookVO);
	}

	@Override
	public void insertbook(Package_bookVO package_bookVO) {
		bookdao.insertpackage_book(package_bookVO);
	}
	
	// 워터파크 예약 정보를 세션에 저장
	@Override
	public Ocean_bookVO oceanbook(HttpServletRequest rq,String selectedLocker,String indate2, int adultsCount, int teenagersCount,
			int ocean_price) {
		HttpSession session = rq.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("loginsession");
		long currentTime =new Date().getTime();
		int ocbook_id= (int)currentTime;
		Ocean_bookVO ovo =new Ocean_bookVO(ocbook_id,mvo.getM_id(),selectedLocker,indate2,adultsCount,teenagersCount,ocean_price);
		session.setAttribute("ocean_vo", ovo);
		return ovo;
		// TODO Auto-generated method stub
		
	}



	// 워터파트 패키지 예약 정보를 세션에 저장
	@Override
	public Ocean_bookVO waterpackbook(HttpServletRequest rq, String indate2, int adultsCount, int ocean_price) {
		HttpSession session = rq.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("loginsession");
		long currentTime =new Date().getTime();
		int ocbook_id= (int)currentTime;
		Ocean_bookVO ovo= new Ocean_bookVO(ocbook_id,mvo.getM_id(),"실내락커",indate2,adultsCount,0,ocean_price);
		// TODO Auto-generated method stub
		session.setAttribute("ocean_vo", ovo);
		return ovo;
	}




	// 올패키지 예약정보를 세션에 저장
	@Override
	public Ocean_bookVO allpackbook(HttpServletRequest rq, String indate2, int adultsCount, int ocean_price) {
		HttpSession session = rq.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("loginsession");
		long currentTime =new Date().getTime();
		int ocbook_id= (int)currentTime;
		Ocean_bookVO ovo= new Ocean_bookVO(ocbook_id,mvo.getM_id(),"팬트하우스",indate2,adultsCount,0,ocean_price);
		session.setAttribute("ocean_vo", ovo);
		return ovo;
	}
	
	
}
