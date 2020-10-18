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
		.when("/update_form",{
				templateUrl:"update_form.do"
				})	
		.otherwise({redirectTo:"/user_info"});
	});
	
	myPageApp.controller("myPageCtrl",function($scope,$http,$window){
		$scope.deleteIdPopUp = function () {
             var $popup = $window.open("deleteId.do", "popup", "width=450,height=600,left=200,top=100");           
        };
        
		
		$scope.c_sort_list=["소형차","중형차","대형차","스포츠카","SUV","화물차"];
		$scope.company_list=["현대","기아","제네시스","쉐보레","르노삼성","쌍용","벤츠","BMW","아우디","폭스바겐","도요타"];
		$scope.option_list=["모던","스마트","인스퍼레이션"];
		$scope.vehical_gear_list=[0,1];
		$scope.seater_list=[4,5,7,9,11];
		$scope.color_list=["blue","red","white","gray","black","green","etc"];
		
		$http({
			url:'getFavoritList.do',
			method:'get',
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(data){
			console.log("데이터",data);
			$scope.list=data.list;
			$scope.paging=data.pagingData;
			var pageNums=[];
			for(var i=data.pagingData.startPageNum; i<=data.pagingData.endPageNum; i++){
				pageNums.push(i);
			}
			$scope.pageNums=pageNums;
		})
		$scope.getPageF=function(num){
			//ajax 로 카페 글 목록을 요청
			$http({
				url:"getFavoritList.do",
				method:"get",
				params:{pageNum:num}
			}).success(function(data){
				console.log(data);
				//data => {"list":[{},{},{}...], "paging":{}}
				$scope.list=data.list; 
				//페이징 처리에 필요한 값을 모델로 관리 하기 
				$scope.paging=data.pagingData;
				var pageNums=[];
				for(var i=data.pagingData.startPageNum; i<=data.pagingData.endPageNum; i++){
					pageNums.push(i);
				}
				$scope.pageNums=pageNums;
			});
		};
		$http({
			url:'getSalesList.do',
			method:'get',
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(data){
			console.log("데이터",data);
			$scope.listS=data.list;
			$scope.pagingS=data.pagingData;
			var pageNumsS=[];
			for(var i=data.pagingData.startPageNum; i<=data.pagingData.endPageNum; i++){
				pageNumsS.push(i);
			}
			$scope.pageNumsS=pageNumsS;
		})
		$scope.getPageS=function(num){
			//ajax 로 카페 글 목록을 요청
			$http({
				url:"getSalesList.do",
				method:"get",
				params:{pageNum:num}
			}).success(function(data){
				console.log(data);
				//data => {"list":[{},{},{}...], "paging":{}}
				$scope.listS=data.list; 
				//페이징 처리에 필요한 값을 모델로 관리 하기 
				$scope.pagingS=data.pagingData;
				var pageNumsS=[];
				for(var i=data.pagingData.startPageNum; i<=data.pagingData.endPageNum; i++){
					pageNumsS.push(i);
				}
				$scope.pageNumsS=pageNumsS;
			});
		};
		$scope.resetPage=function(){
			$scope.pageNumsS=pageNumsS;
		}
		
		$http({
			url:'getUserInfo.do',
			method:'post',
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(data){
			var userinfo=data.userinfo;
			console.log(userinfo)
			console.log(data);
			$scope.user_info=userinfo;
			$scope.user_name=userinfo.user_name;
			$scope.user_id=userinfo.user_id;
			$scope.user_phone=userinfo.user_phone;
			$scope.user_addr=userinfo.user_addr;
			if(userinfo.user_sort=="1"){
				$scope.user_sort="판매자";
				$scope.isDealer=true;
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
	<hr class="mt-5"/>
	<!-- 관심차량리스트 -->
	<div id="menubar" class="row d-flex justify-content-center my-4">
			<a href="#/user_info" class="btn btn-outline-success mx-2 my-1">회원정보</a>
			<a href="#/favorit_list" data-ng-click="getPageF(1)" class="btn btn-outline-success mx-2 my-1">관심차량</a>
			<a href="#/sales_list" data-ng-click="getPageS(1)" class="btn btn-outline-success mx-2 my-1">판매 중인 차량 </a>
			<a href="#/update_userinfo" class="btn btn-outline-success mx-2 my-1">회원 정보 수정/탈퇴</a>
	</div>
	
	<div data-ng-view></div>
	<!-- 회원 정보 테이블-->	
	<!-- 관심 차량 리스트 -->
	<!-- 판매중인 차량 리스트 -->
</div>
</body>
</html>