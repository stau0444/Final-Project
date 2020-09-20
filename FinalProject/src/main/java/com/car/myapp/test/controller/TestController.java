package com.car.myapp.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.test.dto.TestDto;
import com.car.myapp.test.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	private TestService service;
	
	@RequestMapping("/test/test.do")
	public ModelAndView  test(ModelAndView mView) {
		service.getList(mView);
		return mView;
	}
	
	@RequestMapping("/test/list.do")
	public ModelAndView getList(ModelAndView mView) {
		service.getList(mView);
		mView.setViewName("test/test");
		return mView;
	}
	@RequestMapping("/test/insert.do")
	public ModelAndView insert(ModelAndView mView,TestDto dto) {
		service.insert(mView, dto);
		mView.setViewName("test/insert");
		return mView;
	}
	@RequestMapping("/test/delete.do")
	public ModelAndView delete(ModelAndView mView,int num) {
		service.delete(mView, num);
		mView.setViewName("test/delete");
		return mView;
	}
	@RequestMapping("/test/update_form.do")
	public String update_form(@RequestParam int num,HttpServletRequest request) {
		request.setAttribute("num", num);
		return "test/update_form";
	}
	
	@RequestMapping("/test/update.do")
	public ModelAndView update(ModelAndView mView,TestDto dto) {
		service.update(mView, dto);
		mView.setViewName("test/update");
		return mView;
	}
	
}
