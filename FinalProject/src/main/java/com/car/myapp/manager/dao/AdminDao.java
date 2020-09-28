package com.car.myapp.manager.dao;

import java.util.List;

public interface AdminDao {
	public String checkIp(String ip_num);
	public void addIp(String ip_num);
	public List<String>ipList();
	public int removeIp(String ip_num);
}
