package com.car.myapp.test.dto;

public class TestDto {
	private String name;
	private int num;
	private String addr;
	
	public TestDto() {}

	public TestDto(String name, int num, String addr) {
		super();
		this.name = name;
		this.num = num;
		this.addr = addr;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	};
}
