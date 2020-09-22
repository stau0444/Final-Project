package com.car.myapp.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.myapp.manager.dao.IndividualDao;

@Service
public class IndividualServiceImpl implements IndividualService{
	
	@Autowired
	private IndividualDao individualDao;

}
