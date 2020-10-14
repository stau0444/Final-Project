package com.car.myapp.manager.dto;

public class NewsDto {
	private int n_num;
	private String n_title;
	private String n_content;
	private String n_regdate;
	
	public NewsDto() {}

	public NewsDto(int n_num, String n_title, String n_content, String n_regdate) {
		super();
		this.n_num = n_num;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_regdate = n_regdate;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_regdate() {
		return n_regdate;
	}

	public void setN_regdate(String n_regdate) {
		this.n_regdate = n_regdate;
	}
	
}
