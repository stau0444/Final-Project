package com.car.myapp.cardata.dto;

import java.util.ArrayList;
import java.util.List;

public class CarDataDto {
	private String car_num; // 판매 정보를 숫자로 매긴 Data
	private String m_name; // 차량 모델 명
	private List<String> m_name_chk=new ArrayList<String>(); // 검색옵션: 체크된 차종
	private int car_group; // 국내 와제(1:국내 0:해외)
	private int c_sort;  // 차종
	private List<Integer> c_sort_chk= new ArrayList<Integer>(); //검색옵션: 체크된 차종들
	// 차종 정보: (1:소형차, 2:중형차, 3: 대형차, 4: 스포츠카, 5: suv 6:화물차)
	private int company;  // 차량의 제조사
	/*
	 * 1:현대 2:기아 3:제네시스 4:쉐보레 5:르노삼성 6:쌍용
	 * 7:벤츠 8:BMW 9:아우디 10:폭스바겐 11:도요타
	 */
	private List<Integer> company_chk= new ArrayList<Integer>(); // 검색옵션: 체크된 제조사들
	private String seller_id;  // 판매자 아이디
	private String title;  // 글 제목
	private int s_price;  // 차량 가격
	private int min_price; // 검색옵션: 최소 차량가격
	private int max_price; // 검색옵션: 최대 차량가격
	private String automotive_fuel;  // 무슨 연료
	private List<String> automotive_fuel_chk=new ArrayList<String>(); // 검색 옵션: 체크된 연료종류
	private int seater;  // 차 인승
	private List<Integer> seater_chk=new ArrayList<Integer>(); // 검색 옵션: 체크된 인승
	private String color;  // 차 색상
	private List<String> color_chk=new ArrayList<String>(); // 검색 옵션: 체크된 색상
	private int performance;  // 성능 진단 (1:양호 0:불량)
	private int expendables;  // 소모품 진단 (1:양호 0:불량)
	private String c_history; //사고 이력 ex> 엔진교체 0회, 침수0회, 도난0회
	private String regdate;  // 글 작성일
	private int vehical_mile;  // 주행거리
	private int min_vehical_mile; // 검색옵션: 최소 주행거리
	private int max_vehical_mile; // 검색옵션: 최대 주행거리
	private String car_option;  // 옵션 이름 
	private List<String> car_option_chk=new ArrayList<String>(); // 검색옵션: 체크된 옵션
	private int car_year; // 연식
	private int min_year; // 검색옵션 : 연식(최솟값)
	private int max_year; // 검색옵션: 연식(최댓값)
	private int vehical_gear; // 자돟차 기어 ( 1:자동,0:수동 )
	private List<Integer> vehical_gear_chk=new ArrayList<Integer>(); // 검색옵션: 체크된 기어
	private int state;  //상태 ( 1:판매중 , 0:판매완료 )
	private int startRowNum;
	private int endRowNum;
	
	public CarDataDto() {}

