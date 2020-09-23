package com.car.myapp.member.dao;

import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.verificationDto;

public interface MemberDao {
	public boolean insert(MemberDto dto);
	public boolean checkId(String user_id);
	public boolean verfication(verificationDto dto);
	public boolean checkVCode(verificationDto dto);
	public boolean deleteVCode(String userPhone);
}
