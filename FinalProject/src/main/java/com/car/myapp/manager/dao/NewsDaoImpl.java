package com.car.myapp.manager.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NewsDaoImpl implements NewsDao{

	@Autowired
	private SqlSession session;
}
