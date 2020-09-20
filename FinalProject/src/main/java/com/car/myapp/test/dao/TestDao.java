package com.car.myapp.test.dao;

import java.util.List;

import com.car.myapp.test.dto.TestDto;

public interface TestDao {
	public boolean insert(TestDto dto);
	public boolean delete(int num);
	public boolean update(TestDto dto);
	public List<TestDto> getList(); 
}
