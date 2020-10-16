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
</style>
<script src="../../resources/js/angular.min.js"></script>
<script src="../../resources/js/angular-route.min.js"></script>

<script>
	var myPageApp=angular.module("myPageApp",["ngRoute"]);
	myPageApp.config(function($routeProvider){
		$routeProvider
		.when("/user_info",{
				templateUrl:"user_info.do"
				})
		.when("/favorit_list",{
				templateUrl:"favorit_list.do"
				})
		.when("/sales_list",{
				templateUrl:"sales_list.do"
				})
		.when("/update_userinfo",{
				templateUrl:"update_userinfo.do"
				})
		.otherwise({redirectTo:"/user_info"});
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
	<h1 class="text-center my-5">MYPAGE</h1>
	<hr class="my-5"/>
	<!-- 관심차량리스트 -->
	<div id="menubar" class="row d-flex justify-content-center">
			<a href="#/user_info" class="btn btn-outline-success mx-2 my-1">회원정보</a>
			<a href="#/favorit_list" class="btn btn-outline-success mx-2 my-1">관심차량</a>
			<a href="#/sales_list" class="btn btn-outline-success mx-2 my-1">판매 중인 차량 </a>
			<a href="#/update_userinfo" class="btn btn-outline-success mx-2 my-1">회원정보수정</a>
	</div>
	
	<div data-ng-view></div>
	<!-- 회원 정보 테이블-->	
	<!-- 관심 차량 리스트 -->
	<!-- 판매중인 차량 리스트 -->
	<hr class="my-3"/>
	<hr class="my-2"/>
</div>
</body>
</html>