package com.water.park;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
    
	
    @RequestMapping("/main.do")
    public String MainPage(HttpSession session,Model model) {
    	String msg=(String)session.getAttribute("msg");
    	model.addAttribute("msg", msg);
    	session.removeAttribute("msg");
        return "main"; // main.jsp로 이동
    }
    
	//가격표
    @RequestMapping("/price.do")
    public String PricePage() {
        return "/headerservice/price"; 
    }
	
    //입장안내
    @RequestMapping("/ibjang.do")
    public String IbjangPage() {
        return "/headerservice/ibjang";
    }
	
    //워터파크 > 워터파크 전체보기
    @RequestMapping("/parkMap.do")
    public String ParkMapPage() {
        return "/headerservice/parkMap"; 
    
    }
    //버스안내
    @RequestMapping("/busAnnae.do")
    public String busAnnaePage() {
        return "/main/busAnnae"; 
    
    }
    
    //셔틀버스 이용안내
    @RequestMapping("/stbusAnnae.do")
    public String stbusAnnaePage() {
        return "/main/stbusAnnae"; 
    
    }
    
	
	//애기풀
    @RequestMapping("/child.do")
    public String childPage() {
        return "/headerservice/child"; 
    
    }
    //유아용풀
    @RequestMapping("/child2.do")
    public String child2Page() {
        return "/headerservice/child2"; 
    
    }   
    
    //야외풀
    @RequestMapping("/wpark.do")
    public String wparkPage() {
        return "/headerservice/wpark"; 

    }    
    //야외파도풀
    @RequestMapping("/wpark2.do")
    public String wpark2Page() {
        return "/headerservice/wpark2"; 
    
    }
	
    //이용안내
    @RequestMapping("/2young.do")
    public String eyoungPage() {
        return "/headerservice/2young"; 
    
    }
    
    
	//간편인증
    @RequestMapping("/Identification.do")
    public String Identification() {
    	return "member/Identification"; // main.jsp로 이동
    }
	
	
	//컨벤션
    @RequestMapping("/wedding.do")
    public String weddingPage() {
    	return "wedding/Wmain";
    }
    
    //에러 테스트
    @RequestMapping("/error.do")
    public String errorPage() {
    	return "/error";
    }
    
    @RequestMapping("/sss.do")
    public String asdPage() {
    	return "/ss";
    }
	
}
