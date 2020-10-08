<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>차 목록 페이지 입니다.</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<style>
	.btn {
		font-size: 12px;
		width: 100px;
	}

	label {
		font-size: 12px;
	}
	.list_img {
		height: 100px;
	}
	.media:hover {
		box-shadow: 2px 2px 2px;
		cursor: pointer;
	}
</style>
</head>
<body  data-ng-controller="btnController" data-ng-init="load()">
	<div class="container">
		<div class="row">
			<div class="col-4">
				<ul class="nav nav-tabs text-center" id="myTab" role="tablist">
				  <!-- 국내차 버튼 -->
				  <li class="nav-item w-50" role="presentation">
				    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" data-ng-click="car_group=1;reset_chk();infoCheck()">국내</a>
				  </li>
				  <!-- 해외차 버튼 -->
				  <li class="nav-item w-50" role="presentation"> 
				    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" data-ng-click="car_group=0;reset_chk();infoCheck()">해외</a>
				  </li>
				</ul>
				<div class="tab-content" id="myTabContent">
				
					<!-- 차종선택 -->
				  	<button class="btn w-100 text-left" data-ng-click="c_sort_sh=!c_sort_sh">
				  	차 종
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" data-ng-hide="c_sort_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="c_sort_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle bg-light py-3" data-toggle="buttons" data-ng-show="c_sort_sh">
				  	
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="c_sort_chk[0]= !c_sort_chk[0];infoCheck()">
						    <input type="checkbox" /> 소형차
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="c_sort_chk[1]= !c_sort_chk[1];infoCheck()">
						    <input type="checkbox" /> 중형차
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="c_sort_chk[2]= !c_sort_chk[2];infoCheck()">
						    <input type="checkbox" /> 대형차
						  </label>
						</div>
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="c_sort_chk[3]= !c_sort_chk[3];infoCheck()">
						    <input type="checkbox" /> 스포츠카
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="c_sort_chk[4]= !c_sort_chk[4];infoCheck()">
						    <input type="checkbox" /> SUV
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="c_sort_chk[5]= !c_sort_chk[5];infoCheck()">
						    <input type="checkbox" /> 화물차
						  </label>
						</div>
					</div>
				
					<!-- 국내 차 선택 -->
				  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					
					<!-- 제조사 선택 -->
					<button class="btn w-100 text-left" data-ng-click="company_sh=!company_sh">
				  	제 조 사
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="company_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="company_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle bg-light py-3" data-toggle="buttons" data-ng-show="company_sh">
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[0]= !company_chk[0];infoCheck()">
						    <input type="checkbox" /> 현  대
						  </label>
						</div>
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[1]= !company_chk[1];infoCheck()">
						    <input type="checkbox" /> 기  아
						  </label>
						</div>
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[2]= !company_chk[2];infoCheck()">
						    <input type="checkbox" /> 제네시스
						  </label>
						</div>
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[3]= !company_chk[3];infoCheck()">
						    <input type="checkbox" /> 쉐 보 레
						  </label>
						</div>
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[4]= !company_chk[4];infoCheck()">
						    <input type="checkbox" /> 르노삼성
						  </label>
						</div>
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[5]= !company_chk[5];infoCheck()">
						    <input type="checkbox" /> 쌍  용
						  </label>
						</div>

					</div>	
					
				  </div>
				  <!-- 해외 차 선택 -->
				  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				  
				  	<!-- 제조사 선택 -->
					<button class="btn w-100 text-left" data-ng-click="company_sh=!company_sh">
				  	제 조 사
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="company_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="company_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle bg-light py-3" data-toggle="buttons" data-ng-show="company_sh">
				  		
				  		<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[6]= !company_chk[6];infoCheck()">
						    <input type="checkbox" /> 벤  츠
						  </label>
						</div>
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[7]= !company_chk[7];infoCheck()">
						    <input type="checkbox" /> B M W
						  </label>
						</div>
						  
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[8]= !company_chk[8];infoCheck()">
						    <input type="checkbox" /> 아 우 디
						  </label>
						</div>
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[9]= !company_chk[9];infoCheck()">
						    <input type="checkbox" /> 폭스바겐
						  </label>
						</div>
						  
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="company_chk[10]= !company_chk[10];infoCheck()">
						    <input type="checkbox" /> 도 요 타
						  </label>
						</div>
					</div>	
					
				  </div>
				  <!-- 차량모델 선택 -->
					<button class="btn w-100 text-left" data-ng-click="m_name_sh=!m_name_sh">
				  	모  델
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="m_name_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="m_name_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle bg-light py-3" data-toggle="buttons" data-ng-show="m_name_sh">
						<div class="btn-group bg-white" data-ng-repeat="tmp in m_name_list">
						  <label class="btn btn-outline-secondary" data-ng-click="m_name_chk[$index] = !m_name_chk[$index];infoCheck()">
						    <input type="checkbox" /> {{tmp}}
						  </label>	  
						</div>
					</div>
					<!-- 가격 입력 -->
					<button class="btn w-100 text-left" data-ng-click="s_price_sh=!s_price_sh">
				  	가  격
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="s_price_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="s_price_sh"/>
					</svg>
				  	</button>
				  	<div class="container bg-light mx-auto py-3 row" data-ng-show="s_price_sh">
				  		
					  	<div class="col-5 px-0">
					  		<input type="text" class="form-control" data-ng-model="min_price"
					  		data-ng-minlength="2"
							data-ng-maxlength="5"
							data-ng-pattern="/^[0-9]+$/"
							/>
					 	</div>
					  	<div class="col-2 text-center text-secondary">
					  		<h3>~</h3>
						</div>
					  	<div class="col-5 px-0">
					  		<input type="text" class="form-control" data-ng-model="max_price"
					  		data-ng-minlength="2"
							data-ng-maxlength="5"
							data-ng-pattern="/^[0-9]+$/"
					  		/>
					  	</div>
					  		
					</div>
					<!-- 연식 입력 -->
					<button class="btn w-100 text-left" data-ng-click="c_year_sh=!c_year_sh">
				  	연  식
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="c_year_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="c_year_sh"/>
					</svg>
				  	</button>
				  	<div class="container bg-light mx-auto py-3 row" data-ng-show="c_year_sh">
				  		
					  	<div class="col-5 px-0">
					  		<input type="text" class="form-control" data-ng-model="min_year"
					  		data-ng-minlength="4"
							data-ng-maxlength="4"
							data-ng-pattern="/^[0-9]+$/"
							/>
					 	</div>
					  	<div class="col-2 text-center text-secondary">
					  		<h3>~</h3>
						</div>
					  	<div class="col-5 px-0">
					  		<input type="text" class="form-control" data-ng-model="max_year"
					  		data-ng-minlength="4"
							data-ng-maxlength="4"
							data-ng-pattern="/^[0-9]+$/"
					  		/>
					  	</div>
					  		
					</div>
					<!-- 연식 입력 -->
					<button class="btn w-100 text-left" data-ng-click="vehical_mile_sh=!vehical_mile_sh">
				  	주행거리
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="vehical_mile_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="vehical_mile_sh"/>
					</svg>
				  	</button>
				  	<div class="container row bg-light mx-auto py-3" data-ng-show="vehical_mile_sh">
				  		<div class="col-5 px-0">
				  			<input type="text" class="form-control" data-ng-model="min_vehical_mile"
				  			data-ng-minlength="1"
							data-ng-maxlength="6"
							data-ng-pattern="/^[0-9]+$/"
				  			/>
				  		</div>
				  		<div class="col-2 text-center text-secondary">
				  			<h3>~</h3>
				  		</div>
				  		<div class="col-5 px-0">
				  			<input type="text" class="form-control" data-ng-model="max_vehical_mile"
				  			data-ng-minlength="1"
							data-ng-maxlength="6"
							data-ng-pattern="/^[0-9]+$/"
				  			/>
				  		</div>
					</div>
					<!-- 연료 선택 -->
					<button class="btn w-100 text-left" data-ng-click="automotive_fuel_sh=!automotive_fuel_sh">
				  	연  료
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="automotive_fuel_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="automotive_fuel_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle mb-3 bg-light py-3" data-toggle="buttons" data-ng-show="automotive_fuel_sh">
					 
					   <div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="automotive_fuel_chk[0]= !automotive_fuel_chk[0];infoCheck()">
						    <input type="checkbox" /> 가 솔 린
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="automotive_fuel_chk[1]= !automotive_fuel_chk[1];infoCheck()">
						    <input type="checkbox" /> 디  젤
						  </label>
						</div>  
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="automotive_fuel_chk[2]= !automotive_fuel_chk[2];infoCheck()">
						    <input type="checkbox" /> L P G
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="automotive_fuel_chk[3]= !automotive_fuel_chk[3];infoCheck()">
						    <input type="checkbox" /> 전  기
						  </label>
						</div>  
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="automotive_fuel_chk[4]= !automotive_fuel_chk[4];infoCheck()">
						    <input type="checkbox" /> L N G
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="automotive_fuel_chk[5]= !automotive_fuel_chk[5];infoCheck()">
						    <input type="checkbox" /> 하이브리드
						  </label>
						</div>  
						 
					</div>
					<!-- 기어 선택 -->
					<button class="btn w-100 text-left" data-ng-click="vehical_gear_sh=!vehical_gear_sh">
				  	기  어
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="vehical_gear_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="vehical_gear_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle mb-3 bg-light py-3" data-toggle="buttons" data-ng-show="vehical_gear_sh">
						  
						  <div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="vehical_gear_chk[0]= !vehical_gear_chk[0];infoCheck()">
						    <input type="checkbox" /> 수  동
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="vehical_gear_chk[1]= !vehical_gear_chk[1];infoCheck()">
						    <input type="checkbox" /> 자  동
						  </label>
						</div>  
						 
					</div>
					
					<!-- 옵션 선택 -->
					<button class="btn w-100 text-left" data-ng-click="car_option_sh=!car_option_sh">
				  	옵  션
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="car_option_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="car_option_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle mb-3 bg-light py-3" data-toggle="buttons" data-ng-show="car_option_sh">
						  
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="option_chk[0]= !option_chk[0];infoCheck()">
						    <input type="checkbox" /> 모  던
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="option_chk[1]= !option_chk[1];infoCheck()">
						    <input type="checkbox" /> 스 마 트
						  </label>
						</div>  
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="option_chk[2]= !option_chk[2];infoCheck()">
						    <input type="checkbox" /> 인스퍼레이션
						  </label>
						  <label class="btn btn-outline-secondary disabled">
						  </label>
						</div>  
						 
					</div>
					
					<!-- 인승 선택 -->
					<button class="btn w-100 text-left" data-ng-click="seater_sh=!seater_sh">
				  	인  승
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="seater_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="seater_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle mb-3 bg-light py-3" data-toggle="buttons" data-ng-show="seater_sh">
						  
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="seater_chk[0]= !seater_chk[0];infoCheck()">
						    <input type="checkbox" /> 4 인 승
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="seater_chk[1]= !seater_chk[1];infoCheck()">
						    <input type="checkbox" /> 5 인 승
						  </label>
						</div>  
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="seater_chk[2]= !seater_chk[2];infoCheck()">
						    <input type="checkbox" /> 7 인 승
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="seater_chk[3]= !seater_chk[3];infoCheck()">
						    <input type="checkbox" /> 9 인 승
						  </label>
						</div>  
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="seater_chk[4]= !seater_chk[4];infoCheck()">
						    <input type="checkbox" /> 11 인 승
						  </label>
						  <label class="btn btn-outline-secondary disabled">
						  </label>
						</div>  
						 
					</div>
					
					<!-- 색상 선택 -->
					<button class="btn w-100 text-left" data-ng-click="color_sh=!color_sh">
				  	색  상
				  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"  data-ng-hide="color_sh"/>
						<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" data-ng-show="color_sh"/>
					</svg>
				  	</button>
				  	<div class="btn-group-vertical container btn-group-toggle mb-3 bg-light py-3" data-toggle="buttons" data-ng-show="color_sh">
						  
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="color_chk[0]= !color_chk[0];infoCheck()">
						    <input type="checkbox" /> 청  색
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="color_chk[1]= !color_chk[1];infoCheck()">
						    <input type="checkbox" /> 적  색
						  </label>
						</div>  
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="color_chk[2]= !color_chk[2];infoCheck()">
						    <input type="checkbox" /> 흰  색
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="color_chk[3]= !color_chk[3];infoCheck()">
						    <input type="checkbox" /> 회  색
						  </label>
						</div>  
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="color_chk[4]= !color_chk[4];infoCheck()">
						    <input type="checkbox" /> 검 은 색
						  </label>
						  <label class="btn btn-outline-secondary" data-ng-click="color_chk[5]= !color_chk[5];infoCheck()">
						    <input type="checkbox" /> 녹  색
						  </label>
						</div>  
						
						<div class="btn-group bg-white">
						  <label class="btn btn-outline-secondary" data-ng-click="color_chk[6]= !color_chk[6];infoCheck()">
						    <input type="checkbox" /> 기  타
						  </label>
						  <label class="btn btn-outline-secondary disabled">
						  </label>
						</div>  
						 
					</div>
				</div>
			</div>
			<div class="col-8">
				<div class="media border-top py-3 row" data-ng-class="{'border-bottom':$last}" data-ng-repeat="tmp in list">
				  <input type="hidden" id="car_num" value="{{tmp.car_num}}" />
				  <img src="${pageContext.request.contextPath}/upload/{{tmp.image}}" class="mr-3 list_img">
				  <div class="media-body col-8">
				  	<span class="badge badge-secondary" data-ng-bind="c_sort_list[tmp.c_sort-1]"></span>
				  	<span class="badge badge-secondary" data-ng-bind="company_list[tmp.company-1]"></span>
				  	<span class="badge badge-secondary" data-ng-bind="tmp.car_option"></span>
				    <h5 class="mt-0" data-ng-bind="tmp.title"></h5>
				    <small class="text-muted">{{tmp.m_name}}({{tmp.seater}}인승) | {{tmp.automotive_fuel}} | {{tmp.car_year}}년식 | {{tmp.vehical_mile}}km</small>
				  </div>
				  <div class="col-4 text-danger text-right">
				  	<h3 class="my-3">{{tmp.s_price}}만원</h3>
				  </div>
				</div>
				
				<a href="insertform.do">판매 등록</a>
			</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
	<script>
		var myApp=angular.module("myApp",[]);
		
		myApp.controller("btnController",function($scope, $http) {
			
			$scope.car_group=1;
			$scope.c_sort=[];
			$scope.company=[];
			$scope.m_name=[];
			$scope.automotive_fuel=[];
			$scope.vehical_gear=[];
			$scope.option=[];
			$scope.seater=[];
			$scope.color=[];
			
			
			$scope.c_sort_list=["소형차","중형차","대형차","스포츠카","SUV","화물차"];
			$scope.company_list=["현대","기아","제네시스","쉐보레","르노삼성","쌍용","벤츠","BMW","아우디","폭스바겐","도요타"];
			$scope.automotive_fuel_list=["가솔린","디젤","LPG","전기","LNG","하이브리드"];
			$scope.option_list=["모던","스마트","인스퍼레이션"];
			$scope.vehical_gear_list=[0,1];
			$scope.seater_list=[4,5,7,9,11];
			$scope.color_list=["blue","red","white","gray","black","green","etc"];
			
			$scope.c_sort_sh=true;
			$scope.company_sh=true;
			
			$scope.reset_chk=function() {
				$scope.c_sort_chk=[false,false,false,false,false,false];
				$scope.company_chk=[false,false,false,false,false,false,false,false,false,false,false];
				$scope.m_name_list=[];
				$scope.m_name_chk=[];
				$scope.automotive_fuel_chk=[false,false,false,false,false,false];
				$scope.vehical_gear_chk=[false,false];
				$scope.option_chk=[false,false,false];
				$scope.seater_chk=[false,false,false,false,false];
				$scope.color_chk=[false,false,false,false,false,false,false];
				
				reset_selected();
			}
			
			$scope.infoCheck=function() {
				$scope.c_sort=checkIndex($scope.c_sort_chk);
				$scope.company=checkIndex($scope.company_chk);
				if($scope.company.length == 0) {
					$scope.m_name=[];
				}else {
					$scope.m_name=checkIndex2($scope.m_name_chk,$scope.m_name_list);	
				}
				$scope.automotive_fuel=checkIndex2($scope.automotive_fuel_chk,$scope.automotive_fuel_list);
				$scope.vehical_gear=checkIndex2($scope.vehical_gear_chk,$scope.vehical_gear_list);
				$scope.option=checkIndex2($scope.option_chk,$scope.option_list);
				$scope.seater=checkIndex2($scope.seater_chk,$scope.seater_list);
				$scope.color=checkIndex2($scope.color_chk,$scope.color_list);
				
				$scope.checkModel();
				
				
				$http({
					url:"carList_ajax.do",
					method:"post",
					params:makeParams($scope.car_group,$scope.c_sort,$scope.company,$scope.m_name,$scope.automotive_fuel,$scope.vehical_gear,
									  $scope.option,$scope.seater,$scope.color,$scope.min_year,$scope.max_year,$scope.min_vehical_mile,
									  $scope.max_vehical_mile,$scope.min_price,$scope.max_price),
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					for(tmp in data) {
						data[tmp].image=decodeURI(data[tmp].image);
					}
					console.log(data);
					$scope.list=data;
				});		
			};
			
			$scope.checkModel=function() {
				
				if($scope.company.length != 0) { 
					$http({
						url:"m_name_ajax.do",
						method:"post",
						params:makeParams($scope.car_group,$scope.c_sort,$scope.company,[],[],[],[],[],[],null,null,null,null,null,null),
						headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
					}).success(function(data){
						$scope.m_name_list=data;
						for(tmp in data) {
							$scope.m_name_chk.push(false);
						}
						$scope.m_name_sh=true;
					});		
				} else {
					$scope.m_name_list=[];
					$scope.m_name_chk=[];
					$scope.m_name_sh=false;
				}
			};
			
			$scope.$watch('min_year',function(newVal,oldVal) {
				if(isEmpty(newVal) && isEmpty(oldVal)) {
					$scope.infoCheck();	
				}
			},true);
			
			$scope.$watch('max_year',function(newVal,oldVal) {
				if(isEmpty(newVal) && isEmpty(oldVal)) {
					$scope.infoCheck();	
				}
			},true);
			
			$scope.$watch('min_vehical_mile',function(newVal,oldVal) {
				if(isEmpty(newVal) && isEmpty(oldVal)) {
					$scope.infoCheck();	
				}
			},true);
			
			$scope.$watch('max_vehical_mile',function(newVal,oldVal) {
				if(isEmpty(newVal) && isEmpty(oldVal)) {
					$scope.infoCheck();	
				}
			},true);
			
			$scope.$watch('min_price',function(newVal,oldVal) {
				if(isEmpty(newVal) && isEmpty(oldVal)) {
					$scope.infoCheck();	
				}
			},true);
			
			$scope.$watch('max_price',function(newVal,oldVal) {
				if(isEmpty(newVal) && isEmpty(oldVal)) {
					$scope.infoCheck();	
				}
			},true);
			
			$scope.load=function() {
				$scope.reset_chk();
				$scope.infoCheck();
			};
		});
		
		var checkIndex=function(arr) {
			var result=[];
			for(var i=0;i<arr.length;i++) {
				if(arr[i] == true) {
					result.push(i+1);
				}
			}

			return result;
		};
		
		var checkIndex2=function(arr,model) {
			var result=[];

			for(var i=0;i<arr.length;i++) {
				if(arr[i] == true) {
					result.push(model[i]);
				}
			}
			
			return result;
		}
		
		var makeParams=function(car_group,c_sort,company,m_name,automotive_fuel,vehical_gear,option,seater,color,
								min_year,max_year,min_vehical_mile,max_vehical_mile,min_price,max_price) {
			result = {};
			result.car_group=car_group;
			if(c_sort.length != 0) {
				result.c_sort_chk=c_sort;
			}
			if(company.length != 0) {
				result.company_chk=company;
			}
			if(m_name.length != 0) {
				result.m_name_chk=m_name;
			}
			if(automotive_fuel.length != 0) {
				result.automotive_fuel_chk=automotive_fuel;
			}
			if(vehical_gear.length != 0) {
				result.vehical_gear_chk=vehical_gear;
			}
			if(option.length != 0) {
				result.car_option_chk=option;
			}
			if(seater.length != 0) {
				result.seater_chk=seater;
			}
			if(color.length != 0) {
				result.color_chk=color;
			}
			if(isEmpty(min_year)) {
				result.min_year=min_year;
			}
			if(isEmpty(max_year)) {
				result.max_year=max_year;
			}
			if(isEmpty(min_vehical_mile)) {
				result.min_vehical_mile=min_vehical_mile;
			}
			if(isEmpty(max_vehical_mile)) {
				result.max_vehical_mile=max_vehical_mile;
			}
			if(isEmpty(min_price)) {
				result.min_price=min_price;
			}
			if(isEmpty(max_price)) {
				result.max_price=max_price;
			}
			
			return result;
		};
		
		var isEmpty = function(value){ //비어있는 값 검사
			if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
					return false; 
				}else{ 
					return true;
				} 
		};
		
		var reset_selected=function() {
			$("label").removeClass("active");
		}
		
		$(document).on("click",".media",function() {
			var num=$(this).children("#car_num").val();
			location.href="detail.do?num="+num;
		})
		
	</script>
</body>
</html>