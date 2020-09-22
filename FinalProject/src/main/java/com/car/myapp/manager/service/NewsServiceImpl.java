package com.car.myapp.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.myapp.manager.dao.NewsDao;

@Service
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDao newsDao;
	
}
