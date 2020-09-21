package com.car.myapp.member.service;

import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.member.dto.MemberDto;

public interface MemberService {
	public boolean identification();
	public void addUser(ModelAndView mView , MemberDto dto);
}