	public CarDataDto(String car_num, String m_name, List<String> m_name_chk, int car_group, int c_sort,
			List<Integer> c_sort_chk, int company, List<Integer> company_chk, String seller_id, String title,
			int s_price, int min_price, int max_price, String automotive_fuel, List<String> automotive_fuel_chk,
			int seater, List<Integer> seater_chk, String color, List<String> color_chk, int performance,
			int expendables, String c_history, String regdate, int vehical_mile, int min_vehical_mile,
			int max_vehical_mile, String car_option, List<String> car_option_chk, int car_year, int min_year,
			int max_year, int vehical_gear, List<Integer> vehical_gear_chk, int state, int startRowNum, int endRowNum) {
		super();
		this.car_num = car_num;
		this.m_name = m_name;
		this.m_name_chk = m_name_chk;
		this.car_group = car_group;
		this.c_sort = c_sort;
		this.c_sort_chk = c_sort_chk;
		this.company = company;
		this.company_chk = company_chk;
		this.seller_id = seller_id;
		this.title = title;
		this.s_price = s_price;
		this.min_price = min_price;
		this.max_price = max_price;
		this.automotive_fuel = automotive_fuel;
		this.automotive_fuel_chk = automotive_fuel_chk;
		this.seater = seater;
		this.seater_chk = seater_chk;
		this.color = color;
		this.color_chk = color_chk;
		this.performance = performance;
		this.expendables = expendables;
		this.c_history = c_history;
		this.regdate = regdate;
		this.vehical_mile = vehical_mile;
		this.min_vehical_mile = min_vehical_mile;
		this.max_vehical_mile = max_vehical_mile;
		this.car_option = car_option;
		this.car_option_chk = car_option_chk;
		this.car_year = car_year;
		this.min_year = min_year;
		this.max_year = max_year;
		this.vehical_gear = vehical_gear;
		this.vehical_gear_chk = vehical_gear_chk;
		this.state = state;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public String getCar_num() {
		return car_num;
	}

	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public List<String> getM_name_chk() {
		return m_name_chk;
	}

	public void setM_name_chk(List<String> m_name_chk) {
		this.m_name_chk = m_name_chk;
	}

	public int getCar_group() {
		return car_group;
	}

	public void setCar_group(int car_group) {
		this.car_group = car_group;
	}

	public int getC_sort() {
		return c_sort;
	}

	public void setC_sort(int c_sort) {
		this.c_sort = c_sort;
	}

	public List<Integer> getC_sort_chk() {
		return c_sort_chk;
	}

	public void setC_sort_chk(List<Integer> c_sort_chk) {
		this.c_sort_chk = c_sort_chk;
	}

	public int getCompany() {
		return company;
	}

	public void setCompany(int company) {
		this.company = company;
	}

	public List<Integer> getCompany_chk() {
		return company_chk;
	}

	public void setCompany_chk(List<Integer> company_chk) {
		this.company_chk = company_chk;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getS_price() {
		return s_price;
	}

	public void setS_price(int s_price) {
		this.s_price = s_price;
	}

	public int getMin_price() {
		return min_price;
	}

	public void setMin_price(int min_price) {
		this.min_price = min_price;
	}

	public int getMax_price() {
		return max_price;
	}

	public void setMax_price(int max_price) {
		this.max_price = max_price;
	}

	public String getAutomotive_fuel() {
		return automotive_fuel;
	}

	public void setAutomotive_fuel(String automotive_fuel) {
		this.automotive_fuel = automotive_fuel;
	}

	public List<String> getAutomotive_fuel_chk() {
		return automotive_fuel_chk;
	}

	public void setAutomotive_fuel_chk(List<String> automotive_fuel_chk) {
		this.automotive_fuel_chk = automotive_fuel_chk;
	}

	public int getSeater() {
		return seater;
	}

	public void setSeater(int seater) {
		this.seater = seater;
	}

	public List<Integer> getSeater_chk() {
		return seater_chk;
	}

	public void setSeater_chk(List<Integer> seater_chk) {
		this.seater_chk = seater_chk;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public List<String> getColor_chk() {
		return color_chk;
	}

	public void setColor_chk(List<String> color_chk) {
		this.color_chk = color_chk;
	}

	public int getPerformance() {
		return performance;
	}

	public void setPerformance(int performance) {
		this.performance = performance;
	}

	public int getExpendables() {
		return expendables;
	}

	public void setExpendables(int expendables) {
		this.expendables = expendables;
	}

	public String getC_history() {
		return c_history;
	}

	public void setC_history(String c_history) {
		this.c_history = c_history;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getVehical_mile() {
		return vehical_mile;
	}

	public void setVehical_mile(int vehical_mile) {
		this.vehical_mile = vehical_mile;
	}

	public int getMin_vehical_mile() {
		return min_vehical_mile;
	}

	public void setMin_vehical_mile(int min_vehical_mile) {
		this.min_vehical_mile = min_vehical_mile;
	}

	public int getMax_vehical_mile() {
		return max_vehical_mile;
	}

	public void setMax_vehical_mile(int max_vehical_mile) {
		this.max_vehical_mile = max_vehical_mile;
	}

	public String getCar_option() {
		return car_option;
	}

	public void setCar_option(String car_option) {
		this.car_option = car_option;
	}

	public List<String> getCar_option_chk() {
		return car_option_chk;
	}

	public void setCar_option_chk(List<String> car_option_chk) {
		this.car_option_chk = car_option_chk;
	}

	public int getCar_year() {
		return car_year;
	}

	public void setCar_year(int car_year) {
		this.car_year = car_year;
	}

	public int getMin_year() {
		return min_year;
	}

	public void setMin_year(int min_year) {
		this.min_year = min_year;
	}

	public int getMax_year() {
		return max_year;
	}

	public void setMax_year(int max_year) {
		this.max_year = max_year;
	}

	public int getVehical_gear() {
		return vehical_gear;
	}

	public void setVehical_gear(int vehical_gear) {
		this.vehical_gear = vehical_gear;
	}

	public List<Integer> getVehical_gear_chk() {
		return vehical_gear_chk;
	}

	public void setVehical_gear_chk(List<Integer> vehical_gear_chk) {
		this.vehical_gear_chk = vehical_gear_chk;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
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

}
