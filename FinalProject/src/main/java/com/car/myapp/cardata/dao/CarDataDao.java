package com.car.myapp.cardata.dao;

import java.util.List;
import java.util.Map;

import com.car.myapp.cardata.dto.CarDataDto;
import com.car.myapp.carimage.dto.CarImageDto;

public interface CarDataDao {
	public List<CarDataDto> getList(CarDataDto dto);
	public List<CarDataDto> getModel(String m_name);
	public void insertSellData(CarDataDto dto); 
	public List<String> checkModel(CarDataDto dto);
	public void insertImages(Map<String, Object> map);
	public CarDataDto getData(String car_num);
	public List<CarImageDto> getImages(String car_num);
}
