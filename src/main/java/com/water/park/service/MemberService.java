package com.water.park.service;

import java.util.ArrayList;

import com.water.park.vo.GongjiVO;
import com.water.park.vo.MemberVO;

public interface MemberService {

	ArrayList<MemberVO> getAllMember() throws Exception;

	public String getToken() throws Exception;

	public String getMId(String name, String tel, String birthday) throws Exception;

	public ArrayList<String> getName_getTel(String token, String imp_uid) throws Exception;

	public MemberVO memberLogin(String id, String pw) throws Exception;

	public int idCheck(String m_id);

	public void insertMember(MemberVO memberVO);

	public MemberVO getNaverInfo(String token) throws Exception;

	// 마이페이지
	ArrayList<MemberVO> getmyinfo() throws Exception;

	void deleteMypageinfo(String m_id);

	// 회원 업데이트
	public void updateMember(MemberVO memberVO);

	// 회원 한명 불러오기
	MemberVO memberGet(String m_id);

	public String getMId1(String name, String tel);

	
	//회원조회 (페이징)
	int getTotalCount2();
	
	ArrayList<MemberVO> getList2(int page3, int page4) throws Exception;
	
	//회원 검색 (페이징)
	int getFilterTotal(String memberFilter, String memberSearch);

	ArrayList<MemberVO> getFilterList(String memberFilter, String memberSearch2, int page3, int page4);

}
