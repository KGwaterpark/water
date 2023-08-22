package com.water.park; 
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date; 
import java.util.Locale; 
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.water.park.service.GongjiService;
import com.water.park.vo.GongjiVO; 
/** 
 *  Handles requests for the application home page. */ 

@Controller 
public class GongjiController { 
	
	@Resource(name = "gongjiService") 
	private GongjiService gongjiService;
	

	
	//공지사항 페이지 이동
	@RequestMapping("/gongjiWrite.do")
	  public String gongjiWritePage() {
        return "/admin/adminRegister/gongjiWrite"; 
    }
    // 작성된 공지사항 등록
    @RequestMapping(value = "/write.do", method = RequestMethod.POST)
    public String writeGongji(@ModelAttribute("gongjiVO") GongjiVO gongjiVO) {
        gongjiService.insertGongji(gongjiVO);
        return "redirect:getAllGongji.do";
    }

    
    // 공지사항 리스트 페이지 이동
    @RequestMapping("/getAllGongji.do")
    public String getAllGongjiPage(Model model) {
        try {
            ArrayList<GongjiVO> getAllGongji = gongjiService.getAllGongji();
            model.addAttribute("getAllGongji", getAllGongji);
        } catch (Exception e) {
            // Handle exceptions here
            e.printStackTrace();
        }
        return "/admin/adminRegister/getAllGongji";
    }
    
    //공지 하나 클릭해서 상세보기
	 @RequestMapping(value="/gongjiGet.do") //@ModelAttribute
	 public String memberGet(@RequestParam("g_title") String g_title , Model model) throws Exception{

		 		//여기에 정보 담아감
		 GongjiVO gongjiVO = gongjiService.gongjiGet(g_title);
		 					// 이 이름으로 보냄 정보
		 model.addAttribute("gongjiVO", gongjiVO);
		 
		 return "/admin/adminRegister/gongjiInfo";

    
	}
	 
	 //공지 수정
	 @RequestMapping("/updateGongji.do")
	 public String updateGongji(GongjiVO gongjiVO) 
	 throws ClassNotFoundException, SQLException{
	     gongjiService.updateGongji(gongjiVO);
	     return "redirect:/getAllGongji.do";
	 }
	 
	 //공지삭제
	 @RequestMapping("/deleteGongji.do")
	 public String deleteGongji(@RequestParam("g_id") int g_id )
			 throws ClassNotFoundException, SQLException{
		 
		 gongjiService.deleteGongji(g_id);
		
		 return "redirect:/getAllGongji.do";
	 }
	 
	
	    // Main공지사항 리스트 페이지 
	    @RequestMapping("/MgetAllGongji.do")
	    public String MgetAllGongjiPage(Model model) {
	        try {
	            ArrayList<GongjiVO> getAllGongji = gongjiService.getAllGongji();
	            model.addAttribute("getAllGongji", getAllGongji);
	        } catch (Exception e) {
	            // Handle exceptions here
	            e.printStackTrace();
	        }
	        return "/main/MgetAllGongji";
	    }
	  
	    //Main 공지 하나 클릭해서 상세보기
		 @RequestMapping(value="/MgongjiGet.do") //@ModelAttribute
		 public String MmemberGet(@RequestParam("g_title") String g_title , Model model) throws Exception{

			 		//여기에 정보 담아감
			 GongjiVO gongjiVO = gongjiService.gongjiGet(g_title);
			 					// 이 이름으로 보냄 정보
			 model.addAttribute("gongjiVO", gongjiVO);
			 
			 return "/main/MgongjiInfo";
		 } 
		 //어드민 매인 페이지
		    @RequestMapping("/admin.do")
		    public String adminPage() {
		       return "/admin/adminMain";
		    }    
		    //어드민 매인 로딩
		    @RequestMapping("/adminLoding.do")
		    public String adminLodingPage() {
		       return "/admin/adminLoding";
		    }   
		    
		    
		   
	    
}// end

