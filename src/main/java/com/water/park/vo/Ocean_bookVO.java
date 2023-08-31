package com.water.park.vo;

public class Ocean_bookVO {

	private long ocbook_id;
	private String m_id;
	private String type;
	
	private String oc_date;
	private int adult_cnt;
	private int tot_cnt;
	private int child_cnt;
	private int price;
	private String state;
	
	
	
	
	public long getOcbook_id() {
		return ocbook_id;
	}
	public void setOcbook_id(long ocbook_id) {
		this.ocbook_id = ocbook_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOc_date() {
		return oc_date;
	}
	public void setOc_date(String oc_date) {
		this.oc_date = oc_date;
	}
	public int getAdult_cnt() {
		return adult_cnt;
	}
	public void setAdult_cnt(int adult_cnt) {
		this.adult_cnt = adult_cnt;
	}
	public int getTot_cnt() {
		return tot_cnt;
	}
	public void setTot_cnt(int tot_cnt) {
		this.tot_cnt = tot_cnt;
	}
	public int getChild_cnt() {
		return child_cnt;
	}
	public void setChild_cnt(int child_cnt) {
		this.child_cnt = child_cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Ocean_bookVO [ocbook_id=" + ocbook_id + ", m_id=" + m_id + ", type=" + type + ", oc_date=" + oc_date
				+ ", adult_cnt=" + adult_cnt + ", tot_cnt=" + tot_cnt + ", child_cnt=" + child_cnt + ", price=" + price
				+ ", state=" + state + "]";
	}
	

	 
}
