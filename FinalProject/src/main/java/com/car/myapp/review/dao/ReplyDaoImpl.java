package com.car.myapp.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.review.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReplyDto> getList(ReplyDto dto) {
		
		return session.selectList("reviewReply.getList", dto);
	}

	@Override
	public void delete(int num) {
		session.update("reviewReply.delete", num);
	}

	@Override
	public void insert(ReplyDto dto) {
		session.insert("reviewReply.insert", dto);
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("reviewReply.getSequence");
	}

	@Override
	public void update(ReplyDto dto) {
		session.update("reviewReply.update", dto);
	}

	@Override
	public ReplyDto getData(int num) {
		
		return session.selectOne("reviewReply.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		
		return session.selectOne("reviewReply.getCount", ref_group);
	}

}
