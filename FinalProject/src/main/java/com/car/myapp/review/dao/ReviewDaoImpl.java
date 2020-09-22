package com.car.myapp.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.review.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	private SqlSession session;

	@Override
	public List<ReviewDto> getList(ReviewDto dto) {
		
		return session.selectList("review.getList", dto);
	}

	@Override
	public int getCount(ReviewDto dto) {

		return session.selectOne("review.getCount", dto);
	}

	@Override
	public void insert(ReviewDto dto) {
		session.insert("review.insert", dto);
	}

	@Override
	public ReviewDto getData(int num) {
		return session.selectOne("review.getData", num);
	}

	@Override
	public void addViewCount(int num) {
		session.update("review.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("review.delete", num);
	}

	@Override
	public void update(ReviewDto dto) {
		session.update("review.update", dto);
	}
	//키워드가 들어있는 ReviewDto 를 전달받아서 글 정보를 리턴하는 메소드 
	@Override
	public ReviewDto getData(ReviewDto dto) {
		
		return session.selectOne("review.getData2", dto);
	}
	
}
