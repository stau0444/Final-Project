package com.car.myapp.manager.service;

import java.util.HashMap;
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
			map.put("isSuccess", isSuccess);
		}
		return map;
	}
	
}
