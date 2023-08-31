package com.water.park.vo;

public class Package_bookVO {
	
	private int pabook_id;
	private String m_id;
	private String p_type;
	private int rebook_id;
	private String book_date;
	private int book_cnt;
	private String use_date;
	private String state;
	private int price;
	
	
	//워터파크 패키지
	public Package_bookVO(int pabook_id, String m_id, String p_type, int book_cnt, String use_date, int price) {
		super();
		this.pabook_id = pabook_id;
		this.m_id = m_id;
		this.p_type = p_type;
		this.book_cnt = book_cnt;
		this.use_date = use_date;
		this.price = price;
	}

	//프리미엄 패키지, 리조트 패키지
	public Package_bookVO(int pabook_id, String m_id, String p_type, int rebook_id, String book_date, int book_cnt,
			String use_date, String state, int price) {
		super();
		this.pabook_id = pabook_id;
		this.m_id = m_id;
		this.p_type = p_type;
		this.rebook_id = rebook_id;
		this.book_date = book_date;
		this.book_cnt = book_cnt;
		this.use_date = use_date;
		this.state = state;
		this.price = price;
	}


	public int getPabook_id() {
		return pabook_id;
	}


	public void setPabook_id(int pabook_id) {
		this.pabook_id = pabook_id;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public String getP_type() {
		return p_type;
	}


	public void setP_type(String p_type) {
		this.p_type = p_type;
	}


	public int getRebook_id() {
		return rebook_id;
	}


	public void setRebook_id(int rebook_id) {
		this.rebook_id = rebook_id;
	}


	public String getBook_date() {
		return book_date;
	}


	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}


	public int getBook_cnt() {
		return book_cnt;
	}


	public void setBook_cnt(int book_cnt) {
		this.book_cnt = book_cnt;
	}


	public String getUse_date() {
		return use_date;
	}


	public void setUse_date(String use_date) {
		this.use_date = use_date;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
	
}
