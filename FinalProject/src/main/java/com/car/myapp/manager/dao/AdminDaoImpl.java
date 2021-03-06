package com.car.myapp.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.manager.dto.PageDto;

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

	@Override
	public List<String> ipList() {
		// TODO Auto-generated method stub
		return session.selectList("admin.ipList");
	}

	@Override
	public int removeIp(String ip_num) {
		// TODO Auto-generated method stub
		return session.delete("admin.removeIp", ip_num);
	}

	@Override
	public List<String> getList(PageDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("admin.getList", dto);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getCount");
	}

	
	
	
	
}
