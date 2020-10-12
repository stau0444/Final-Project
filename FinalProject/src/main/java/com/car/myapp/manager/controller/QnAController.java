package com.car.myapp.manager.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.manager.dto.IndividualDto;
import com.car.myapp.manager.service.IndividualService;
import com.car.myapp.manager.service.QnAService;

@Controller
public class QnAController {

	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private IndividualService individualService;
	
	//1:1문의 리스트
	@RequestMapping(value = "/manager/private/getlist_iq", method = RequestMethod.GET )
	@ResponseBody
	public Map<String, Object> getIqList(HttpServletRequest req){
		
		return individualService.getList_iq(req);
	}
	
	//1:1문의 리스트 데이터 조회
	@RequestMapping(value = "/manager/private/qna/getdata_iq", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getDataIq(@RequestParam int iq_num){
		
		return individualService.getData_iq(iq_num);
	}
	
	//1:1문의 답장
	@RequestMapping(value = "/manager/private/answer")
	public ModelAndView answer(ModelAndView mView, IndividualDto dto, HttpServletRequest req) {
		
		individualService.answer(dto, req);
		mView.setViewName("manager/private/mypage");
		return mView;
	}
}
