package com.water.park;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.water.park.service.Ocean_bookService;
import com.water.park.vo.BookVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Ocean_bookController {
	
	@Resource(name = "ocean_bookService") 
	   private Ocean_bookService ocean_bookService; 
	
	
	//예약내역
	@RequestMapping(value = "/BookInfo.do")
	public String OceanAllInfo(Model model) throws Exception{
		
		ArrayList <Ocean_bookVO> oceanlist = ocean_bookService.getAllOceanInfo();
		ArrayList <BookVO> resortlist = ocean_bookService.getAllResortInfo();

		
		model.addAttribute("oceanlist",oceanlist);
		model.addAttribute("resortlist",resortlist);


		return "mypage/BookInfo"; 
		
	}
	
	@RequestMapping(value="/oc_sangse.do")
	public String bookGetinfo(@RequestParam("ocbook_id")int ocbook_id,Model model) {
		Ocean_bookVO ovo=ocean_bookService.getBookInfo(ocbook_id);
		model.addAttribute("ocean_bookVO", ovo);
		System.out.println(ocbook_id);
		return "mypage/GetOceanbook";
		
	}
	@RequestMapping(value="/re_sangse.do")
	public String resortGetinfo(@RequestParam("rebook_id")int rebook_id,Model model) {
		BookVO bvo2=ocean_bookService.getResortInfo(rebook_id);
		model.addAttribute("bookVO", bvo2);
		System.out.println(	rebook_id);
		return "mypage/GetResortbook";
	}
	
	

	@RequestMapping(value="/updateresortinfo.do")
	public String updateresortinfo(BookVO resort_bookVO) throws ClassNotFoundException, SQLException{ 
		 if ("예약취소".equals(resort_bookVO.getState())) {
		        // 예약 상태를 업데이트
		        ocean_bookService.updateResortinfo(resort_bookVO);
		    }
		  return "redirect:BookInfo.do";
		
	
	}
	
	//리뷰
	@RequestMapping(value="/rev_getinfoW.do")
	public String oceanGetinfo(@ModelAttribute("Ocean_bookVO") Ocean_bookVO Ocean_bookVO,Model model ) {
		/* ocean_bookService.getOceanInfo(Ocean_bookVO); */
	 
		return "review/revInsertFormW";
	
	}
	@RequestMapping(value="/rev_getinfoR.do")
	public String resortGetinfo(@ModelAttribute("Ocean_bookVO") Ocean_bookVO Ocean_bookVO,Model model ) {
		/* ocean_bookService.getOceanInfo(Ocean_bookVO); */
	 
		return "review/revInsertFormR";
	
	}
	// 어드민 그거다
    @RequestMapping(value = "/AdBookInfo.do")
   public String AdOceanAllInfo(Model model) throws Exception{
      
      ArrayList <Ocean_bookVO> oceanlist = ocean_bookService.getAllOceanInfo();
                     
      model.addAttribute("oceanlist",oceanlist);

      return "admin/adminBook/BookInfo"; 
      
   }
    // 어드민 그거1이다~
    @RequestMapping(value = "/AdBookInfo1.do")
    public String AdOceanAllInfo1(Model model) throws Exception{
       
       ArrayList <BookVO> resortlist = ocean_bookService.getAllResortInfo();
       
       model.addAttribute("resortlist",resortlist);
       
       return "admin/adminBook/BookInfo1"; 
       
    }
   
}
