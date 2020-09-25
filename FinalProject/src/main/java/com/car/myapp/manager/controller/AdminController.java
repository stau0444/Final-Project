package com.car.myapp.manager.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.car.myapp.manager.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/manager/private/mypage")
	public String ManagerPage(){
		
		return "manager/private/mypage";
	}
	
	@RequestMapping(value = "/manager/private/news/news_list")
	public String newsList() {
		return "manager/private/news/news_list";
	}
	
	@RequestMapping(value = "/manager/private/news/news_form")
	public String newsForm() {
		return "manager/private/news/news_form";
	}
	
	@RequestMapping(value = "/manager/private/qna/individual")
	public String individualList() {
		return "manager/private/qna/individual";
	}
	
	@RequestMapping(value = "/manager/private/qna/frequently_ask")
	public String frequentlyAskList() {
		return "manager/private/qna/frequently_ask";
	}
	
	@RequestMapping(value = "/manager/private/registration")
	public String registrationList() {
		return "manager/private/registration";
	}
	
	@RequestMapping(value = "/manager/private/qna/answer_form")
	public String answerForm() {
		return "manager/private/qna/answer_form";
	}
	
	@RequestMapping(value = "/manager/private/join", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> JoinIp(@RequestParam String ip_num){
		
		Map<String, Object> map = adminService.addIp(ip_num);

		return map;
	}
}
