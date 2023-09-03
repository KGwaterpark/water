package com.water.park;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.water.park.service.GongjiService;
import com.water.park.vo.GongjiVO;
import com.water.park.vo.PageVO;

/**
 * Handles requests for the application home page.
 */

@Controller
public class GongjiController {

	@Resource(name = "gongjiService")
	private GongjiService gongjiService;

	// 공지사항 페이지 이동
	@RequestMapping("/gongjiWrite.do")
	public String gongjiWritePage() {
		return "/admin/adminRegister/gongjiWrite";
	}

	// 작성된 공지사항 등록
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String writeGongji(@ModelAttribute("gongjiVO") GongjiVO gongjiVO) {
		gongjiService.insertGongji(gongjiVO);
		return "redirect:AgetAllGongji.do";
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

	// 공지 하나 클릭해서 상세보기
	@RequestMapping(value = "/gongjiGet.do") // @ModelAttribute
	public String memberGet(@RequestParam("g_id") int g_id, Model model) throws Exception {

		// 여기에 정보 담아감
		GongjiVO gongjiVO = gongjiService.gongjiGet(g_id);
		// 이 이름으로 보냄 정보
		model.addAttribute("gongjiVO", gongjiVO);

		return "/admin/adminRegister/gongjiInfo";

	}

	// 공지 수정
	@RequestMapping("/updateGongji.do")
	public String updateGongji(GongjiVO gongjiVO) throws ClassNotFoundException, SQLException {
		gongjiService.updateGongji(gongjiVO);
		return "redirect:/AgetAllGongji.do";
	}

	// 공지삭제
	@RequestMapping("/deleteGongji.do")
	public String deleteGongji(@RequestParam("g_id") int g_id) throws ClassNotFoundException, SQLException {

		gongjiService.deleteGongji(g_id);

		return "redirect:/AgetAllGongji.do";
	}
	
	//메인 - 공지슬라이드
	@RequestMapping("/MgonggiS.do")
	public String MgetAllGongjiSPage(HttpServletRequest request, PageVO paging, Model model) throws Exception {
		int totalcount = gongjiService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(6); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);

		page = (page - 1) * 6 + 1; // select해오는 기준을 구한다.
		int page2 = page + 5;

		ArrayList<GongjiVO> getAllGongji2 = gongjiService.getList(page, page2);
		model.addAttribute("getAllGongji2", getAllGongji2);
		model.addAttribute("paging", paging);
		return "/main/MgonggiS";
	}
	// Main 공지 하나 클릭해서 상세보기
	@RequestMapping(value = "/MgongjiGet.do") // @ModelAttribute
	public String MmemberGet(@RequestParam("g_id") int g_id, Model model) throws Exception {

		// 여기에 정보 담아감
		GongjiVO gongjiVO = gongjiService.gongjiGet(g_id);
		// 이 이름으로 보냄 정보
		model.addAttribute("gongjiVO", gongjiVO);

		return "/main/MgongjiInfo";
	}

	// 어드민 매인 페이지
	@RequestMapping("/admin.do")
	public String adminPage() {
		return "/admin/adminMain";
	}

	// 어드민 매인 로딩
	@RequestMapping("/adminLoding.do")
	public String adminLodingPage() {
		return "/admin/adminLoding";
	}

	// --------------------------------------------------------------------------

	// 공지 전체보기 (페이징)
	@RequestMapping("/MgetAllGongji.do")
	public String MgetAllGongjiPage(HttpServletRequest request, PageVO paging, Model model) throws Exception {
		int totalcount = gongjiService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(6); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);

		page = (page - 1) * 6 + 1; // select해오는 기준을 구한다.
		int page2 = page + 5;

		ArrayList<GongjiVO> getAllGongji2 = gongjiService.getList(page, page2);
		model.addAttribute("getAllGongji2", getAllGongji2);
		model.addAttribute("paging", paging);
		return "/main/MgetAllGongji";
	}
	
	//관리자 공지전체보기 (페이징)
	@RequestMapping("/AgetAllGongji.do")
	public String AgetAllGongjiPage(HttpServletRequest request, PageVO paging, Model model) throws Exception {
		int totalcount = gongjiService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(6); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);

		page = (page - 1) * 6 + 1; // select해오는 기준을 구한다.
		int page2 = page + 5;

		ArrayList<GongjiVO> getAllGongji2 = gongjiService.getList(page, page2);
		model.addAttribute("getAllGongji2", getAllGongji2);
		model.addAttribute("paging", paging);
		return "/admin/adminRegister/getAllGongji";
	}

	 //공지 검색 (페이징)
	@RequestMapping(value = "/gongjiPageFilter.do")
	public String gongjiPageFilter(@RequestParam("gongjiFilter") String gongjiFilter,
			@RequestParam("gongjiSearch") String gongjiSearch, HttpServletRequest request, PageVO paging, Model model)
			throws Exception {
		
		String gongjiSearch2 = "%" + gongjiSearch.toUpperCase() + "%";
	
		int totalcount = gongjiService.getFilterTotal(gongjiFilter, gongjiSearch2);

		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 받은 page변수, 현재 페이지 번호
		paging.setPageSize(6); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);

		page = (page - 1) * 6 + 1; // select해오는 기준을 구한다.
		int page2 = page + 5;
		

		ArrayList<GongjiVO> getAllGongji2 = gongjiService.getFilterList(gongjiFilter, gongjiSearch2, page, page2);

		model.addAttribute("getAllGongji2", getAllGongji2);
		model.addAttribute("paging", paging);

		return "/main/MgetAllGongji";
	}
	
	 //공지 검색 (페이징)
	@RequestMapping(value = "/gongjiPageFilter2.do")
	public String gongjiPageFilter2(@RequestParam("gongjiFilter") String gongjiFilter,
			@RequestParam("gongjiSearch") String gongjiSearch, HttpServletRequest request, PageVO paging, Model model)
			throws Exception {
		
		String gongjiSearch2 = "%" + gongjiSearch.toUpperCase() + "%";
	
		int totalcount = gongjiService.getFilterTotal(gongjiFilter, gongjiSearch2);

		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 받은 page변수, 현재 페이지 번호
		paging.setPageSize(6); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);

		page = (page - 1) * 6 + 1; // select해오는 기준을 구한다.
		int page2 = page + 5;

		ArrayList<GongjiVO> getAllGongji2 = gongjiService.getFilterList(gongjiFilter, gongjiSearch2, page, page2);

		model.addAttribute("getAllGongji2", getAllGongji2);
		model.addAttribute("paging", paging);

		return "/admin/adminRegister/getAllGongji";
	}
	
	


}// end
