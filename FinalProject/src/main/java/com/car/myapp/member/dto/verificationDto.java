package com.car.myapp.member.dto;

public class verificationDto {
	private String userPhone;
	private String verificationCode;
	private String userMail;
	
	public verificationDto() {}

	public verificationDto(String userPhone, String verificationCode, String userMail) {
		super();
		this.userPhone = userPhone;
		this.verificationCode = verificationCode;
		this.userMail = userMail;
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

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
}
