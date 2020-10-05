package com.car.myapp.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.manager.dao.AdminDao;
import com.car.myapp.manager.dto.PageDto;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5;

	@Override
	public Map<String, Object> addIp(String ip_num) {
		// TODO Auto-generated method stub
		
		boolean isSuccess = false;
		Map<String, Object> map  = new HashMap<String, Object>();
		
		String checkIp = adminDao.checkIp(ip_num);
		
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

	@Override
	public Map<String, Object> getList(HttpServletRequest req) {
		// TODO Auto-generated method stub
		int pageNum=1;	
		
		String strPageNum=req.getParameter("pageNum");
		if(strPageNum != null){
			pageNum=Integer.parseInt(strPageNum);
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		PageDto dto = new PageDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<String> list = adminDao.getList(dto);
		int totalRow = adminDao.getCount();
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		List<Integer> pageList = new ArrayList<Integer>();
		
		for(int i = startPageNum; i <= endPageNum; i++) {
			pageList.add(i);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageDto", dto);
		map.put("pageList", pageList);
		
		return map;
	}

	@Override
	public void login(ModelAndView mView, HttpServletRequest req) {
		String ip = req.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = req.getHeader("Proxy-Client-IP");
		}
		if(ip == null) {
			ip = req.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null) {
			ip = req.getHeader("HTTP_CLIENT_IP");
		}
		if(ip == null) {
			ip = req.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if(ip == null) {
			ip = req.getRemoteAddr();
		}
		
		System.out.println(ip);
		String check_ip = adminDao.checkIp(ip);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(check_ip == null) {
			mView.addObject("isSuccess", false);
		}else {
			mView.addObject("isSuccess", true);
			req.getSession().setAttribute("id", "admin");
		}
	}

	
}
