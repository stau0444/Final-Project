package com.car.myapp.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.customer.service.CustomerService;
import com.car.myapp.manager.dto.IndividualDto;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/service/private/individual_form")
	public String individualForm() {
		return "service/private/individual_form";
	}
	
	@RequestMapping("/service/private/ask")
	public ModelAndView individualAsk(ModelAndView mView, IndividualDto dto, HttpServletRequest req) {
		
		customerService.insertQuestion(dto, req);
		mView.setViewName("redirect:/index.do");
		return mView;
	}
}
