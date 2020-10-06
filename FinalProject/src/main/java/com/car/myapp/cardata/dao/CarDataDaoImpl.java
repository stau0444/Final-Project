package com.car.myapp.cardata.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.cardata.dto.CarDataDto;
import com.car.myapp.carimage.dto.CarImageDto;

@Repository
public class CarDataDaoImpl implements CarDataDao {

	@Autowired
	SqlSession session;
	
	@Override
	public List<CarDataDto> getList(CarDataDto dto) {
		//System.out.println(session.getConfiguration().getMappedStatement("CarData.getList").getBoundSql(dto).getSql()); //mybatis에서 나오는 쿼리 확인
		return session.selectList("CarData.getList", dto);
	}

	@Override
	public List<CarDataDto> getModel(String m_name) {

		return session.selectList("CarData.getModel", m_name);
	}

	@Override
	public void insertSellData(CarDataDto dto) {
		session.insert("CarData.insert", dto);
	}

	@Override
	public List<String> checkModel(CarDataDto dto) {
		//System.out.println(session.getConfiguration().getMappedStatement("CarData.checkModel").getBoundSql(dto).getSql()); //mybatis에서 나오는 쿼리 확인
		return session.selectList("CarData.checkModel", dto);
	}

	@Override
	public void insertImages(Map<String, Object> map) {
		//System.out.println(session.getConfiguration().getMappedStatement("CarData.image_upload").getBoundSql(map).getSql()); //mybatis에서 나오는 쿼리 확인
		session.update("CarData.image_upload", map);
	}

	@Override
	public CarDataDto getData(String car_num) {
		return session.selectOne("CarData.getData", car_num);
	}

	@Override
	public List<String> getImages(String car_num) {
		//System.out.println(session.getConfiguration().getMappedStatement("CarData.getImages").getBoundSql(car_num).getSql()); //mybatis에서 나오는 쿼리 확인
		return session.selectList("CarData.getImages", car_num);
	}


	

	

}
