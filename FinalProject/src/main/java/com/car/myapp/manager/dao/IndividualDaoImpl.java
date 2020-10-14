package com.car.myapp.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.manager.dto.IndividualDto;
import com.car.myapp.manager.dto.PageDto;

@Repository
public class IndividualDaoImpl implements IndividualDao{

	@Autowired
	private SqlSession session;

	@Override
	public List<IndividualDto> getList_iq(PageDto dto) {
	
		return session.selectList("qna.getList_iq", dto); 
	}

	@Override
	public int getCount() {
		
		return session.selectOne("qna.getCount_iq");
	}

	@Override
	public IndividualDto getData(int iq_num) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.getData_iq", iq_num);
	}

	@Override
	public void delete(int iq_num) {
		// TODO Auto-generated method stub
		session.delete("qna.delete", iq_num);
	}
}
