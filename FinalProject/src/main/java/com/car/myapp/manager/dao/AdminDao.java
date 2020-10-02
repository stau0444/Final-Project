package com.car.myapp.manager.dao;

import java.util.List;

import com.car.myapp.manager.dto.PageDto;

public interface AdminDao {
	public String checkIp(String ip_num);
	public void addIp(String ip_num);
	public List<String>ipList();
	public int removeIp(String ip_num);
	public List<String> getList(PageDto dto);
	public int getCount();
}
