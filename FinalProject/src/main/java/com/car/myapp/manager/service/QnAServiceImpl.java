package com.car.myapp.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.myapp.manager.dao.QnADao;
import com.car.myapp.manager.dto.IndividualDto;
import com.car.myapp.manager.dto.PageDto;
import com.car.myapp.manager.dto.QnADto;

@Service
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADao qnaDao;
	
	// 한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT = 5;
	// 하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT = 5;

	@Override
	public Map<String, Object> getList_f(HttpServletRequest req) {
		int pageNum = 1;

		String strPageNum = req.getParameter("pageNum");
		if (strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		PageDto dto = new PageDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		List<QnADto> list = qnaDao.getList_f(dto);
		int totalRow = qnaDao.getCount();
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;

		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount; // 보정해준다.
		}

		List<Integer> pageList = new ArrayList<Integer>();
		System.out.println(list);

		for (int i = startPageNum; i <= endPageNum; i++) {
			pageList.add(i);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageDto", dto);
		map.put("pageList", pageList);

		return map;
	}

	@Override
	public Map<String, Object> delete(int qna_num) {
		// TODO Auto-generated method stub
		qnaDao.delete(qna_num);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
}
