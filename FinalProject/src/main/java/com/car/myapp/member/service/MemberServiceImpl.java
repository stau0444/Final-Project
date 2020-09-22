package com.car.myapp.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.member.dao.MemberDao;
import com.car.myapp.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public boolean identification() {
		boolean isCertified = true;
		if (isCertified) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void addUser(ModelAndView mView, MemberDto dto) {

		String inputPwd = dto.getUser_pwd();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(inputPwd); 
		dto.setUser_pwd(encodedPwd);
		boolean isSuccess = memberDao.insert(dto);
		mView.addObject("isSuccess", isSuccess);
		
	}

	@Override
	public Map<String, Object> checkId(String user_id) {
		boolean isExist=memberDao.checkId(user_id);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("isExist", isExist);
		return map;
	}
	

}
