package com.car.myapp.cardata.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.car.myapp.cardata.dao.CarDataDao;
import com.car.myapp.cardata.dto.CarDataDto;
import com.car.myapp.carimage.dto.CarImageDto;

@Controller
public class CarDataController {

	@Autowired
	CarDataDao dao;

	@RequestMapping("/car/carList")
	public ModelAndView carList(ModelAndView mView) {
		mView.setViewName("car/carList");
		return mView;
	}

	@RequestMapping("/car/carList_ajax")
	@ResponseBody
	public List<CarDataDto> carList_ajax(CarDataDto dto) {

		dto.setStartRowNum(1);
		dto.setEndRowNum(10);

		List<CarDataDto> list = dao.getList(dto);
		return list;
	}

	@RequestMapping("/car/m_name_ajax")
	@ResponseBody
	public List<String> m_name_ajax(CarDataDto dto) {
		List<String> list = dao.checkModel(dto);

		return list;
	}

	@RequestMapping("/car/insertform")
	public String insertForm() {
		return "car/insertform";
	}

	@RequestMapping("/car/insert")
	public String insert(CarDataDto dto,@RequestParam("isMain") String index,@RequestParam("image") List<String> images) {
		
		dto.setSeller_id("soo2n13");
		
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
		dao.insertImages(map);
		
		return "car/carList";
	}

	@RequestMapping(value = "/car/file_upload", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> file_upload(HttpServletRequest request,@RequestParam("file") List<MultipartFile> files) {
		
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
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("fileName", saveFileName);
			map.put("orgName",orgFileName);
			list.add(map);
		}
		
		return list;
	}
	
	@RequestMapping(value = "/car/file_delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean file_delete(HttpServletRequest request,String saveFileName) {
		System.out.println(saveFileName);
		String path=request.getServletContext().getRealPath("/upload")+
				File.separator+saveFileName;
		new File(path).delete();
		
		return true;
	}

	@RequestMapping("/car/search_car")
	public String search_car() {
		return "car/search_car";
	}

	@RequestMapping("/car/searchModel")
	@ResponseBody
	public List<CarDataDto> searchModel(HttpServletRequest request) {

		String m_name = request.getParameter("m_name");
		List<CarDataDto> list = dao.getModel(m_name);

		return list;
	}
}
