package com.car.myapp.cardata.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.cardata.dao.CarDataDao;
import com.car.myapp.cardata.dto.CarDataDto;
import com.car.myapp.cardata.service.CarDataService;
import com.car.myapp.carimage.dto.CarImageDto;

@Controller
public class CarDataController {

	@Autowired
	CarDataDao dao;
	
	@Autowired
	CarDataService service;

	@RequestMapping("/car/carList")
	public ModelAndView carList(ModelAndView mView) {
		mView.setViewName("car/carList");
		return mView;
	}

	@RequestMapping("/car/carList_ajax")
	@ResponseBody
	public Map<String, Object> carList_ajax(HttpSession session, CarDataDto dto) {

		dto.setStartRowNum(1);
		dto.setEndRowNum(10);

		Map<String, Object> map=service.ajaxCarList(dto, session);
		
		return map;
	}

	@RequestMapping("/car/m_name_ajax")
	@ResponseBody
	public List<String> m_name_ajax(CarDataDto dto) {
		List<String> list = service.ajaxModelList(dto);

		return list;
	}

	@RequestMapping("/car/insertform")
	public String insertForm() {
		return "car/insertform";
	}

	@RequestMapping("/car/insert")
	public String insert(HttpSession session, HttpServletRequest request, CarDataDto dto, @RequestParam("image") List<String> images) {
		
		service.addData(session, request, dto, images);
		
		return "redirect:carList.do";
	}

	@RequestMapping(value = "/car/file_upload", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> file_upload(HttpServletRequest request,@RequestParam("file") List<MultipartFile> files) {
		
		List<Map<String, Object>> list=service.file_upload(request, files);
		
		return list;
	}
	
	@RequestMapping(value = "/car/file_delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean file_delete(HttpServletRequest request) {
		
		service.removeFile(request);
		
		return true;
	}

	@RequestMapping("/car/search_car")
	public String search_car() {
		return "car/search_car";
	}

	@RequestMapping("/car/searchModel")
	@ResponseBody
	public List<CarDataDto> searchModel(HttpServletRequest request) {

		List<CarDataDto> list = service.searchModel(request);

		return list;
	}
	
	@RequestMapping("/car/detail")
	public ModelAndView detail(@RequestParam("num") String car_num,ModelAndView mView) {
		
		mView.addObject("car_num",car_num);
		
		mView.setViewName("/car/detail");
		return mView;
	}
	
	@RequestMapping("/car/detail_ajax")
	@ResponseBody
	public Map<String, Object> detail_ajax(HttpServletRequest request) {
		
		Map<String, Object> map = service.getData(request);
		
		return map;
	}
}
