package com.car.myapp.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.test.dto.TestDto;

@Repository

public class TestDaoImpl implements TestDao {
	
	@Autowired 
	private SqlSession session;
	
	@Override
	public boolean insert(TestDto dto) {
		int isSuccess=session.insert("test.insert",dto);
		if(isSuccess>0) {
			return true;
		}else {			
			return false;
		}
	}

	@Override
	public boolean delete(int num) {
		int isSuccess=session.insert("test.delete",num);
		if(isSuccess>0) {
			return true;
		}else {			
			return false;
		}
	}

	@Override
	public boolean update(TestDto dto) {
		int isSuccess=session.update("test.insert",dto);
		if(isSuccess>0) {
			return true;
		}else {			
			return false;
		}		
	}

	@Override
	public List<TestDto> getList() {
		List<TestDto> list=session.selectList("test.getList");
		return list;
	}

}
