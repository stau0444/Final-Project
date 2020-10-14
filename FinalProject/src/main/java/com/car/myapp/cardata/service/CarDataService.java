package com.car.myapp.cardata.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.cardata.dto.CarDataDto;

public interface CarDataService {
	public Map<String, Object> ajaxCarList(CarDataDto dto, HttpSession session);
	public List<String> ajaxModelList(CarDataDto dto);
	public void addData(HttpSession session,HttpServletRequest request,CarDataDto dto, List<String> images);
	public List<Map<String, Object>> file_upload(HttpServletRequest request, List<MultipartFile> files);
	public void removeFile(HttpServletRequest request);
	public List<CarDataDto> searchModel(HttpServletRequest request);
	public Map<String, Object> getData(HttpServletRequest request);
}
