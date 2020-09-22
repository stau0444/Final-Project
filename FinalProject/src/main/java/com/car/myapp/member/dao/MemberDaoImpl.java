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

	@Override
	public boolean checkId(String user_id) {
		String isExist=session.selectOne("member.checkid",user_id);
		
		System.out.println(isExist);
		if(isExist==null) {
			return false;
		}else {
			return true;
		}
	}
}
