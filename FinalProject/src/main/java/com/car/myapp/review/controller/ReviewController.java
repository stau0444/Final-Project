package com.car.myapp.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.review.dto.ReviewDto;
import com.car.myapp.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	//카페 글 목록 보기 요청 처리 
	@RequestMapping("/review/list")
	public ModelAndView getList(HttpServletRequest request, 
			ModelAndView mView) {
		reviewService.getList(request);
		mView.setViewName("review/list");
		return mView;
	}
	
	@RequestMapping("/review/detail")
	public ModelAndView detail(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.getDetail(request);
		mView.setViewName("review/detail");
		return mView;
	}
	
	@RequestMapping("/review/private/insertform")
	public ModelAndView insertForm(ModelAndView mView) {
		
		mView.setViewName("review/insertform");
		return mView;
	}
	
	@RequestMapping(value = "/review/private/insert", method=RequestMethod.POST)
	public ModelAndView insert(ReviewDto dto, ModelAndView mView, HttpSession session) {
		//dto 에 글 작성자 담기 
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		reviewService.saveContent(dto);
		mView.setViewName("review/insert");
		return mView;
	}
	
	@RequestMapping("/review/private/updateform")
	public ModelAndView updateform(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.getDetail(request);
		mView.setViewName("review/updateform");
		return mView;
	}
	@RequestMapping(value="/review/private/update", method=RequestMethod.POST)
	public ModelAndView update(ReviewDto dto, ModelAndView mView) {
		reviewService.updateContent(dto);
		mView.setViewName("review/update");
		return mView;
	}
	@RequestMapping("/review/private/delete")
	public ModelAndView delete(int num, HttpServletRequest request,
			ModelAndView mView) {
		reviewService.deleteContent(num, request);
		mView.setViewName("redirect:/review/list.do");
		return mView;
	}
}
