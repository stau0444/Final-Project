package com.car.myapp.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.verificationDto;

public interface MemberService {
	public boolean identification();
	public Map<String,Object> addUser(MemberDto dto);
	public Map<String,Object> checkId(String user_id);
	public Map<String,Object> sendSMS(HttpServletRequest request);
	public Map<String,Object> checkVCode(verificationDto dto,HttpSession sessionV);
	public Map<String,Object> loginProcess(MemberDto dto, ModelAndView mView, HttpSession session);
	public String getUserId(String user_phone);
	public Map<String,Object> getUserInfo(String user_id);
	public Map<String,Object> changePwd(MemberDto dto);
	public Map<String,Object> checkPhone(String user_phone);
	public Map<String,Object> sendMail(String user_mail);
	public Map<String,Object> addBookmark(String car_num,HttpSession session);
	public Map<String,Object> deleteBookmark(String car_num,HttpSession session);
	public Map<String,Object> getInfo(String user_id);
	public Map<String,Object> checkBookmark(String car_num,HttpSession session);
	public Map<String,Object> getFavoritList(HttpSession session);
	public Map<String,Object> getSalesList(HttpSession session);	
}
