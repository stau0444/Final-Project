package com.car.myapp.test.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.test.dto.TestDto;

public interface TestService {
	public void getList(ModelAndView mView);
	public void insert(ModelAndView mView,TestDto dto);
	public void delete(ModelAndView mView,int num);
	public void update(ModelAndView mView,TestDto dto);
}
