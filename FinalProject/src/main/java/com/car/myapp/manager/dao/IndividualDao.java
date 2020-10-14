package com.car.myapp.manager.dao;

import java.util.List;

import com.car.myapp.manager.dto.IndividualDto;
import com.car.myapp.manager.dto.PageDto;

public interface IndividualDao {
	public List<IndividualDto> getList_iq(PageDto dto);
	public int getCount();
	public IndividualDto getData(int iq_num);
	public void delete(int iq_num);
}
