package com.car.myapp.carimage.dto;

public class CarImageDto {
	private String car_num; // 판매 정보를 숫자로 매긴 Data
	private String seller_id;  // 판매자 아이디
	private String image;
	private int isMain;
	
	public CarImageDto() {}
	
	public CarImageDto(String car_num, String seller_id, String image, int isMain) {
		super();
		this.car_num = car_num;
		this.seller_id = seller_id;
		this.image = image;
		this.isMain = isMain;
	}

	public String getCar_num() {
		return car_num;
	}

	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getIsMain() {
		return isMain;
	}

	public void setIsMain(int isMain) {
		this.isMain = isMain;
	}
	
}
