package com.car.myapp.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.car.myapp.review.dao.ReplyDao;
import com.car.myapp.review.dto.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService {
    
    @Inject
    ReplyDao replyDao;
    
    // 댓글 목록
    @Override
    public List<ReplyDto> list(Integer bno) {
        return replyDao.list(bno);
    }
    // 댓글 작성
    @Override
    public void create(ReplyDto dto) {
        replyDao.create(dto);
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
 