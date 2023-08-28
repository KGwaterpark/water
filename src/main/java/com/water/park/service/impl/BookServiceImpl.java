package com.water.park.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonObject;
import com.water.park.service.BookService;
import com.water.park.service.dao.BookDAO;
import com.water.park.vo.BookVO;
import com.water.park.vo.MemberVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;

@Service("bookService") // DAO
public class BookServiceImpl implements BookService {

	@Autowired // 생성자
	private BookDAO bookdao;

	@Transactional
	public ArrayList<BookVO> getAllBook() {
		return bookdao.getAllBook();
	}

	@Override
	public ArrayList<BookVO> Booked_date(String indate, String outdate) throws Exception {
		return bookdao.getBooked(outdate, indate);
	}

	// 숙박 예약정보를 세션에 저장
	@Override
	public BookVO rebook(HttpServletRequest rq, String indate, String outdate, String reType, int price)
			throws Exception {
		HttpSession session = rq.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginsession");
		BookVO bvo = new BookVO(0, mvo.getM_id(), reType, indate, outdate, price);
		session.setAttribute("book_vo", bvo);
		return bvo;
	}

	@Override
	public void insertbook(Ocean_bookVO ocean_bookVO) {
		// TODO Auto-generated method stub
		bookdao.insertocean_book(ocean_bookVO);
	}

	// 숙박 예약정보를 DB에 삽임
	@Override
	public void insertbook(BookVO resort_bookVO) {
		if (resort_bookVO.getRe_type2().equals("패밀리 스탠다드")) {
			resort_bookVO.setRe_type2("f_stand");
		} else if (resort_bookVO.getRe_type2().equals("패밀리 프리미엄")) {
			resort_bookVO.setRe_type2("f_prem");
		} else if (resort_bookVO.getRe_type2().equals("스위트 스탠다드")) {
			resort_bookVO.setRe_type2("s_stand");
		} else if (resort_bookVO.getRe_type2().equals("스위트 프리미엄")) {
			resort_bookVO.setRe_type2("s_prem");
		}
		bookdao.insertresort_book(resort_bookVO);
	}

	@Override
	public void insertbook(Package_bookVO package_bookVO) {
		bookdao.insertpackage_book(package_bookVO);
	}

	// 워터파크 예약 정보를 세션에 저장
	@Override
	public Ocean_bookVO oceanbook(HttpServletRequest rq, String selectedLocker, String indate2, int adultsCount,
			int teenagersCount, int ocean_price) {
		HttpSession session = rq.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginsession");
		long currentTime = new Date().getTime();
		int ocbook_id = (int) currentTime;
		Ocean_bookVO ovo = new Ocean_bookVO(ocbook_id, mvo.getM_id(), selectedLocker, indate2, adultsCount,
				teenagersCount, ocean_price);
		session.setAttribute("ocean_vo", ovo);
		return ovo;
		// TODO Auto-generated method stub

	}

	// 워터파트 패키지 예약 정보를 세션에 저장
	@Override
	public Ocean_bookVO waterpackbook(HttpServletRequest rq, String indate2, int adultsCount, int ocean_price) {
		HttpSession session = rq.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginsession");
		long currentTime = new Date().getTime();
		int ocbook_id = (int) currentTime;
		Ocean_bookVO ovo = new Ocean_bookVO(ocbook_id, mvo.getM_id(), "실내락커", indate2, adultsCount, 0, ocean_price);
		// TODO Auto-generated method stub
		session.setAttribute("ocean_vo", ovo);
		return ovo;
	}

	// 올패키지 예약정보를 세션에 저장
	@Override
	public Ocean_bookVO allpackbook(HttpServletRequest rq, String indate2, int adultsCount, int ocean_price) {
		HttpSession session = rq.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginsession");
		long currentTime = new Date().getTime();
		int ocbook_id = (int) currentTime;
		Ocean_bookVO ovo = new Ocean_bookVO(ocbook_id, mvo.getM_id(), "팬트하우스", indate2, adultsCount, 0, ocean_price);
		session.setAttribute("ocean_vo", ovo);
		return ovo;
	}

