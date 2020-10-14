package com.car.myapp.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.manager.dto.IndividualDto;
import com.car.myapp.manager.dto.PageDto;
import com.car.myapp.manager.dto.QnADto;

@Repository
public class QnADaoImpl implements QnADao{

	@Autowired
	private SqlSession session;

	@Override
	public List<QnADto> getList_f(PageDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("qna.getList_f", dto);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return session.selectOne("qna.getCount_f");
	}

	@Override
	public void delete(int qna_num) {
		// TODO Auto-generated method stub
		session.delete("qna.delete_f", qna_num);
	}
}
