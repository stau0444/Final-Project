package com.car.myapp.member.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import com.car.myapp.sendSMS;
import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.verificationDto;
import com.car.myapp.member.service.MemberService;

import net.nurigo.java_sdk.Coolsms;

@Controller
public class MemberController {
	//member Service 주입(DI)
	@Autowired
	private MemberService memberService;
	
	//-----------------------------여기서 부터
	
	//본인인증폼 
	@RequestMapping("member/identification_form.do")
	public ModelAndView identification_form(ModelAndView mView) {
		
		mView.setViewName("/member/identification_form");
		return mView;
	}
	//본인인증 기능
	@RequestMapping(value = "/member/sendSms.do")
    @ResponseBody
	public Map<String,Object> sendSms(HttpServletRequest request) throws Exception {
		/*
		 * Todo
		 * 핸드폰번호 입력받아서 "to"에 넣어준다 ^
		 * 초입에 난수 생성해서 "text"에 넣어준다^
		 * sevice로 코드옮기기
		 * try구문에서 dao에 번호와 인증번호 DB에 집어넣기
		 * AJAX로 코드 바꾸기
		 * 인증번호 확인하는  코드작성하기
		 * 휴대폰번호와 인풋에 적은 인증번호를 들고 가서 DB에 있다면 true 없다면 false true면 회원가입창으로  
		 * 틀리면 홈으로 확인후 DB지우기
		 * 
		 */
		//인증번호생성
		
      return memberService.sendSMS(request); //문자 메시지 발송 성공했을때 number페이지로 이동함
    }
	//인증번호 확인코드
	@RequestMapping("member/checkVCode.do")
	@ResponseBody
	public Map<String,Object> checkVCode(verificationDto dto){
		return memberService.checkVCode(dto);
	}
	//인증후 회원가입 페이지로 넘겨주는 코드
	@RequestMapping("member/identification.do")
	public ModelAndView identification(ModelAndView mView,String userPhone) throws Exception {
		
		boolean isCertified=memberService.identification();
		if(isCertified) {
			mView.setViewName("/member/signup_form");			
		}else {
			mView.setViewName("/member/identification_form");
		}
		return mView;
	}
	//회원가입 아이디 중복확인 기능
	@RequestMapping("member/checkid.do")
	@ResponseBody
	public Map<String,Object> checkId(String user_id){
		Map<String,Object> map=memberService.checkId(user_id);
		return map;
	}
	//회원가입 기능
	@RequestMapping("member/sign_up.do")
	public ModelAndView sign_up(ModelAndView mView , MemberDto dto) {
		memberService.addUser(mView,dto);
		mView.setViewName("/member/sign_up");
		return mView;
	}
	
	//---------------------------------------여기까지 트렌젝션으로 묶는다
	
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
}
