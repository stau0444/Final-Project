package com.car.myapp.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NLoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	//로그인 첫 화면 요청 메소드
	//로그인 폼을 띄우는 메소드
	@RequestMapping(value = "/member/login_form", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session,HttpServletRequest request) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		request.setAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "member/login_form";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "member/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		System.out.println("code:"+code);
		System.out.println("state:"+state);
		
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    try {
	    	JSONParser parser=new JSONParser();
	    	Object obj = parser.parse(apiResult);
	    	JSONObject NuserInfo = (JSONObject) obj;
	    	JSONObject info=(JSONObject)NuserInfo.get("response");
	    	System.out.println(info.get("email"));
	    	session.setAttribute("id", info.get("email"));
	    	session.setAttribute("isNLogin", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * 세션에 아이디랑 , isLogined를 true로 담아주고 && isNLogined 도 true로 담아준다.
		 * 인덱스페이지에서 el을 이용하여  isNLogined가 true면 아이디님이 네이버로 로그인 되었습니다. 
		 * 일반 로그인이면  isLogined만 true로하고 아이디님이 로그인되었습니다.
		 */
		
		
		
        /* 네이버 로그인 성공 페이지 View 호출 */
		return "member/naverSuccess";
	}
}
