package com.car.myapp.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.test.dao.TestDao;
import com.car.myapp.test.dto.TestDto;


@Service
public class TestServiceImpl implements TestService{

	@Autowired
	private TestDao dao;
	
	@Override
	public void getList(ModelAndView mView) {
		List<TestDto> list = dao.getList();
		mView.addObject("list",list);
	}

	@Override
	public void insert(ModelAndView mView,TestDto dto) {
		boolean isSuccess=dao.insert(dto);
		mView.addObject("isSuccess",isSuccess);
	}

	@Override
	public void delete(ModelAndView mView,int num) {
		boolean isSuccess=dao.delete(num);	
		mView.addObject("isSuccess",isSuccess);
	}

	@Override
	public void update(ModelAndView mView,TestDto dto) {
		boolean isSuccess=dao.update(dto);
		mView.addObject("isSuccess",isSuccess);
	}

}
