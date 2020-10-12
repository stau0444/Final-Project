package com.car.myapp.manager.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.car.myapp.manager.dto.IndividualDto;

public interface IndividualService {
	public Map<String, Object> getList_iq(HttpServletRequest req);
	public Map<String, Object> getData_iq(int iq_num);
	public void answer(IndividualDto dto, HttpServletRequest req);
}
