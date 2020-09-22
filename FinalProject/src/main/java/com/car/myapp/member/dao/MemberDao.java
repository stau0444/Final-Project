package com.car.myapp.member.dao;

import com.car.myapp.member.dto.MemberDto;

public interface MemberDao {
	public boolean insert(MemberDto dto);
	public boolean checkId(String user_id);
}
