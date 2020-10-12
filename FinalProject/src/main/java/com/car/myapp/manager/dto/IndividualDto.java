package com.car.myapp.manager.dto;

public class IndividualDto {
	private int iq_num;
	private String user_id;
	private String iq_content;
	private String iq_regdate;
	private String iq_email;
	private int iq_category;
	private String iq_title;
	
	private String iq_content_a;
	
	public IndividualDto() {}

	public IndividualDto(int iq_num, String user_id, String iq_content, String iq_regdate, String iq_email,
			int iq_category, String iq_title, String iq_content_a) {
		super();
		this.iq_num = iq_num;
		this.user_id = user_id;
		this.iq_content = iq_content;
		this.iq_regdate = iq_regdate;
		this.iq_email = iq_email;
		this.iq_category = iq_category;
		this.iq_title = iq_title;
		this.iq_content_a = iq_content_a;
	}

	public int getIq_num() {
		return iq_num;
	}

	public void setIq_num(int iq_num) {
		this.iq_num = iq_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getIq_content() {
		return iq_content;
	}

	public void setIq_content(String iq_content) {
		this.iq_content = iq_content;
	}

	public String getIq_regdate() {
		return iq_regdate;
	}

	public void setIq_regdate(String iq_regdate) {
		this.iq_regdate = iq_regdate;
	}

	public String getIq_email() {
		return iq_email;
	}

	public void setIq_email(String iq_email) {
		this.iq_email = iq_email;
	}

	public int getIq_category() {
		return iq_category;
	}

	public void setIq_category(int iq_category) {
		this.iq_category = iq_category;
	}

	public String getIq_title() {
		return iq_title;
	}

	public void setIq_title(String iq_title) {
		this.iq_title = iq_title;
	}

	public String getIq_content_a() {
		return iq_content_a;
	}

	public void setIq_content_a(String iq_content_a) {
		this.iq_content_a = iq_content_a;
	}

	
}
