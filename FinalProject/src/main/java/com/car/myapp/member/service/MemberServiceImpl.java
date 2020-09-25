package com.car.myapp.member.service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.member.dao.MemberDao;
import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.verificationDto;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


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
	public void addUser(ModelAndView mView, MemberDto dto,HttpSession sessionV) {

		String inputPwd = dto.getUser_pwd();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(inputPwd); 
		dto.setUser_pwd(encodedPwd);
		boolean isSuccess = memberDao.insert(dto,sessionV);
		mView.addObject("isSuccess", isSuccess);
		
	}

	@Override
	public Map<String, Object> checkId(String user_id) {
		boolean isExist=memberDao.checkId(user_id);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("isExist", isExist);
		return map;
	}

	@Override
	public Map<String, Object> sendSMS(HttpServletRequest request) {
		
		
		//인증번호
		Integer verificationNum = ThreadLocalRandom.current().nextInt(100000, 1000000);
		String verificataionCode=verificationNum.toString();
		System.out.println("verificationCode:"+verificataionCode);
		
		//유저 핸드폰번호
		String userPhone=request.getParameter("userPhone");
		
		//입력한 번호로  DB에 저장되 있는게 있다면 삭제시켜주는 코드 (같은번호로 여러개 인증번호가 저장되는 것을 방지)
		memberDao.deleteVCode(userPhone);
		
		//인증번호 핸드폰번호 담을 DTO
		verificationDto dto= new verificationDto();
		dto.setUserPhone(userPhone);
		dto.setVerificationCode(verificataionCode);
		
		//인증번호를 DB에 담아준다.
		boolean isValid=memberDao.verfication(dto);
		//리턴할 맵 생성
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("userPhone", userPhone);
		map.put("verificataionCode",verificataionCode);
		map.put("isValid",isValid);
		
		
		String api_key = "NCSIH9VUTCCZAFU5";
	    String api_secret = "HRDIEAV3A2JBHDIUETNRZ6ZJMQJ2PM4S";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhone);
	    params.put("from", "01091150444");
	    params.put("type", "SMS");
	    params.put("text", verificataionCode);
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
		return map;
	}

	@Override
	public Map<String, Object> checkVCode(verificationDto dto,HttpSession sessionV) {
		boolean isValid=memberDao.checkVCode(dto,sessionV);
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("isValid",isValid);
		memberDao.deleteVCode(dto.getUserPhone());
		return map;
	}

	@Override
	public Map<String, Object> loginProcess(MemberDto dto, ModelAndView mView, HttpSession session) {
		boolean isValid=false;
		String inputId=dto.getUser_id();
		MemberDto savedDto=memberDao.isExistId(inputId);
		if(savedDto!=null) {
			String savedPwd=savedDto.getUser_pwd();
			String inputPwd=dto.getUser_pwd();
			isValid=BCrypt.checkpw(inputPwd, savedPwd);
		}
		System.out.println(isValid);
		Map<String,Object> map = new HashMap<String, Object>();
		if(isValid) {
			map.put("isValid",true);
			map.put("id",inputId);
			session.setAttribute("id", inputId);
		}else {
			map.put("isValid",false);
		}
		return map;
	}
	
	

}
