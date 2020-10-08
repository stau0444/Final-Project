package com.car.myapp.customer.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.manager.dto.IndividualDto;

@Repository
public class CustomerDaoImpl implements CustomerDao{
	@Autowired
	private SqlSession session;

	@Override
	public void insertQuestion(IndividualDto dto) {
		// TODO Auto-generated method stub
		session.insert("customer.insert", dto);
	}
	
}
