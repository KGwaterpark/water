package com.water.park;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.water.park.service.MemberService;
import com.water.park.vo.MemberVO;
import com.water.park.vo.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

	// 본인확인
	@RequestMapping(value = "/che.do")
	public ResponseEntity<List<String>> iden(@RequestBody Map<String, Object> requestData) throws Exception {
		String imp_uid = (String) requestData.get("imp_uid");
		String token = memberService.getToken();
		List<String> name_tel = memberService.getName_getTel(token, imp_uid);
		return ResponseEntity.ok(name_tel);
	}

	// 네이버 로그인 후 정보 받기
	@RequestMapping(value = "/callback.do")
	public String callback() {
		return "member/callback";
	}

	// 네이버 로그인
	@RequestMapping(value = "/naverLogin.do")
	public String naver(HttpServletRequest request, @RequestParam("accessToken") String accessToken, Model model)
			throws Exception {
		MemberVO mvo = memberService.getNaverInfo(accessToken);
		HttpSession session = request.getSession();
		session.setAttribute("loginsession", mvo);
		session.setAttribute("msg", mvo.getM_name() + " 님 환영합니다");
		return "redirect: main.do";
	}

	@RequestMapping(value = "/loginprocess.do")
	public String memberLogin(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model,
			HttpServletRequest request) throws Exception {

		// MemberService를 통해 회원 로그인 처리
		MemberVO MemberLogin = memberService.memberLogin(id, pw);
		if (MemberLogin != null) {
			// 로그인 성공 시 MemberVO 객체를 모델에 추가하여 View에서 사용 가능하도록 함
			model.addAttribute("MemberLogin", MemberLogin);

			// 로그인 성공 시 세션에 회원 정보 저장
			HttpSession session = request.getSession();
			session.setAttribute("loginsession", MemberLogin);
			model.addAttribute("msg", MemberLogin.getM_name() + " 님 환영합니다");
			return "main"; // 로그인 성공 페이지로 이동
		} else {
			model.addAttribute("error", "로그인 실패");
			return "member/loginForm"; // 로그인 실패 시 다시 로그인 페이지로 이동
		}

	}

	// 회원가입
	@RequestMapping(value = "/memberjoin.do", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute("memberVO") MemberVO memberVO, Model model) {
		memberService.insertMember(memberVO);
		model.addAttribute("msg", memberVO.getM_name() + " 님 환영합니다");
		return "main";
	}

	// 아이디 중복확인
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam("m_id") String m_id) {
		int result = memberService.idCheck(m_id);
		if (result == 1) {
			return "fail";
		} else {
			return "success";
		}
	}

	// 로그인
	@RequestMapping("/login.do" + "")
	public String LoginPage() {
		return "/member/loginForm";
	}

	// 간편인증 후 회원가입폼 정보 가져가기 name tel
	@RequestMapping(value = "/memberInsertForm.do")
	public String memberInsertFormPage(@RequestParam("name") String name, @RequestParam("tel") String tel,@RequestParam("birthday")String birth,
			Model model) {
		model.addAttribute("name", name);
		model.addAttribute("tel", tel);
		model.addAttribute("birth",birth);
		return "/member/memberInsertForm";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String LooutPage(HttpSession session) {
		session.removeAttribute("loginsession");
		return "redirect:/main.do";
	}

	// 이미회원가입되어있..네요?
	@RequestMapping("/alReady.do")
	public String alReadyPage(@RequestParam("name") String name, @RequestParam("tel") String tel, Model model)
			throws Exception {
		// 아이디찾기
		String m_id = memberService.getMId1(name, tel);
		model.addAttribute("m_id", m_id);
		model.addAttribute("m_name", name);
		return "/member/alReady";
	}

	// pw 재설정
	@RequestMapping("/pwFindForm.do")
	public String pwFindFormPage() {
		return "/member/pwFindForm";
	}

	// 마이페이지
	@RequestMapping(value = "/mypagetinfo.do") // 쟾泥대낫湲
	public String mypageGetinfo(Model model) throws Exception {
		ArrayList<MemberVO> mvlist = memberService.getmyinfo();
		model.addAttribute("mvlist", mvlist);

		return "mypage/getMypage";
	}

	// 마이페이지
	@RequestMapping("/mypage.do")
	public String myPage(HttpSession session) {
		return "mypage/mypage";
	}

	// 회원 탈퇴
	@RequestMapping("/deletemypageinfo.do")
	public String deleteMypageinfo(HttpServletRequest rq, Model model) throws Exception {
		HttpSession session = rq.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginsession");
		memberService.deleteMypageinfo(mvo.getM_id());
		session.removeAttribute("loginsession");
		return "redirect: main.do";
	}


	@RequestMapping("/updateMember.do")
	public String updateMember(MemberVO memberVO, Model model) throws ClassNotFoundException {

		memberService.updateMember(memberVO);

		return "redirect:/memberAll.do";
	}

	// 클릭한 id 1명 보면서 수정 하는창 가기
	@RequestMapping(value = "/memberGet.do") // @ModelAttribute
	public String memberGet(@RequestParam("m_id") String m_id, Model model) throws Exception {

		// 여기에 정보 담아감
		MemberVO memberVO = memberService.memberGet(m_id);
		// 이 이름으로 보냄 정보
		model.addAttribute("memberVO", memberVO);

		return "/admin/adminMember/memberInfo"; // views에 있는 jsp로 // 한사람 보여주는 작업

	}


		@RequestMapping("/memberImg.do")
		public String memberImg() {
			return "/admin/adminMember/memberImg";
		}
	

	
	//-------------------------------------------------------------------------
	@RequestMapping(value = "/memberAll.do") // 회원조회 (페이징)
	public String Memberall(HttpServletRequest request, PageVO paging, Model model) throws Exception {
		int totalcount2 = memberService.getTotalCount2();
		int page3 = request.getParameter("page3") == null ? 1 : Integer.parseInt(request.getParameter("page3"));

		if (totalcount2 == 0)
			totalcount2 = 1;

		paging.setPageNo(page3); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(6); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount2);

		page3 = (page3 - 1) * 6 + 1; // select해오는 기준을 구한다.
		int page4 = page3 + 5;
		
		
		ArrayList<MemberVO> getAllMember = memberService.getList2(page3,page4);
		model.addAttribute("getAllMember", getAllMember);
		model.addAttribute("paging", paging);

		model.addAttribute("totalcount2", totalcount2);
		
		return "/admin/adminMember/memberAll";
	}

}
