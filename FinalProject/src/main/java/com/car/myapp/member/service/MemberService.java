package com.car.myapp.member.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.member.dto.MemberDto;

public interface MemberService {
	public boolean identification();
	public void addUser(ModelAndView mView , MemberDto dto);
	public Map<String,Object> checkId(String user_id);
}
