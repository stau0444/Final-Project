package com.car.myapp.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.verificationDto;

public interface MemberService {
	public boolean identification();
	public void addUser(ModelAndView mView , MemberDto dto,HttpSession sessionV);
	public Map<String,Object> checkId(String user_id);
	public Map<String,Object> sendSMS(HttpServletRequest request);
	public Map<String,Object> checkVCode(verificationDto dto,HttpSession sessionV);
	public Map<String,Object> loginProcess(MemberDto dto, ModelAndView mView, HttpSession session);
}
