package com.car.myapp.member.dto;

public class BookMarkDto {
	private String car_num;
	private String user_id;
	
	public BookMarkDto() {}

	public BookMarkDto(String car_num, String user_id) {
		super();
		this.car_num = car_num;
		this.user_id = user_id;
	}

	public String getCar_num() {
		return car_num;
	}

	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	};
	
	
}
