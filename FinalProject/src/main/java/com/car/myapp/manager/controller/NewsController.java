package com.car.myapp.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.car.myapp.manager.service.NewsService;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;
}
