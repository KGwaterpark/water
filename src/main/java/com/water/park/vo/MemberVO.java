package com.water.park.vo;

public class MemberVO {
	private String m_id;
	private String m_pw;
	private String m_tel;
	private String m_name;
	private String m_email;
	private String m_birth;
	private String m_gender;
	private int m_age;


	public int getM_age() {
		return m_age;
	}

	public void setM_age(int m_age) {
		this.m_age = m_age;
	}

	/*
	 * mail_key는 TempKey.java에서 생성한 난수를 저장하는 데에 사용되며,
	 * 
	 * mail_auth는 기본값 0을 넣어 놓고, 이메일 인증을 했을 경우 값을 1로 변경시켜 로그인이 가능하게 합니다.
	 */
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	@Override
	public String toString() {
		return "MemberVO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_tel=" + m_tel + ", m_name=" + m_name + ", m_email="
				+ m_email + ", m_birth=" + m_birth + ", m_gender=" + m_gender + ", m_age=" + m_age + "]";
	}

}
