package com.car.myapp.member.dto;

public class PaginationDto {
	private int startRowNum;
	private int endRowNum;
	private String user_id;
	
	public PaginationDto() {}

	public PaginationDto(int startRowNum, int endRowNum, String user_id) {
		super();
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.user_id = user_id;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	};
}
