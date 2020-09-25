package com.car.myapp.manager.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession session;

	@Override
	public String checkIp(String ip_num) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.checkIp", ip_num);
	}

	@Override
	public void addIp(String ip_num) {
		// TODO Auto-generated method stub
		session.insert("admin.addIp", ip_num);
	}
	
	
	
}
