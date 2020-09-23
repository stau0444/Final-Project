package com.car.myapp.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/manager/private/mypage")
	public String ManagerPage(){
		
		return "manager/private/mypage";
	}
	
	@RequestMapping(value = "/manager/private/news/news_list")
	public String newsList() {
		return "manager/private/news/news_list";
	}
	
	@RequestMapping(value = "/manager/private/qna/individual")
	public String individualList() {
		return "manager/private/qna/individual";
	}
	
	@RequestMapping(value = "/manager/private/qna/frequently_ask")
	public String frequentlyAskList() {
		return "manager/private/qna/frequently_ask";
	}
}
