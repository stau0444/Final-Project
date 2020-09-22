package com.car.myapp.manager.dto;

public class IndividualDto {
	private int iq_num;
	private String user_id;
	private String iq_content;
	private String iq_regdate;
	
	public IndividualDto() {
		// TODO Auto-generated constructor stub
	}

	public IndividualDto(int iq_num, String user_id, String iq_content, String iq_regdate) {
		super();
		this.iq_num = iq_num;
		this.user_id = user_id;
		this.iq_content = iq_content;
		this.iq_regdate = iq_regdate;
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
	
}
