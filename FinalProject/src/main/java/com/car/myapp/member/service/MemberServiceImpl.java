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
	//회원 추가 서비스
	@Override
	public Map<String, Object> addUser(MemberDto dto) {
		//입력받은  비밀번호를 변수에 넣어준다 
		String inputPwd = dto.getUser_pwd();
		//암호화 인코딩객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//인코딩한 암호를 변수에 담는다
		String encodedPwd = encoder.encode(inputPwd); 
		//인코딩된 암호를 Dto에 다시 담아준다
		dto.setUser_pwd(encodedPwd);
		//DB에 insert하고 성공여부를 boolean 값으로 받는다
		boolean isSuccess = memberDao.insert(dto);
		//리턴받은 값을 Map에 담고  
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSucess", isSuccess);
		//map을 리턴해준다.
		return map;
	}

	@Override
	public Map<String, Object> checkId(String user_id) {
		//입력받은 아이디를 가지고 id를 check하고 성공여부를 boolean으로 받는다.
		boolean isExist = memberDao.checkId(user_id);
		//성공여부를 map에 담고
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("isExist", isExist);
		//map을 리턴해준다
		return map;
	}

	@Override
	public Map<String, Object> sendSMS(HttpServletRequest request) {
		
		//난수를 생성해준다
		//ThreadLocalRandom.current():스레드 별로 시드 값을 관리하여 멀티 스레드 요청에 대해서 빠르게 처리
		Integer verificationNum = ThreadLocalRandom.current().nextInt(100000, 1000000);
		//생성한 숫자를 스트링으로 바꿔준다
		String verificataionCode=verificationNum.toString();
		System.out.println("verificationCode:"+verificataionCode);
		
		//리퀘스트로 전달된 유저 핸드폰번호를 읽어온다
		String userPhone=request.getParameter("userPhone");
		//입력한 번호로  DB에 저장되 있는게 있다면 삭제시켜주는 코드 (같은번호로 여러개 인증번호가 저장되는 것을 방지)
		memberDao.deleteVCode(userPhone);
		
		//인증번호 핸드폰번호 담을 DTO
		verificationDto dto= new verificationDto();
		dto.setUserPhone(userPhone);
		dto.setVerificationCode(verificataionCode);
		
		//인증번호를 DB에 담아준다.
		boolean isValid=memberDao.verfication(dto);
		
		//리턴할 맵 생성(테스트용)
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("userPhone", userPhone);
		map.put("verificataionCode",verificataionCode);
		map.put("isValid",isValid);
		
		//api 사용 key, code
		String api_key = "NCSIH9VUTCCZAFU5";
	    String api_secret = "HRDIEAV3A2JBHDIUETNRZ6ZJMQJ2PM4S";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    //보낼정보
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhone);
	    params.put("from", "01091150444");
	    params.put("type", "SMS");
	    params.put("text","MYCAR 에서 보낸 인증번호입니다"+"["+verificataionCode+"]");
	    params.put("app_version", "test app 1.2"); // application name and version
	    try {
	    	//json으로 변형하여 입력받은 휴대전화번호로 전송
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	    	//에러코드 출력
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
		return map;
	}
	
	//인증번호 확인 서비스
	@Override
	public Map<String, Object> checkVCode(verificationDto dto,HttpSession sessionV) {
		//입력받은 인증번호를가 존재하는지 확인하고 여부를 변수에 담는다.
		boolean isValid=memberDao.checkVCode(dto,sessionV);
		//존재여부(인증성공여부) , 유대전화번호를 맵에 담는다 
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("isValid",isValid);
		map.put("userPhone",dto.getUserPhone());
		//저장되 있는 인증번호를 지워준다
		memberDao.deleteVCode(dto.getUserPhone());
		//map을 리턴해준다
		return map;
	}
	//로그인 프로세스
	@Override
	public Map<String, Object> loginProcess(MemberDto dto, ModelAndView mView, HttpSession session) {
		//유효여부 초기값 설정
		boolean isValid=false;
		//입력받은 아이디를 불러와 변수에담고
		String inputId=dto.getUser_id();
		//아이디가존재 하는지를 확인하고 존재한다면  아이디와 비밀번호를 리턴하고 Dto에 담는다
		MemberDto savedDto=memberDao.isExistId(inputId);
		//아이디가 존재할 경우
		if(savedDto!=null) {
			//DB에 저장된 비밀번호
			String savedPwd=savedDto.getUser_pwd();
			//입력받은 비밀번호
			String inputPwd=dto.getUser_pwd();
			//비교하고 동일한지 여부를 변수에 담는다
			isValid=BCrypt.checkpw(inputPwd, savedPwd);
		}
		System.out.println(isValid);
		//리턴해줄 map을 생성하여
		Map<String,Object> map = new HashMap<String, Object>();
		//동일하다면
		if(isValid) {
			//아이디와 동일여부를 담아주고 세션영역에 아이디를 담는다 
			map.put("isValid",true);
			map.put("id",inputId);
			session.setAttribute("id", inputId);
		//동일하지 않을때
		}else {
			map.put("isValid",false);
		}
		//map 리턴
		return map;
	}
	
	//유저 아이디만 가져오는 서비스
	@Override
	public String getUserId(String userPhone) {
		System.out.println(userPhone);
		String userId=memberDao.getUserId(userPhone);
		System.out.println("user:"+userId);
		return userId;
	}
	//유저 정보를 리턴하는 서비스
	@Override
	public Map<String,Object> getUserInfo(String user_id) {
		Map<String,Object> map=new HashMap<String, Object>();
		MemberDto dto=memberDao.getUserInfo(user_id);
		if(dto!=null) {
			map.put("isExsist", true);
			map.put("userPhone",dto.getUser_phone());
			System.out.println(dto.getUser_phone());
		}else {
			map.put("isExsist",false);
		}
		return map;
	}
	//비밀번호 변경 서비스
	@Override
	public Map<String, Object> changePwd(MemberDto dto) {
		//입력받은 비밀번호
		String inputPwd = dto.getUser_pwd();
		//암호화 객채생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//암호화 된 비밀번호
		String encodedPwd = encoder.encode(inputPwd);
		//dto에 set
		dto.setUser_pwd(encodedPwd);
		//비밀번호 update
		boolean isChanged=memberDao.changePwd(dto);
		//성공여부
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("isChanged", isChanged);
		return map;
	}
	//휴대전화번호 체크 서비스
	@Override
	public Map<String, Object> checkPhone(String user_phone) {
		boolean isExist=memberDao.checkPhone(user_phone);
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("isExist",isExist);
		return map;
	}
}
