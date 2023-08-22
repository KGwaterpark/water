package com.water.park.vo;

public class BookVO {
	private String re_type;
	private int RESERVATION_COUNT;
	
	private int rebook_id;
	private String m_id;
	private String re_type2;
	private String check_in_date;
	private String check_out_date;
	private int price;
	
	private String book_date;
	
	private String state;
	
	
	

	public BookVO(String re_type, int rESERVATION_COUNT, int rebook_id, String m_id, String re_type2,
			String check_in_date, String check_out_date, int price, String state) {
		super();
		this.re_type = re_type;
		RESERVATION_COUNT = rESERVATION_COUNT;
		this.rebook_id = rebook_id;
		this.m_id = m_id;
		this.re_type2 = re_type2;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.price = price;
		this.state = state;
	}
	
	public BookVO(String re_type, int rebook_id, String m_id, String check_in_date, String check_out_date, int price,
			String book_date, String state) {
		super();
		this.re_type = re_type;
		this.rebook_id = rebook_id;
		this.m_id = m_id;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.price = price;
		this.book_date = book_date;
		this.state = state;
	}

	public String getBook_date() {
		return book_date;
	}

	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public BookVO(int rebook_id, String m_id, String re_type2, String check_in_date, String check_out_date, int price) {
		super();
		this.rebook_id = rebook_id;
		this.m_id = m_id;
		this.re_type2 = re_type2;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.price = price;
	}

	public int getRebook_id() {
		return rebook_id;
	}

	public void setRebook_id(int rebook_id) {
		this.rebook_id = rebook_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getRe_type2() {
		return re_type2;
	}

	public void setRe_type2(String re_type2) {
		this.re_type2 = re_type2;
	}

	public String getCheck_in_date() {
		return check_in_date;
	}

	public void setCheck_in_date(String check_in_date) {
		this.check_in_date = check_in_date;
	}

	public String getCheck_out_date() {
		return check_out_date;
	}

	public void setCheck_out_date(String check_out_date) {
		this.check_out_date = check_out_date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public BookVO() {}
	
	public BookVO(String re_type, int rESERVATION_COUNT) {
		super();
		this.re_type = re_type;
		this.RESERVATION_COUNT = rESERVATION_COUNT;
	}

	public String getRe_type() {
		return re_type;
	}
	public void setRe_type(String re_type) {
		this.re_type = re_type;
	}
	public int getRESERVATION_COUNT() {
		return RESERVATION_COUNT;
	}
	public void setRESERVATION_COUNT(int rESERVATION_COUNT) {
		RESERVATION_COUNT = rESERVATION_COUNT;
	}
	
	
	
}
