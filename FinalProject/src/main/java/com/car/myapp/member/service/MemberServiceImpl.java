package com.car.myapp.member.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.MailAuth;
import com.car.myapp.member.dao.MemberDao;
import com.car.myapp.member.dto.BookMarkDto;
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
		System.out.println("isvalid:"+isValid);
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("isValid",isValid);
		if(dto.getUserPhone()!=null) {
			map.put("userPhone",dto.getUserPhone());
			//저장되 있는 인증번호를 지워준다
			memberDao.deleteVCode(dto.getUserPhone());
			//map을 리턴해준다
		}else{
			map.put("userMail",dto.getUserMail());
			//저장되 있는 인증번호를 지워준다
			memberDao.deleteVCodeMail(dto.getUserMail());
			//map을 리턴해준다
		}
		
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
			//회원 구분을 불러와 세션을 담아준다.
			MemberDto user_info=memberDao.getUserInfo(inputId);
			//여러개 쿼리로 각각의 필요한 정보만 빼오는게 나을지 한번에 받아와서 쓰는게 좋을지 결론은 떄에떄라 다를거같다. 
			//아이디와 동일여부를 담아주고 세션영역에 아이디를 담는다 
			map.put("isValid",true);
			map.put("id",inputId);
			session.setAttribute("id", inputId);
			session.setAttribute("user_sort", user_info.getUser_sort());
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
	//마이페이지 유저정보가져오기
	@Override
	public Map<String,Object> getInfo(String user_id) {
		Map<String,Object> map=new HashMap<String, Object>();
		MemberDto dto=memberDao.getUserInfo(user_id);
		map.put("userinfo",dto);
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
	
	//이메일전송 메서드
	@Override
	public Map<String, Object> sendMail(String user_mail) {
			
		//인증번호 생성
		Integer verificationNum = ThreadLocalRandom.current().nextInt(100000, 1000000);
		String verificationCode=verificationNum.toString();
		
		memberDao.deleteVCodeMail(user_mail);
			
		Properties prop = System.getProperties();
	       prop.put("mail.smtp.starttls.enable", "true");
	       prop.put("mail.smtp.host", "smtp.gmail.com");
	       prop.put("mail.smtp.auth", "true");
	       prop.put("mail.smtp.port", "587");
	        
	       Authenticator auth = new MailAuth();
	        
	       Session session = Session.getDefaultInstance(prop, auth);
	        
	       MimeMessage msg = new MimeMessage(session);
	    
	       try {
	           msg.setSentDate(new Date());  
	           msg.setFrom(new InternetAddress("stau04@gmail.com", "MYCAR"));
	           InternetAddress to = new InternetAddress("stau04@gmail.com");         
	           msg.setRecipient(javax.mail.Message.RecipientType.TO, to);            
	           msg.setSubject("MYCAR에서 보낸 인증번호입니다", "UTF-8");            
	           msg.setText("MYCAR에서 보낸 인증번호입니다"+verificationCode, "UTF-8");             
	           Transport.send(msg);
	            
	       } catch(AddressException ae) {            
	           System.out.println("AddressException : " + ae.getMessage());           
	       } catch(MessagingException me) {            
	           System.out.println("MessagingException : " + me.getMessage());
	       } catch(UnsupportedEncodingException e) {
	           System.out.println("UnsupportedEncodingException : " + e.getMessage());			
	       }
	        //인증 DB에 저장할 dto 생성
	        verificationDto dto=new verificationDto();
	        dto.setUserMail(user_mail);
	        System.out.println(user_mail);
	        dto.setVerificationCode(verificationCode);
	        memberDao.verfication(dto);
	        Map<String, Object> map=new HashMap<String, Object>();
			return map;
		}
	//북마크 추가 
	@Override
	public Map<String, Object> addBookmark(String car_num,HttpSession session) {
		//판매차량번호와 유저아이디를 불러와서 dto에 넣어준다
		String user_id=(String)session.getAttribute("id");
		BookMarkDto dto=new BookMarkDto();
		dto.setCar_num(car_num);
		dto.setUser_id(user_id);
		//북마크 정보를 저장하고 성패여부를 boolean으로 담는다
		boolean isAdded=memberDao.addBookmark(dto);
		//
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("bookmarkinfo", dto);
		map.put("isAdded",isAdded);
		
		return map;
		
	}
	@Override
	public Map<String, Object> deleteBookmark(String car_num, HttpSession session) {
		String user_id=(String)session.getAttribute("id");
		BookMarkDto dto=new BookMarkDto();
		dto.setCar_num(car_num);
		dto.setUser_id(user_id);
		//북마크 정보를 저장하고 성패여부를 boolean으로 담는다
		boolean isDeleted=memberDao.deleteBookmark(dto);
		//
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("bookmarkinfo", dto);
		map.put("isDeleted",isDeleted);
		
		return map;
	}
	@Override
	public Map<String, Object> checkBookmark(String car_num, HttpSession session) {
		String user_id=(String)session.getAttribute("id");
		BookMarkDto dto=new BookMarkDto();
		dto.setCar_num(car_num);
		dto.setUser_id(user_id);
		//북마크 정보를 저장하고 성패여부를 boolean으로 담는다
		boolean isChecked=memberDao.checkBookmark(dto);
		//
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("isChecked",isChecked);
		
		return map;
	}
	@Override
	public Map<String, Object> getFavoritList(HttpSession session) {
		String user_id=(String)session.getAttribute("id");
		List<String> list=memberDao.getFavoritList(user_id);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("favoritList",list);
		return map;
	}
}
