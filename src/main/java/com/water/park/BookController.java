package com.water.park;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.water.park.service.BookService;
import com.water.park.vo.BookVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BookController {
   
   //테스트중
   
   @Resource(name = "bookService") 
      private BookService bookService; 
   
   
   @RequestMapping("/oceanpay.do")
	 public String oceanpay(HttpServletRequest rq,
			 @RequestParam("indate2") String indate2,
           @RequestParam("selectedLocker") String selectedLocker,
           @RequestParam("adultsCount") int adultsCount,
           @RequestParam("teenagersCount") int teenagersCount,
           @RequestParam("ocean_price") int ocean_price) throws Exception {
			
		 	bookService.oceanbook(rq,selectedLocker,indate2,adultsCount,teenagersCount,ocean_price);
		 	
		return "book/oc_payment";
	}
	@RequestMapping("/waterpackpay.do")
	public String waterpackpay(HttpServletRequest rq,
			 @RequestParam("indate2") String indate2,
			 @RequestParam("adultsCount") int adultsCount ,
			 @RequestParam("ocean_price") int ocean_price) {
			
		bookService.waterpackbook(rq,indate2,adultsCount,ocean_price);
		
		return "book/oc_payment";
}	 
		@RequestMapping("/allpackpay.do")
		public String allpackpay(HttpServletRequest rq,
				@RequestParam("indate2") String indate2,
				 @RequestParam("adultsCount") int adultsCount ,
				 @RequestParam("ocean_price") int ocean_price) {
			
			bookService.allpackbook(rq,indate2,adultsCount,ocean_price);
			
			return "book/oc_payment";
			
		}
   //예매 .jsp
    @RequestMapping("/book.do")
    public String BookPage() {
    	return "book/book"; 
    }
    
    
    //달력
    @RequestMapping("/datepicker.do")
    public String DatepickerPage() {
        return "datepicker"; 
    }
   
    //패키지 allpack
    @RequestMapping("/allpack.do")
    public String AllpackPage() {
        return "book/allpack"; 
    }
    
    //패키지 워터파크 + 카바나
    @RequestMapping("/waterpack.do")
    public String WaterpackPage() {
        return "book/waterpack"; 
    }
    
    //패키지 리조트+워터파크
    @RequestMapping("/resortpack.do")
    public String ResortapackPage() {
        return "book/resortpack"; 
    }
   
    // 팝업 올팩
    @RequestMapping("/pop_allpack.do")
    public String Popallpack() {
        return "book/pop_allpack"; 
    }
    
    // 팝업 워터팩
    @RequestMapping("/pop_waterpack.do")
    public String Popwaterpack() {
        return "book/pop_waterpack"; 
    }
    
    // 팝업 리조트
    @RequestMapping("/pop_resortpack.do")
    public String Popresortpack() {
        return "book/pop_resortpack"; 
    }
    
    // 선택할 날짜의 예약된 타입별 숙소 조회
    @RequestMapping("/booked_date.do")
    public @ResponseBody ArrayList<BookVO>  Booked_date(@RequestParam("indate") String indate,@RequestParam("outdate") String outdate) throws Exception {
    	ArrayList<BookVO> d = bookService.Booked_date(indate, outdate);
    	System.out.println(indate);
    	for(BookVO b : d) {
    		System.out.println("type: "+b.getRe_type() + "count"+b.getRESERVATION_COUNT());
    	}
    	return d;
    }
    @RequestMapping("/pay.do")
    public String pay(HttpServletRequest rq, @RequestParam("indate") String indate,   @RequestParam("outdate") String outdate,
        @RequestParam("reType") String reType,    @RequestParam("price") int price ) throws Exception{
    	bookService.rebook(rq,indate, outdate,reType,price);
    	return "book/payment";
    }
    
 // 결제 창
 	@RequestMapping("/payment.do")
 	public String Payment() {
 		return "payment";
 	}

 	// 결제 정보 db 넣기
 	@RequestMapping(value = "/paymentresult.do")
 	public String insertocean_book(HttpServletRequest request) {
 		HttpSession session = request.getSession();
 		Ocean_bookVO ovo = null;
 		BookVO rmvo = null;
 		Package_bookVO pmvo = null;

 		if (session.getAttribute("ocean_vo") != null) {
 			ovo = (Ocean_bookVO) session.getAttribute("ocean_vo");
 			bookService.insertbook(ovo);
 			return "book/ocpayfin";
 		} else if (session.getAttribute("book_vo") != null) {
 			rmvo = (BookVO) session.getAttribute("book_vo");
 			System.out.println(rmvo.getCheck_out_date());
 			System.out.println(rmvo.getCheck_in_date());
 			bookService.insertbook(rmvo);
 			return "book/payfin";
 		} else if (session.getAttribute("pmvo") != null) {
 			pmvo = (Package_bookVO) session.getAttribute("pmvo");
 			bookService.insertbook(pmvo);
 			return "book/papayfin";
 		}else {
 			return "main";
 		}

 	}
 	
 	//결제 api 실행
 	@RequestMapping("/payimsi.do")
 	public String Pay() {
 		
 		return "book/pay";
 	}
 	
 	
 	
}