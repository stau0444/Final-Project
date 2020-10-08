package com.car.myapp.customer.service;

import javax.servlet.http.HttpServletRequest;

import com.car.myapp.manager.dto.IndividualDto;

public interface CustomerService {
	public void insertQuestion(IndividualDto dto, HttpServletRequest req);
}
