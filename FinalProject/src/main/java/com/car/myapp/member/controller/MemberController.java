package com.car.myapp.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("member/identification_form.do")
	public ModelAndView identification_form(ModelAndView mView) {
		
		mView.setViewName("/member/identification_form");
		return mView;
	}
	@RequestMapping("member/identification.do")
	public ModelAndView identification(ModelAndView mView) {
		boolean isCertified=memberService.identification();
		if(isCertified) {
			mView.setViewName("/member/signup_form");			
		}else {
			mView.setViewName("/member/identification_form");
		}
		return mView;
	}
	@RequestMapping("member/sign_up.do")
	public ModelAndView sign_up(ModelAndView mView , MemberDto dto) {
		memberService.addUser(mView,dto);
		mView.setViewName("/member/sign_up");
		return mView;
	}
	@RequestMapping("member/login_form.do")
	public ModelAndView login_form(ModelAndView mView) {
		mView.setViewName("/member/login_form");
		return mView;
	}
	@RequestMapping("member/private/login.do")
	public ModelAndView login(ModelAndView mView, MemberDto dto) {
		mView.addObject("isSuccess", true);
		mView.setViewName("/member/private/login");
		return mView;
	}
}
