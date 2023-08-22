package com.water.park.vo;

import java.sql.Date;

public class GongjiVO {

	private int g_id;
	private Date g_date;
	private String g_title;
	private String g_content;

	public GongjiVO() {
	}

	public GongjiVO(int g_id, Date g_date, String g_title, String g_content) {
		super();
		this.g_id = g_id;
		this.g_date = g_date;
		this.g_title = g_title;
		this.g_content = g_content;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public Date getG_date() {
		return g_date;
	}

	public void setG_date(Date g_date) {
		this.g_date = g_date;
	}

	public String getG_title() {
		return g_title;
	}

	public void setG_title(String g_title) {
		this.g_title = g_title;
	}

	public String getG_content() {
		return g_content;
	}

	public void setG_content(String g_content) {
		this.g_content = g_content;
	}

}