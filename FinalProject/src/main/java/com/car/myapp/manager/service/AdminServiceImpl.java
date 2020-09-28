package com.car.myapp.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.myapp.manager.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;

	@Override
	public Map<String, Object> addIp(String ip_num) {
		// TODO Auto-generated method stub
		
		boolean isSuccess = false;
		Map<String, Object> map  = new HashMap<String, Object>();
		
		System.out.println(ip_num);
		String checkIp = adminDao.checkIp(ip_num);
		System.out.println(checkIp);
		
		if(checkIp == null) {
			isSuccess = true;
			adminDao.addIp(ip_num);
			map.put("isSuccess", isSuccess);
		}
		return map;
	}

	@Override
	public List<String> ipList() {
		// TODO Auto-generated method stub
		return adminDao.ipList();
	}

	@Override
	public Map<String, Object> deleteIp(String ip_num) {
		System.out.println(ip_num);
		boolean isSuccess = false;
		int result = adminDao.removeIp(ip_num);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ip", ip_num);
		if(result > 0) {
			isSuccess = true;
			map.put("isSuccess", isSuccess);
		}else {
			map.put("isSuccess", isSuccess);
		}
		
		
		return map;
	}
	
}
