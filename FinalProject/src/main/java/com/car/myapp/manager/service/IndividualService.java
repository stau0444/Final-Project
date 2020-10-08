package com.car.myapp.manager.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface IndividualService {
	public Map<String, Object> getList_iq(HttpServletRequest req);
	public Map<String, Object> getData_iq(int iq_num);
}
