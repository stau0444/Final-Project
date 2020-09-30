package com.car.myapp.member.dao;


import java.util.List;

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

	@Override
	public boolean insert(MemberDto dto,HttpSession sessionV) {
		int isSuccess=session.insert("member.insert",dto);
		if(isSuccess>0) {
			sessionV.invalidate();
			return true;
		}else {
			return false;			
		}
	}

	@Override
	public boolean checkId(String user_id) {
		String isExist=session.selectOne("member.checkid",user_id);
		if(isExist==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public boolean verfication(verificationDto dto) {
		int isValid=session.insert("member.verification", dto);
		if(isValid>0) {
			System.out.println("인증번호들어옴");
			return true;
		}else {
			return false;
		}
	}

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

	@Override
	public boolean deleteVCode(String userPhone) {
		int isDelete=session.delete("member.deleteVCode",userPhone);
		if(isDelete>0) {
			return true;
		}else {
			return false;			
		}
	}

	@Override
	public MemberDto isExistId(String user_id) {
		MemberDto savedDto=session.selectOne("member.isExistId",user_id);
		return savedDto;
	}

	@Override
	public String getUserId(String user_phone) {
		String userInfo=session.selectOne("member.getUserId",user_phone);
		return userInfo;
	}

	@Override
	public MemberDto getUserInfo(String user_id) {
		MemberDto userInfo=session.selectOne("member.getUserInfo", user_id);
		return userInfo;
	}

	@Override
	public boolean changePwd(MemberDto dto) {
		int isChanged=session.update("member.changePwd",dto);
		if(isChanged>0) {
			return true;
		}else {
			return false;			
		}
	}

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
