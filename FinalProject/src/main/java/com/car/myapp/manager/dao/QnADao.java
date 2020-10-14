package com.car.myapp.manager.dao;

import java.util.List;

import com.car.myapp.manager.dto.IndividualDto;
import com.car.myapp.manager.dto.PageDto;
import com.car.myapp.manager.dto.QnADto;

public interface QnADao {
	public List<QnADto> getList_f(PageDto dto);
	public int getCount();
	public void delete(int qna_num);
}
