package com.car.myapp.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.service.MemberService;

@Controller
public class MemberController {
	//member Service 주입(DI)
	@Autowired
	private MemberService memberService;
	
	//본인인증폼 
	@RequestMapping("member/identification_form.do")
	public ModelAndView identification_form(ModelAndView mView) {
		
		mView.setViewName("/member/identification_form");
		return mView;
	}
	//본인인증 기능
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
	//회원가입 기능
	@RequestMapping("member/sign_up.do")
	public ModelAndView sign_up(ModelAndView mView , MemberDto dto) {
		memberService.addUser(mView,dto);
		mView.setViewName("/member/sign_up");
		return mView;
	}
	//로그인폼
	@RequestMapping("member/login_form.do")
	public ModelAndView login_form(ModelAndView mView) {
		mView.setViewName("/member/login_form");
		return mView;
	}
	//로그인 기능
	@RequestMapping("member/private/login.do")
	public ModelAndView login(ModelAndView mView, MemberDto dto) {
		mView.addObject("isSuccess", true);
		mView.setViewName("/member/private/login");
		return mView;
	}
	//회원가입 아이디 중복확인 기능
	@RequestMapping("member/checkid.do")
	@ResponseBody
	public Map<String,Object> checkId(String user_id){
		Map<String,Object> map=memberService.checkId(user_id);
		return map;
	}
}
