package com.car.myapp.member.dao;

import javax.servlet.http.HttpSession;

import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.verificationDto;

public interface MemberDao {
	public boolean insert(MemberDto dto,HttpSession sessionV);
	public boolean checkId(String user_id);
	public boolean verfication(verificationDto dto);
	public boolean checkVCode(verificationDto dto,HttpSession sessionV);
	public boolean deleteVCode(String userPhone);
	public MemberDto isExistId(String user_id);
}
