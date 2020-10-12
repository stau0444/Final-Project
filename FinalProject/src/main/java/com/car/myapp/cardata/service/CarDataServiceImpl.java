package com.car.myapp.cardata.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public Map<String, Object> ajaxCarList(CarDataDto dto, HttpSession session) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		List<CarDataDto> list = dao.getList(dto);
		String id=(String)session.getAttribute("id");
		
		map.put("list", list);
		if(id == null) {
			map.put("isLogin", false);
		}else {
			map.put("isLogin", true);
		}
		
		return map;	
	}

	@Override
	public List<String> ajaxModelList(CarDataDto dto) {
		return dao.checkModel(dto);
	}

	@Override
	public void addData(HttpSession session ,HttpServletRequest request, CarDataDto dto, List<String> images) {
		String id=(String)session.getAttribute("id");
		String index=request.getParameter("isMain");
		
		dto.setSeller_id(id);
		List<CarImageDto> imageDto=new ArrayList<CarImageDto>();
		
		for(int i=0;i<images.size();i++) {
			CarImageDto tmp=new CarImageDto();
			
			tmp.setCar_num(dto.getCar_num());
			tmp.setSeller_id(id);
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
		dao.insertImages(map);
	}

	public List<Map<String, Object>> file_upload(HttpServletRequest request, List<MultipartFile> files) {
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		
		for (MultipartFile file : files) {		
			//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값 얻어오기 
			MultipartFile myFile=file;
			//원본 파일명
			String orgFileName=myFile.getOriginalFilename();
					
			// webapp/upload 폴더 까지의 실제 경로(서버의 파일시스템 상에서의 경로)
			String realPath=request.getServletContext().getRealPath("/upload");
			//저장할 파일의 상세 경로
			String filePath=realPath+File.separator;
			//디렉토리를 만들 파일 객체 생성
			File upload=new File(filePath);
			if(!upload.exists()) {//만일 디렉토리가 존재하지 않으면 
				upload.mkdir(); //만들어 준다.
			}
			//저장할 파일 명을 구성한다.
			String saveFileName=
						System.currentTimeMillis()+orgFileName;
			try {
				//upload 폴더에 파일을 저장한다.
				myFile.transferTo(new File(filePath+saveFileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			System.out.println(filePath);
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("fileName", saveFileName);
			map.put("orgName",orgFileName);
			list.add(map);
		}
		
		return list;
	}

	@Override
	public void removeFile(HttpServletRequest request) {
		String saveFileName=request.getParameter("saveFileName");
		
		String path=request.getServletContext().getRealPath("/upload")+
				File.separator+saveFileName;
		new File(path).delete();
	}

	@Override
	public List<CarDataDto> searchModel(HttpServletRequest request) {
		String m_name = request.getParameter("m_name");
		List<CarDataDto> list = dao.getModel(m_name);
		
		return list;
	}

	@Override
	public Map<String, Object> getData(HttpServletRequest request) {
		String car_num=request.getParameter("num");

		CarDataDto data=dao.getData(car_num);
		List<String> images=dao.getImages(car_num);
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("data", data);
		map.put("images", images);
		
		return map;
	}

}
