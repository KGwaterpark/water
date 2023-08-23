package com.water.park.service.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.water.park.service.MemberService;
import com.water.park.service.dao.MemberDAO;
import com.water.park.vo.MemberVO;
@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired // 생성자
	private MemberDAO memberdao;

	@Autowired // 생성자
	private BCryptPasswordEncoder pwEnc;

	@Transactional
	public ArrayList<MemberVO> getAllMember() {
		return memberdao.getAllMember();
	}

	@Transactional
	public ArrayList<MemberVO> getmyinfo() {
		return memberdao.getmyinfo();
	}
	
	// 토큰 발급
	@Override
	public String getToken() throws Exception {
		String key = "4366315235245073";
		String sekey = "c91463bGsFoM2rQPkwPU6suCmNPxjlXwvocDhDazRYNB8D3e8JWoISqNyESpvJGaPrqnF09dky5fm8BO";

		String apiUrl = "https://api.iamport.kr/users/getToken";
		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		// 요청 메소드 설정 (POST 방식)
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);

		// 요청 데이터 설정
		String postData = "imp_key=" + key + "&imp_secret=" + sekey;
		byte[] postDataBytes = postData.getBytes("UTF-8");

		// 요청 헤더 설정
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));

		// 요청 데이터 전송
		DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
		dos.write(postDataBytes);
		dos.flush();
		dos.close();

		// 응답 상태 코드 확인
		int responseCode = conn.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) {
			// 응답 데이터 가져오기
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String inputLine;
			StringBuffer response1 = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response1.append(inputLine);
			}
			in.close();

			// 응답 데이터 출력
			JSONObject jsonResponse = new JSONObject(response1.toString());
			if (jsonResponse.has("response")) {
				JSONObject responseObj = jsonResponse.getJSONObject("response");
				String access_token = responseObj.getString("access_token");
				// 토큰을 사용하여 다시 API에 요청하여 인증 정보를 조회
				return access_token;
			} else {
				return "response X";
			}
		} else {
			return "token X";
		}
	}

	// 인증된 회원의 이름, 전화번호 가져오기
	@Override
	public ArrayList<String> getName_getTel(String token, String imp_uid) throws Exception {
		ArrayList<String> nametel = new ArrayList<String>();

		String apiUrl2 = "https://api.iamport.kr/certifications/" + imp_uid;
		URL url2 = new URL(apiUrl2);
		HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection(); // 변수 이름을 conn2로 변경

		// 요청 메소드 설정 (GET 방식)
		conn2.setRequestMethod("GET");
		conn2.setRequestProperty("Authorization", token);

		// 응답 상태 코드 확인
		int responseCode2 = conn2.getResponseCode();
		if (responseCode2 == HttpURLConnection.HTTP_OK) {
			// 응답 데이터 가져오기
			BufferedReader in2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
			String inputLine2;
			StringBuffer certificationsInfo = new StringBuffer();

			while ((inputLine2 = in2.readLine()) != null) {
				certificationsInfo.append(inputLine2);
			}
			in2.close();

			// 인증 정보 출력
			JSONObject jsonResponse2 = new JSONObject(certificationsInfo.toString());
			JSONObject responseObj2 = jsonResponse2.getJSONObject("response");
			String name = responseObj2.getString("name");
			String phone = responseObj2.getString("phone");
			String birthday = responseObj2.getString("birthday");
			String formattedTel = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
			nametel.add(name);
			nametel.add(formattedTel);
			nametel.add(birthday);
			int telch = memberdao.telCheck(formattedTel);
			if (telch > 0) {
				String m_id= getMId(name,formattedTel,birthday);
				nametel.add(m_id);
			} 
			return nametel;

		} else {
			System.out.println("인증 정보 조회 실패: " + responseCode2);
			return null;
		}
	}

	@Override
	public MemberVO memberLogin(String id, String pw) throws Exception {
		MemberVO mvo = memberdao.memberLogin(id);

		if (id.equals("admin") && pw.equals("admin")) {
			return null;

		} else if (mvo == null) {
			// db에 없는 정보
			return null;
		} else if (!pwEnc.matches(pw, mvo.getM_pw())) {
			// DB에 비밀번호와 입력한 비밀번호가 다를 경우
			return null;
		} else {
			// 어드민 계정이 아닌 경우
			/* session.setAttribute("id", id); */
			return mvo;
		}
	}

	@Override
	   public int idCheck(String m_id) {
	      if(m_id.contains("NAVER")&&m_id.length()<3) {
	         return 1;
	      }
	      return memberdao.idCheck(m_id);
	   }

	@Override
	public void insertMember(MemberVO memberVO) {
		memberVO.setM_pw(pwEnc.encode(memberVO.getM_pw()));
		memberdao.insertMember(memberVO);
	}

	@Override
	public MemberVO getNaverInfo(String token) throws Exception {
		MemberVO mvo = new MemberVO();
		String header = "Bearer "+token;
		
		String apiUrl = "https://openapi.naver.com/v1/nid/me";
		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
		// 요청 메소드 설정 (GET 방식)
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Authorization", header);
				
		// 응답 상태 코드 확인
		int responseCode2 = conn.getResponseCode();
		if (responseCode2 == HttpURLConnection.HTTP_OK) {
			// 응답 데이터 가져오기
			BufferedReader in2 = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String inputLine2;
			StringBuffer certificationsInfo = new StringBuffer();
			
			while ((inputLine2 = in2.readLine()) != null) {
				certificationsInfo.append(inputLine2);
			}
			in2.close();
			
			// 인증 정보 출력
			JSONObject jsonResponse2 = new JSONObject(certificationsInfo.toString());
			JSONObject responseObj2 = jsonResponse2.getJSONObject("response");
			String id = responseObj2.getString("id");
			String name = responseObj2.getString("name");
			String phone = responseObj2.getString("mobile");
			String email= responseObj2.getString("email");
			mvo.setM_name(name);
			mvo.setM_id("NAVER"+id);
			mvo.setM_email(email);
			mvo.setM_tel(phone);
			mvo.setM_pw("NaverSns");
			int telch = memberdao.telCheck(phone);
			if(mvo!=null&&telch<=0) { //신규 회원일경우
				memberdao.insertMember(mvo);
			}return mvo;
		} else {
			System.out.println("인증 정보 조회 실패: " + responseCode2);
			return null;
		}
	}
	@Override
	public String getMId(String name, String tel ,String birthday) throws Exception {
		String m_id = memberdao.getMId(name,tel,birthday);
		return m_id;
	}
	
	
	@Override
	public void deleteMypageinfo(String m_id) {
		memberdao.deleteMember(m_id);
	}
	   @Override
	   public MemberVO memberGet(String m_id) {

	      return memberdao.memberGet(m_id);
	   }

	      public void updateMember(MemberVO memberVO) {
	           memberdao.updateMember(memberVO);
	       }
	
	
}