package com.car.myapp.manager.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QnAService {
	public Map<String, Object> getList_f(HttpServletRequest req);
	public Map<String, Object> delete(int qna_num);
}
