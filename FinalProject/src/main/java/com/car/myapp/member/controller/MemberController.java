package com.car.myapp.member.controller;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;




import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.verificationDto;
import com.car.myapp.member.service.MemberService;


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
		mView.setViewName("/member/mypage_general");
		return mView;
	}
	//판매회원 마이페이지
	@RequestMapping("member/private/mypage_dealer")
	public ModelAndView  mypage_dealer(HttpSession session,ModelAndView mView) {
		
		mView.setViewName("/member/mypage_dealer");
		return mView;
	}
	//북마크 추가
	@RequestMapping("member/private/add_bookmark")
	@ResponseBody
	public Map<String,Object> add_bookmark(String car_num,HttpSession session) {
		//판매글 번호 	
		return memberService.addBookmark(car_num,session);	
	}
	//북마크 삭제
	@RequestMapping("member/private/delete_bookmark")
	@ResponseBody
	public Map<String,Object> delete_bookmark(String car_num,HttpSession session) {
		//판매글 번호 	
		return memberService.deleteBookmark(car_num,session);
	}
	//북마크 체크확인
	@RequestMapping("member/private/check_bookmark")
	@ResponseBody
	public Map<String,Object> check_bookmark(String car_num,HttpSession session) {
		System.out.println("차번호:"+car_num);
		//판매글 번호 	
		return memberService.checkBookmark(car_num,session);		
	}
	//마이페이지 회원정보가져오기
	@RequestMapping("member/private/getUserInfo")
	@ResponseBody
	public Map<String, Object> getUserInfo(HttpSession session){
		String user_id=(String)session.getAttribute("id");
		return memberService.getInfo(user_id);
	}
	//관심차량 리스트 불러오기
	@RequestMapping("member/private/getFavoritList")
	@ResponseBody
	public Map<String, Object> getFavoritList(HttpSession session,HttpServletRequest request){
		return memberService.getFavoritList(session,request);
	}
	//판매차량 리스트 불러오기
	@RequestMapping("member/private/getSalesList")
	@ResponseBody
	public Map<String, Object> getSalesList(HttpSession session,HttpServletRequest request){
		return memberService.getSalesList(session,request);
	}
	//마이페이지 SPA기반 링크-----------------------------------
	@RequestMapping("member/private/user_info")
	public String user_info() {
		System.out.println("들어옴");
		return "member/mypage/user_info";
	}
	@RequestMapping("member/private/favorit_list")
	public String favorit_list() {
		System.out.println("들어옴");
		return "member/mypage/favorit_list";
	}
	@RequestMapping("member/private/sales_list")
	public String sales_list() {
		System.out.println("들어옴");
		return "member/mypage/sales_list";
	}
	@RequestMapping("member/private/update_userinfo")
	public String update_userinfo() {
		System.out.println("들어옴");
		return "member/mypage/update_userinfo";
	}
	@RequestMapping("member/private/update_form")
	public String update_form() {
		return "member/mypage/update_form";
	}
	@RequestMapping("member/private/deleteId")
	public String deleteId() {
		return "member/mypage/deleteId";
	}
	@RequestMapping("member/private/delete_confirm")
	public String delete_confirm() {
		return "member/mypage/delete_confirm";
	}
	//-------------------------------------------------------
	//아이디 삭제
	@RequestMapping("member/private/deleteIdLast")
	@ResponseBody
	public Map<String,Object> deleteIdLast(HttpSession session) {
		
		return memberService.deleteId(session);
	}
}
