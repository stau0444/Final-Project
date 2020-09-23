package com.car.myapp.member.dto;

public class verificationDto {
	private String userPhone;
	private String verificationCode;
	
	public verificationDto() {}

	public verificationDto(String userPhone, String verificationCode) {
		super();
		this.userPhone = userPhone;
		this.verificationCode = verificationCode;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}
	
	
}
