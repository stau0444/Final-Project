package com.car.myapp.review.service;

import java.util.List;

import com.car.myapp.review.dto.ReplyDto;

public interface ReplyService {
    // 댓글 목록
    public List<ReplyDto> list(Integer num);
    // 댓글 입력
    public void create(ReplyDto dto);
    // 댓글 수정
    public void update(ReplyDto dto);
    // 댓글 삭제
    public void delete(Integer rno);
}
