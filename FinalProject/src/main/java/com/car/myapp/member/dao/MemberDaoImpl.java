package com.car.myapp.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public boolean insert(MemberDto dto) {
		int isSuccess=session.insert("member.insert",dto);
		if(isSuccess>0) {
			return true;
		}else {
			return false;			
		}
	}
}
