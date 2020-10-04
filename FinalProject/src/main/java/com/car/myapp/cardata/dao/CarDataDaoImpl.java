package com.car.myapp.cardata.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.cardata.dto.CarDataDto;

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
		System.out.println(session.getConfiguration().getMappedStatement("CarData.checkModel").getBoundSql(dto).getSql()); //mybatis에서 나오는 쿼리 확인
		return session.selectList("CarData.checkModel", dto);
	}

}
