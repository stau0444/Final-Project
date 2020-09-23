package com.car.myapp.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.car.myapp.review.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {
    @Inject
    SqlSession sqlSession;
    
    // 댓글 목록
    @Override
    public List<ReplyDto> list(Integer num) {
        return sqlSession.selectList("reply.listReply", num);
    }
    // 댓글 작성
    @Override
    public void create(ReplyDto dto) {
        sqlSession.insert("reply.insertReply", dto);
    }
    // 댓글 수정
    @Override
    public void update(ReplyDto dto) {
        // TODO Auto-generated method stub
 
    }
    // 댓글 삭제
    @Override
    public void delete(Integer rno) {
        // TODO Auto-generated method stub
 
    }
}
