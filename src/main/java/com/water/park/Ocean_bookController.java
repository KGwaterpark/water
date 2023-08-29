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
		ArrayList <Package_bookVO> packagelist = ocean_bookService.getAllPackageInfo();
		
		model.addAttribute("oceanlist",oceanlist);
		model.addAttribute("resortlist",resortlist);
		model.addAttribute("packagelist",packagelist);

		return "mypage/BookInfo"; 
		
	}
	
	@RequestMapping(value = "/BookcancelInfo.do")
	public String CencelAllInfo(Model model) throws Exception{
		
		ArrayList <Ocean_bookVO> oceanlist = ocean_bookService.getAllOceanInfo();
		ArrayList <BookVO> resortlist = ocean_bookService.getAllResortInfo();
		ArrayList <Package_bookVO> packagelist = ocean_bookService.getAllPackageInfo();

		
		model.addAttribute("oceanlist",oceanlist);
		model.addAttribute("resortlist",resortlist);
		model.addAttribute("packagelist",packagelist);


		return "mypage/BookcancelInfo"; 
		
	}
	
	@RequestMapping(value="/oc_sangseA.do")
	public String bookGetinfoA(@RequestParam("ocbook_id")int ocbook_id,Model model) {
		Ocean_bookVO ovo=ocean_bookService.getBookInfo(ocbook_id);
		model.addAttribute("ocean_bookVO", ovo);
		System.out.println(ocbook_id);
		return "admin/adminBook/GetOceanbook";
		
	}
	
	@RequestMapping(value="/re_sangseA.do")
	public String resortGetinfoA(@RequestParam("rebook_id")int rebook_id,Model model) {
		BookVO bvo2=ocean_bookService.getResortInfo(rebook_id);
		model.addAttribute("bookVO", bvo2);
		System.out.println(	rebook_id);
		return "admin/adminBook/GetResortbook";
	}
	
	@RequestMapping(value="/pa_sangseA.do")
	public String packageGetinfoA(@RequestParam("pabook_id")int pabook_id,Model model) {
		Package_bookVO pvo2=ocean_bookService.getPackageInfo(pabook_id);
		model.addAttribute("package_bookVO", pvo2);
		System.out.println(	pabook_id);
		return "admin/adminBook/GetPackagebook";
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
	@RequestMapping(value="/pa_sangse.do")
	public String packageGetinfo(@RequestParam("pabook_id")int pabook_id,Model model) {
		Package_bookVO pvo2=ocean_bookService.getPackageInfo(pabook_id);
		model.addAttribute("package_bookVO", pvo2);
		System.out.println(	pabook_id);
		return "mypage/GetPackagebook";
	}
	
	// 어드민 예약취소
	@RequestMapping(value="/updateinfoW.do")
	public String updateinfoW(@ModelAttribute("ocean_bookVO") Ocean_bookVO ocean_bookVO,
            @RequestParam("newState") String newState) throws ClassNotFoundException, SQLException {
			// 새로운 상태 설정
			ocean_bookVO.setState(newState);
				if ("N".equals(newState)) {
						// 데이터베이스에서 예약 상태를 "N"으로 업데이트
					ocean_bookService.updateinfoW(ocean_bookVO);
				}
				return "redirect:AdBookInfoW.do";
				}
	
	@RequestMapping(value="/updateinfoR.do")
	public String updateinfoR(@ModelAttribute("bookVO") BookVO bookVO,
            @RequestParam("newState") String newState) throws ClassNotFoundException, SQLException {
			// 새로운 상태 설정
			bookVO.setState(newState);
				if ("N".equals(newState)) {
						// 데이터베이스에서 예약 상태를 "N"으로 업데이트
					ocean_bookService.updateinfoR(bookVO);
				}
				return "redirect:AdBookInfoR.do";
				}
	
	@RequestMapping(value="/updateinfoP.do")
	public String updateinfoP(@ModelAttribute("Package_bookVO") Package_bookVO package_bookVO,
            @RequestParam("newState") String newState) throws ClassNotFoundException, SQLException {
			// 새로운 상태 설정
			package_bookVO.setState(newState);
				if ("N".equals(newState)) {
						// 데이터베이스에서 예약 상태를 "N"으로 업데이트
					ocean_bookService.updateinfoP(package_bookVO);
				}
				return "redirect:AdBookInfoP.do";
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
    @RequestMapping(value = "/AdBookInfoW.do")
   public String AdOceanAllInfo(Model model) throws Exception{
      
      ArrayList <Ocean_bookVO> oceanlist = ocean_bookService.getAllOceanInfo();
                     
      model.addAttribute("oceanlist",oceanlist);

      return "admin/adminBook/BookInfoW"; 
      
   }
    // 어드민 그거1이다~
    @RequestMapping(value = "/AdBookInfoR.do")
    public String AdResortAllInfo(Model model) throws Exception{
       
       ArrayList <BookVO> resortlist = ocean_bookService.getAllResortInfo();
       
       model.addAttribute("resortlist",resortlist);
       
       return "admin/adminBook/BookInfoR"; 
       
    }
    
    @RequestMapping(value = "/AdBookInfoP.do")
    public String AdOPackageAllInfo(Model model) throws Exception{
       
       ArrayList <Package_bookVO> packagelist = ocean_bookService.getAllPackageInfo();
       
       model.addAttribute("packagelist",packagelist);
       
       return "admin/adminBook/BookInfoP"; 
       
    }
    
 // 마이페이지 예약취소
 	@RequestMapping(value="/myupdateinfoW.do")
 	public String myupdateinfoW(@ModelAttribute("ocean_bookVO") Ocean_bookVO ocean_bookVO,
             @RequestParam("newState") String newState) throws ClassNotFoundException, SQLException {
 			// 새로운 상태 설정
 			ocean_bookVO.setState(newState);
 				if ("N".equals(newState)) {
 						// 데이터베이스에서 예약 상태를 "N"으로 업데이트
 					ocean_bookService.myupdateinfoW(ocean_bookVO);
 				}
 				return "redirect:BookInfo.do";
 				}
 	
 	@RequestMapping(value="/myupdateinfoR.do")
	public String myupdateinfoR(@ModelAttribute("bookVO") BookVO bookVO,
            @RequestParam("newState") String newState) throws ClassNotFoundException, SQLException {
			// 새로운 상태 설정
			bookVO.setState(newState);
				if ("N".equals(newState)) {
						// 데이터베이스에서 예약 상태를 "N"으로 업데이트
					ocean_bookService.myupdateinfoR(bookVO);
				}
				return "redirect:BookInfo.do";
				}
 	
 	@RequestMapping(value="/myupdateinfoP.do")
	public String myupdateinfoP(@ModelAttribute("Package_bookVO") Package_bookVO package_bookVO,
            @RequestParam("newState") String newState) throws ClassNotFoundException, SQLException {
			// 새로운 상태 설정
			package_bookVO.setState(newState);
				if ("N".equals(newState)) {
						// 데이터베이스에서 예약 상태를 "N"으로 업데이트
					ocean_bookService.myupdateinfoP(package_bookVO);
				}
				return "redirect:BookInfo.do";
				}
 	
 	
 	
}
