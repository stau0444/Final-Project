package com.car.myapp.member.dto;

public class MemberDto {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_phone;
	private String user_addr;
	private String user_p_code;
	private int user_sort;
	
	public MemberDto() {}

	public MemberDto(String user_id, String user_pwd, String user_name, String user_phone, String user_addr,
			String user_p_code, int user_sort) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_addr = user_addr;
		this.user_p_code = user_p_code;
		this.user_sort = user_sort;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_p_code() {
		return user_p_code;
	}

	public void setUser_p_code(String user_p_code) {
		this.user_p_code = user_p_code;
	}

	public int isUser_sort() {
		return user_sort;
	}

	public void setUser_sort(int user_sort) {
		this.user_sort = user_sort;
	};
}
