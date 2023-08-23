package com.water.park.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.water.park.vo.MemberVO;

public interface MemberDAO {

	ArrayList<MemberVO> getAllMember();

	MemberVO memberLogin(String m_id);
	void deleteMember(String m_id);
	void updateMember(MemberVO memberVO);
	void insertMember(MemberVO memberVO);
	int idCheck(String m_id);
	int telCheck(String tel);
	String getMId(@Param("name") String name, @Param("tel") String tel, @Param("birthday") String birthday);
	// 마이페이지
	ArrayList<MemberVO> getmyinfo();

	void deleteMypageinfo(MemberVO memberVO);

	MemberVO memberGet(String m_id);
}
