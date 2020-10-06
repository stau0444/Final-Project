package com.car.myapp.member.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.verificationDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession session;
	//회원 등록 메서드
	@Override
	public boolean insert(MemberDto dto) {
		int isSuccess=session.insert("member.insert",dto);
		if(isSuccess>0) {
			return true;
		}else {
			return false;			
		}
	}
	//아이디 중복확인 메서드
	@Override
	public boolean checkId(String user_id) {
		String isExist=session.selectOne("member.checkid",user_id);
		if(isExist==null) {
			return false;
		}else {
			return true;
		}
	}
	//유저에게 전송된 인증번호와 유저 휴대전화번호를 DB에 저장하는 메서드
	@Override
	public boolean verfication(verificationDto dto) {
		int isValid=session.insert("member.verification", dto);
		if(isValid>0) {
			return true;
		}else {
			return false;
		}
	}
	//입력한 인증번호와 저장된 인증번호와 휴대전화번호를 비교하는 메소드
	@Override
	public boolean checkVCode(verificationDto dto,HttpSession sessionV) {
		String isExist=session.selectOne("member.checkVCode", dto);
		if(isExist==null) {
			return false;
		}else {
			sessionV.setAttribute("isVerified", "verified");
			return true;			
		}
	}
	//저장된 인증번호를 지워주는 메서드
	@Override
	public boolean deleteVCode(String userPhone) {
		int isDelete=session.delete("member.deleteVCode",userPhone);
		if(isDelete>0) {
			return true;
		}else {
			return false;			
		}
	}
	//비밀번호 찾기시 아이디가 존재하는지 확인하고 존재한다면 회원아이디와,비밀번호를 가져오는 메서드 
	@Override
	public MemberDto isExistId(String user_id) {
		MemberDto savedDto=session.selectOne("member.isExistId",user_id);
		return savedDto;
	}
	//입력한 핸드폰 번호로 등록된 아이디를 불러오는 메서드
	@Override
	public String getUserId(String user_phone) {
		String userInfo=session.selectOne("member.getUserId",user_phone);
		return userInfo;
	}
	//회원정보 전체를 가져오는 메서드
	@Override
	public MemberDto getUserInfo(String user_id) {
		MemberDto userInfo=session.selectOne("member.getUserInfo", user_id);
		return userInfo;
	}
	//본인인증후 비밀번호를 업데이트하는 메서드 
	@Override
	public boolean changePwd(MemberDto dto) {
		int isChanged=session.update("member.changePwd",dto);
		if(isChanged>0) {
			return true;
		}else {
			return false;			
		}
	}
	//본인인증시 휴대전화번호를 확인해 주는 메서드
	@Override
	public boolean checkPhone(String user_phone) {
		String isExist=session.selectOne("member.checkPhone",user_phone);
		if(isExist!=null) {
			return true;
		}else {
			return false;			
		}
	}
}
