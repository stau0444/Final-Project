<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html data-ng-app="myPageApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#menubar>a{
		width:200px;
		height:40px;
		
	}
	ul{
		padding-left:0px;
	}
	li{
		box-shadow: 0px;
		border-radius: 10px;
	}
	li:hover {
		box-shadow: 4px 4px 5px 0px rgba(97, 198, 147, 0.78);
	    transition: box-shadow 0.4s;
	}
	li:hover:after {
	    animation: spinAround 9s linear infinite;
	}
	
	@keyframes spinAround {
	    from {
	        transform: rotate(0deg)
	    }
	    to {
	        transform: rotate(360deg);
	    }
	}
</style>
<script src="../../resources/js/angular.min.js"></script>
<script src="../../resources/js/angular-route.min.js"></script>

<script>
	var myPageApp=angular.module("myPageApp",["ngRoute"]);
	myPageApp.config(function($routeProvider){
		$routeProvider.when("/user_info", {
			page : "user_info",
			title : "MYCAR 회원정보",
			templateUrl : "user_info.do",
			controller : "myPageCtrl"
	});
	myPageApp.controller("myPageCtrl",function($scope,$http){
		
		$scope.c_sort_list=["소형차","중형차","대형차","스포츠카","SUV","화물차"];
		$scope.company_list=["현대","기아","제네시스","쉐보레","르노삼성","쌍용","벤츠","BMW","아우디","폭스바겐","도요타"];
		
		$scope.option_list=["모던","스마트","인스퍼레이션"];
		$scope.vehical_gear_list=[0,1];
		$scope.seater_list=[4,5,7,9,11];
		$scope.color_list=["blue","red","white","gray","black","green","etc"];
		
		$http({
			url:'getFavoritList.do',
			method:'post',
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(data){
			$scope.favoritList=data.favoritList;
			console.log($scope.favoritList);
		})
		$http({
			url:'getSalesList.do',
			method:'post',
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(data){
			$scope.salesList=data.salesList;
			console.log($scope.salesList);
		})
		$http({
			url:'getUserInfo.do',
			method:'post',
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(data){
			var userinfo=data.userinfo;
			console.log(userinfo)
			console.log(data);
			$scope.user_name=userinfo.user_name;
			$scope.user_id=userinfo.user_id;
			$scope.user_phone=userinfo.user_phone;
			$scope.user_addr=userinfo.user_addr;
			if(userinfo.user_sort=="1"){
				$scope.user_sort="판매자";				
			}else{
				$scope.user_sort="일반회원";
			}
		})
		
	})
</script>
</head>
<body data-ng-controller="myPageCtrl">
<div class="container">
	<hr class="my-5"/>
	<!-- 관심차량리스트 -->
	<div id="menubar" class="row d-flex justify-content-center">
			<a href="#user_info" class="btn btn-outline-success mx-2 my-1">회원정보</a>
			<a href="" class="btn btn-outline-success mx-2 my-1">관심차량리스트</a>
			<a href="" class="btn btn-outline-success mx-2 my-1">최근본차량 리스트</a>
			<a href="" class="btn btn-outline-success mx-2 my-1">회원정보수정</a>
			<a href="" class="btn btn-outline-success mx-2 my-1">회원탈퇴</a>
	</div>
	<hr class="my-5"/>
	
	<div class="row my-5">
		<h3 class="text-info">관심차량</h3>
		<div class="w-100" >
			<!-- 슬라이드 -->
			<ul >
				<li data-ng-repeat="tmp in favoritList" class="row  my-3 border" style="margin-top:15px;" >
					<img src="/mycar/upload/{{tmp.image}}" class="col-2 " width="180" height="180" />
					<span class="col-7  mt-3">
						<span class="badge badge-secondary">{{tmp.automotive_fuel}}</span>   
						<span class="badge badge-secondary">{{company_list[tmp.company]}}</span>
						<span class="badge badge-secondary">{{tmp.car_option}}</span>
						<span class="badge badge-secondary">{{c_sort_list[tmp.c_sort]}} </span>
						<h2  class="my-4">{{tmp.title}}</h2>
						<span>
							차량번호:{{tmp.car_num}} |
							주행거리:{{tmp.vehical_mile}}Km |
							색상:{{color_list[tmp.color]}} |
							연식:{{tmp.car_year}} |
							모델명:{{tmp.m_name}}
						</span>
					</span>
					<span class="col-3">
						<h2 class="text-danger mt-5">{{tmp.s_price}}원 </h2>
					</span>
				</li>
			</ul>
		</div>	
	</div>
	<hr class="my-3"/>
	<!-- 최근본차량 리스트 -->
	<div class="row my-4">
		<h3 class="text-info">판매 중인 차량</h3>
		<div class="w-100" style="height:auto;">
			<ul >
				<li data-ng-repeat="tmp in salesList" class="row  my-3 border" style="margin-top:15px;" >
					<img src="/mycar/upload/{{tmp.image}}" class="col-2 " width="180" height="180" />
					<span class="col-7  mt-3">
						<span class="badge badge-secondary">{{tmp.automotive_fuel}}</span>   
						<span class="badge badge-secondary">{{company_list[tmp.company]}}</span>
						<span class="badge badge-secondary">{{tmp.car_option}}</span>
						<span class="badge badge-secondary">{{c_sort_list[tmp.c_sort]}} </span>
						<h2  class="my-4">{{tmp.title}}</h2>
						<span>
							차량번호:{{tmp.car_num}} |
							주행거리:{{tmp.vehical_mile}}Km |
							색상:{{color_list[tmp.color]}} |
							연식:{{tmp.car_year}} |
							모델명:{{tmp.m_name}}
						</span>
					</span>
					<span class="col-3">
						<h2 class="text-danger mt-5">{{tmp.s_price}}원 </h2>
					</span>
				</li>
			</ul>
		</div>
		<hr class="my-2"/>
	</div>
	<hr class="my-2"/>
	<h4 class="text-info"> 회원정보수정</h4>
	<div data-ng-view class="page-change-animation"></div>
	<div class="row my-4" >
		<!-- 회원정보 링크-->
		<div class="col-6">
			<div class="jumbotron text-center">
			  <h4>회원정보수정</h4>
			  <p class="lead">회원 정보 수정을 원하십니까?</p>
			  <hr class="my-4">
			  <p class="lead">
			    <a class="btn btn-primary btn-lg" href="#" role="button">수정</a>
			  </p>
			</div>
		</div>
		<div class="col-6">
			<div class="jumbotron text-center ">
			  <h4>회원탈퇴</h4>
			  <p class="lead">회원 탈퇴를  원하십니까?</p>
			  <hr class="my-4">
			  <p class="lead">
			    <a class="btn btn-primary btn-lg" href="#" role="button">탈퇴</a>
			  </p>
			</div>
		</div>
	</div>
	<hr />
</div>
</body>
</html>