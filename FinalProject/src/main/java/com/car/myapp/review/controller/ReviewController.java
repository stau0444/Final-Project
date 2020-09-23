package com.car.myapp.review.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.review.dto.ReplyDto;
import com.car.myapp.review.dto.ReviewDto;
import com.car.myapp.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	//ī�� �� ��� ���� ��û ó�� 
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
		//dto �� �� �ۼ��� ��� 
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
	@RequestMapping(value = "/cafe/private/comment_insert", 
			method=RequestMethod.POST)
	public ModelAndView commentInsert(HttpServletRequest request,
			ModelAndView mView, @RequestParam int ref_group) {
		//새 댓글을 저장하고 
		reviewService.saveComment(request);
		//보고 있던 글 자세히 보기로 다시 리다일렉트 이동 시킨다.
		mView.setViewName("redirect:/cafe/detail.do?num="+ref_group);
		return mView;
	}
	@RequestMapping("/cafe/private/comment_delete")
	public ModelAndView commentDelete(HttpServletRequest request,
			ModelAndView mView, @RequestParam int ref_group) {
		reviewService.deleteComment(request);
		mView.setViewName("redirect:/cafe/detail.do?num="+ref_group);
		return mView;
	}
	
	//댓글 수정 ajax 요청에 대한 요청 처리 
	@RequestMapping(value = "/cafe/private/comment_update", 
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> commentUpdate(ReplyDto dto){
		//댓글을 수정 반영하고 
		reviewService.updateComment(dto);
		//JSON 문자열을 클라이언트에게 응답한다.
		Map<String, Object> map=new HashMap<>();
		map.put("num", dto.getNum());
		map.put("content", dto.getContent());
		return map;
	}
	@RequestMapping("/cafe/ajax_comment_list")
	public ModelAndView ajaxCommentList(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.moreCommentList(request);
		mView.setViewName("cafe/ajax_comment_list");
		return mView;
	}
}
