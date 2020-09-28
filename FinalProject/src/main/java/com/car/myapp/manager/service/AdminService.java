package com.car.myapp.manager.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	public Map<String, Object> addIp(String ip_num);
	public List<String> ipList();
	public Map<String, Object> deleteIp(String ip_num);
}
