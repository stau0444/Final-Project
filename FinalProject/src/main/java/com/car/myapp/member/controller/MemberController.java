package com.car.myapp.member.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private MemberService memberService;
	
	//-----------------------------여기서 부터
	
	//본인인증폼 
	@RequestMapping("member/identification_form")
	public ModelAndView identification_form(ModelAndView mView,HttpSession session) {
		session.invalidate();
		mView.setViewName("/member/identification_form");
		return mView;
	}
	//본인인증 기능
	@RequestMapping(value = "/member/sendSms")
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
	@RequestMapping("member/checkVCode")
	@ResponseBody
	public Map<String,Object> checkVCode(verificationDto dto,HttpSession sessionV){
		System.out.println(dto.getUserMail());
		System.out.println(dto.getVerificationCode());
		return memberService.checkVCode(dto,sessionV);
	}
	//인증후 회원가입 페이지로 넘겨주는 코드
	@RequestMapping("member/verified/identification")
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
	@RequestMapping("member/verified/checkid")
	@ResponseBody
	public Map<String,Object> checkId(String user_id){
		Map<String,Object> map=memberService.checkId(user_id);
		System.out.println(user_id);
		return map;
	}
	//회원가입 기능
	@RequestMapping("member/verified/sign_up")
	@ResponseBody
	public Map<String,Object> sign_up(MemberDto dto) {
		return memberService.addUser(dto);
	}
	//회원가입 성공폼
	@RequestMapping("member/verified/signup_success")
	public String signup_success() {
		
		return "/member/signup_success";
	}
	@RequestMapping("member/verified/invalidateSession")
	public void invalidateSession(HttpSession session){
		session.invalidate();
		System.out.println("본인인증세션 삭제");
	}
	
	//---------------------------------------여기까지 트렌젝션으로 묶는다
	
	
	//로그인 기능
	@RequestMapping("member/private/login")
	@ResponseBody
	public Map<String,Object> login(ModelAndView mView, MemberDto dto,HttpSession session) {

		return memberService.loginProcess(dto, mView, session);
	}
	//인증에러 페이지로 이동시키는 코드
	@RequestMapping("member/error/verifyError")
	public String verifyError() {
		return "/error/verifyError";
	}
	@RequestMapping("member/logout")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "/member/logout";
	}
	
	//아이디 찾기 본인인증폼
	@RequestMapping("member/findid_verifyform")
	public String findid_verifyForm() {
		return "/member/findid_verifyform";
	}
	//아이디 찾기 sms보내기
	@RequestMapping("member/findid_sendSMS")
	@ResponseBody
	public Map<String, Object> findid(HttpServletRequest request){
		return memberService.sendSMS(request);
	}
	//아이디찾기 본인인증 
	@RequestMapping("member/findid_verify")
	@ResponseBody
	public Map<String,Object> findid_verify(verificationDto dto,HttpSession sessionV){
		
		return memberService.checkVCode(dto,sessionV);	
	}
	//인증 후 아이디  리턴
	@RequestMapping("member/verified/findid_form.do")
	public String findid_form(HttpServletRequest request,String userPhone) {
		String userPhone1=request.getParameter("userPhone");
		String userId=memberService.getUserId(userPhone1);
		System.out.println("userid:"+userId);
		request.setAttribute("userid", userId);
		return "/member/findid_form";
	}
	//비밀번호 찾기폼
	@RequestMapping("member/findpwd_form")
	public String findpwd_form() {
		return("/member/findpwd_form");
	}
	//비밀번호 찾기 본인인증폼
	@RequestMapping("member/findpwd_verifyform")
	@ResponseBody
	public Map<String, Object> findpwd_verifyform(String user_id) {
			
		return memberService.getUserInfo(user_id);
	}
	//비밀번호 찾기 sms보내기
	@RequestMapping("member/findpwd_sendSMS")
	@ResponseBody
	public Map<String, Object> findpwd(HttpServletRequest request){
		return memberService.sendSMS(request);
	}
	//비밀번호 찾기 인증번호 확인코드
	@RequestMapping("member/findpwd_checkVCode")
	@ResponseBody
	public Map<String,Object> findpwd_checkVCode(verificationDto dto,HttpSession sessionV){
		return memberService.checkVCode(dto,sessionV);
	}	
	//본인확인 후 비밀번호 변경 폼 
	@RequestMapping("member/changepwd_form")
	public String changepwd_form() {
		return "/member/changepwd_form";
	}
	//비밀번호 변경
	@RequestMapping("member/changePwd")
	@ResponseBody
	public Map<String,Object> changepwd(MemberDto dto){
		return memberService.changePwd(dto);
	}
	//전화번호 중복확인
	@RequestMapping("member/checkPhone")
	@ResponseBody
	public Map<String,Object> checkPhone(String user_phone){
		return memberService.checkPhone(user_phone);
	}
	//메일전송
	@RequestMapping("member/sendMail")
	@ResponseBody
	public Map<String,Object> sendMail(String user_mail){
		return memberService.sendMail(user_mail);
	}
	//------------------------------마이페이지관련--------------------------------------
	//일반회원 마이페이지
	@RequestMapping("member/private/mypage_general")
	public ModelAndView  mypage_general(HttpSession session,ModelAndView mView) {
		System.out.println("들어옴");
		mView.setViewName("/member/mypage_general");
		return mView;
	}
	//판매회원 마이페이지
	@RequestMapping("member/private/mypage_dealer")
	public ModelAndView  mypage_dealer(HttpSession session,ModelAndView mView) {
		
		mView.setViewName("/member/mypage_dealer");
		return mView;
	}

}
