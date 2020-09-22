package com.car.myapp.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.myapp.manager.dao.QnADao;

@Service
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADao qnaDao;
}