	@Override
	public ArrayList<BookVO> paymentAll(String token, String status, String search, String query) throws Exception {
		ArrayList<BookVO> paymentAll = new ArrayList<>();
		String[] states = status.split(",");
		String baseUrl = "https://api.iamport.kr/payments/status/all?limit=1000";
		URL url2 = new URL(baseUrl);
		HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

		conn2.setRequestMethod("GET");
		conn2.setRequestProperty("Authorization", token);

		int responseCode2 = conn2.getResponseCode();
		if (responseCode2 == HttpURLConnection.HTTP_OK) {
			// 응답 데이터 가져오기
			BufferedReader in = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
			String inputLine;
			StringBuilder response = new StringBuilder();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			// 인증 정보 출력
			JSONObject jsonResponse = new JSONObject(response.toString());
			JSONArray paymentArray = jsonResponse.getJSONObject("response").getJSONArray("list");

			for (int i = 0; i < paymentArray.length(); i++) {
				JSONObject paymentObj = paymentArray.getJSONObject(i);
				String merchant_uid = paymentObj.getString("merchant_uid");
				int price = paymentObj.getInt("amount");
				int cancel_amount = paymentObj.getInt("cancel_amount");
				String pg_provider = paymentObj.optString("pg_provider");
				int apply_num = paymentObj.optInt("apply_num");
				String buyer_email = paymentObj.getString("buyer_email");
				String buyer_name = paymentObj.getString("buyer_name");
				String buyer_tel = paymentObj.getString("buyer_tel");
				String channel = paymentObj.getString("channel");
				String card_name = paymentObj.optString("card_name", "");
				String card_number = paymentObj.optString("card_number");
				long unixTimestamp = (long) paymentObj.getInt("paid_at");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String pay_date = "";
				if (unixTimestamp > 0) {
					Date date = new Date(unixTimestamp * 1000);
					pay_date = sdf.format(date);
				}
				String re_type = paymentObj.optString("name");
				String state = paymentObj.optString("status");

				String cancel_reason = paymentObj.optString("cancel_reason");
				long unixTimestamp2 = (long) paymentObj.getInt("cancelled_at");
				String cancelled_at = "";
				if (unixTimestamp2 > 0) {
					Date date2 = new Date(unixTimestamp2 * 1000);
					cancelled_at = sdf.format(date2);
				} else if ((long) paymentObj.getInt("failed_at") > 0) {
					Date date2 = new Date((long) paymentObj.getInt("failed_at") * 1000);
					cancelled_at = sdf.format(date2);
				}

				String fail_reason = paymentObj.optString("fail_reason");

				boolean found = false;

				if (query.equals("")) {
					for (String part : states) {
						if (part.equals(state) || part.equals("all")) {
							found = true;
						}
					}
				} else {
					if (!query.isEmpty()) {
						boolean stateMatched = false;
						for (String part : states) {
							if (part.equals(state) || part.equals("all")) {
								stateMatched = true;
								found = true;
								break;
							}
						}

						if (!stateMatched) {
							found = false;
						} else {
							if (!((search.equals("buyer_name") && buyer_name.equals(query))
									|| (search.equals("buyer_email") && buyer_email.equals(query))
									|| (search.equals("buyer_tel") && buyer_tel.length() > 4
											&& (buyer_tel.substring(buyer_tel.length() - 4)).equals(query))
									|| (search.equals("merchant_uid") && merchant_uid.equals(query)))) {
								found = false;
							}
						}
					}
				}

				if (!found) {
					continue;
				}
				if (state.equals("paid")) {
					state = "결제완료";
				} else if (state.equals("ready")) {
					state = "미결제";
				} else if (state.equals("failed")) {
					state = "결제실패";
				} else if (state.equals("cancelled")) {
					state = "결제취소";
				}
				BookVO book = new BookVO(merchant_uid, price, pg_provider, apply_num, cancel_amount, buyer_email,
						buyer_name, buyer_tel, channel, card_name, card_number, pay_date, re_type, state, cancel_reason,
						cancelled_at, fail_reason);
				paymentAll.add(book);
			}
			return paymentAll;

		} else {
			System.out.println("인증 정보 조회 실패: " + responseCode2);
			return null;
		}
	}

	@Override
	public void payCancle(String token, String merchant_uid, String reason, String type, String amount) throws Exception {
		String baseUrl = "https://api.iamport.kr/payments/cancel";
		String msg = "";
		URL url2 = new URL(baseUrl);
		HttpURLConnection conn = (HttpURLConnection) url2.openConnection();
		
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", token);
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();
		
		json.addProperty("merchant_uid",merchant_uid);
		json.addProperty("reason",reason);
		if(type.equals("part")) {
			json.addProperty("amount",Integer.parseInt(amount));
		}
		  
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		System.out.println(json.toString());
		bw.write(json.toString());
		bw.flush();
		bw.close();
		int responseCode = conn.getResponseCode();
		BufferedReader br;
		
		if (responseCode == HttpURLConnection.HTTP_OK) { // 성공적인 응답을 받았을 때
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		} else { // 오류 응답을 받았을 때
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
		}
		StringBuilder response = new StringBuilder();
		String inputLine;
		
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		String responseBody = response.toString();
		System.out.println("결제 취소 응답: " + StringEscapeUtils.unescapeJava(responseBody));
	}

}
