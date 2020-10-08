package com.car.myapp.cardata.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.cardata.dto.CarDataDto;

public interface CarDataService {
	public List<CarDataDto> ajaxCarList(CarDataDto dto);
	public List<String> ajaxModelList(CarDataDto dto);
	public void addData(HttpServletRequest request,CarDataDto dto);
	public Map<String, Object> file_upload(HttpServletRequest request, List<MultipartFile> images);
	public void removeFile(HttpServletRequest request);
	public List<CarDataDto> searchModel(HttpServletRequest request);
	public void getData(HttpServletRequest request);
}
