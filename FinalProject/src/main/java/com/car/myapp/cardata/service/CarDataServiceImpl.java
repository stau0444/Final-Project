package com.car.myapp.cardata.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.car.myapp.cardata.dao.CarDataDao;
import com.car.myapp.cardata.dto.CarDataDto;
import com.car.myapp.carimage.dto.CarImageDto;

@Service
public class CarDataServiceImpl implements CarDataService {

	@Autowired
	CarDataDao dao;
	
	@Override
	public List<CarDataDto> ajaxCarList(CarDataDto dto) {
		return dao.getList(dto);
	}

	@Override
	public List<String> ajaxModelList(CarDataDto dto) {
		return dao.checkModel(dto);
	}

	@Override
	public void addData(HttpServletRequest request, CarDataDto dto) {
		// TODO Auto-generated method stub
		/*
		List<String> images=new ArrayList<String>();
		images.addAll(request.getParameterValues("image"));
		request.getParameterValues("image");
		
		List<CarImageDto> imageDto=new ArrayList<CarImageDto>();

		for(int i=0;i<images.size();i++) {
			CarImageDto tmp=new CarImageDto();
			
			tmp.setCar_num(dto.getCar_num());
			tmp.setSeller_id(dto.getSeller_id());
			tmp.setImage(images.get(i));
			
			if(i == Integer.parseInt(index)) {
				tmp.setIsMain(1);
			}else {
				tmp.setIsMain(0);
			}
			
			imageDto.add(tmp);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", imageDto);
		
		dao.insertSellData(dto);
		dao.insertImages(map);*/
	}

	public Map<String, Object> file_upload(HttpServletRequest request, List<MultipartFile> images) {
List<CarImageDto> imageDto=new ArrayList<CarImageDto>();

		
		return null;
	}

	@Override
	public void removeFile(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CarDataDto> searchModel(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void getData(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

}
