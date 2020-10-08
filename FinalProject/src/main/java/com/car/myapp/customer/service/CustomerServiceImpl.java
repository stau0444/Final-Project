package com.car.myapp.customer.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.myapp.customer.dao.CustomerDao;
import com.car.myapp.manager.dto.IndividualDto;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerDao customerDao;

	@Override
	public void insertQuestion(IndividualDto dto, HttpServletRequest req) {
		// TODO Auto-generated method stub
		String id = (String)req.getSession().getAttribute("id");
		dto.setUser_id(id);
		
		customerDao.insertQuestion(dto);
	}
}
