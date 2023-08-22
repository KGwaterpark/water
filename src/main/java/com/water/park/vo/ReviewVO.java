package com.water.park.vo;

public class ReviewVO {
	

	private String rev_id;
	private String m_id;
	private String type;
	private String rev_contents;
	private String rev_date ;
	private int rev_score;
	
	
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

	public String getRev_contents() {
		return rev_contents;
	}
	public void setRev_contents(String rev_contents) {
		this.rev_contents = rev_contents;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}

	public String getRev_id() {
		return rev_id;
	}
	
	public void setRev_id(String rev_id) {
		this.rev_id = rev_id;
	}
	public int getRev_score() {
		return rev_score;
	}
	public void setRev_score(int rev_score) {
		this.rev_score = rev_score;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [rev_id=" + rev_id + ", m_id=" + m_id + ", type=" + type + ", rev_contents=" + rev_contents
				+ ", rev_date=" + rev_date + ", rev_score=" + rev_score + "]";
	}
	

	
	
}