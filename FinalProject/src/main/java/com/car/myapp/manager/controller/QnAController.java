package com.car.myapp.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.car.myapp.manager.service.IndividualService;
import com.car.myapp.manager.service.QnAService;

@Controller
public class QnAController {

	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private IndividualService individualService;
	
	
}
