package com.car.myapp.manager.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.myapp.MailAuth;
import com.car.myapp.manager.dao.IndividualDao;
import com.car.myapp.manager.dto.IndividualDto;
import com.car.myapp.manager.dto.PageDto;

@Service
public class IndividualServiceImpl implements IndividualService {

	@Autowired
	private IndividualDao individualDao;

	// 한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT = 5;
	// 하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT = 5;

	// 접수된 1:1문의 목록 조회(페이징 처리 포함)
	@Override
	public Map<String, Object> getList_iq(HttpServletRequest req) {
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

		List<IndividualDto> list = individualDao.getList_iq(dto);
		int totalRow = individualDao.getCount();
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;

		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount; // 보정해준다.
		}

		List<Integer> pageList = new ArrayList<Integer>();

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
	public Map<String, Object> getData_iq(int iq_num) {
		// TODO Auto-generated method stub
		IndividualDto iq_dto = individualDao.getData(iq_num);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", iq_dto);

		return map;
	}

	@Override
	public void answer(IndividualDto dto, HttpServletRequest req) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");

		Authenticator auth = new MailAuth();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(dto.getIq_email(), "MYCAR"));
	        InternetAddress to = new InternetAddress(dto.getIq_email());         
	        msg.setRecipient(javax.mail.Message.RecipientType.TO, to);            
	        msg.setSubject(dto.getIq_title(), "UTF-8");            
	        msg.setText(dto.getUser_id() +"님의 문의사항입니다.\n"
	        		+ "제목 : " + dto.getIq_title() +"\n" 
	        		+ "문의 내용 : " + dto.getIq_content()+"\n"
	        		+ "답변 : " + dto.getIq_content_a()+"\n", "UTF-8");
	        Transport.send(msg);
	        
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		individualDao.delete(dto.getIq_num());
        
	}

}
