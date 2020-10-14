<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>판매 상세 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<style>
	.carousel_inner {
		height: 500px;
	}
	tr {
		height: 50px;
	}
	*{
		font-size: 1rem;
	}
	.nav >.active {
		border-bottom: 3px solid red; 
	}
</style>
</head>
<body data-ng-controller="viewController">
	<!-- 북마크링크 -->
		<button data-ng-click="addbookmark()">북마크</button>{{Clicked}}
	<!-- 북마크링크 끝-->
	<div class="container">
		<div id="imageCarousel" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner position-relative">
		  
		    <div class="carousel-item" data-ng-repeat="image in images" data-ng-class="{active:$first}">
		      <img src="${pageContext.request.contextPath}/upload/{{image}}" class="carousel-image d-block mx-auto" alt="...">
		    </div>
	
		      
		    </div>
		  </div>
		  
		  <a class="carousel-control-prev bg-secondary position-absolute" href="#imageCarousel" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next bg-secondary position-absolute" href="#imageCarousel" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		  
		  <div>
		  	<button class="btn btn-outline-primary">수정</button>
		  	<button class="btn btn-outline-danger">삭제</button>
		  </div>
		  	<!-- 내용 작성 부분 -->
		<table class="border rounded my-3 text-center w-100">
			<tr class="text-muted align-bottom">
				<td>차량번호</td>
				<td>회사</td>
				<td>모델</td>
				<td>연식</td>
			</tr>
			<tr class="p-0">
				<td data-ng-bind="data.car_num"></td>
				<td data-ng-switch="" on="data.company">
					<span data-ng-switch-when="1">현대</span>
					<span data-ng-switch-when="2">기아</span>
					<span data-ng-switch-when="3">제네시스</span>
					<span data-ng-switch-when="4">쉐보레</span>
					<span data-ng-switch-when="5">르노삼성</span>
					<span data-ng-switch-when="6">쌍용</span>
					<span data-ng-switch-when="7">벤츠</span>
					<span data-ng-switch-when="8">BMW</span>
					<span data-ng-switch-when="9">아우디</span>
					<span data-ng-switch-when="10">폭스바겐</span>
					<span data-ng-switch-when="11">도요타</span>
				</td>
				<td data-ng-bind="data.m_name"></td>
				<td data-ng-bind="data.car_year"></td>
			</tr>
			<tr class="text-muted align-bottom">
				<td>주행거리</td>
				<td>기어</td>
				<td>연료</td>
				<td>차종</td>
			</tr>
			<tr>
				<td>{{data.vehical_mile | number}}km</td>
				<td data-ng-switch="" on="data.vehical_gear">
					<span data-ng-switch-when="1">자동</span>
					<span data-ng-switch-when="0">수동</span>
				</td>
				<td data-ng-bind="data.automotive_fuel"></td>
				<td data-ng-switch="" on="data.c_sort">
					<span data-ng-switch-when="1">소형차</span>
					<span data-ng-switch-when="2">중형차</span>
					<span data-ng-switch-when="3">대형차</span>
					<span data-ng-switch-when="4">스포츠카</span>
					<span data-ng-switch-when="5">SUV</span>
					<span data-ng-switch-when="6">화물차</span>
				</td>
			</tr>
			<tr class="text-muted align-bottom">
				<td>인승</td>
				<td>색상</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>{{data.seater}}인승</td>
				<td data-ng-bind="data.color"></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		
		<nav class="nav text-center">
		  <a class="nav-link w-25 active" href="#option">차량 옵션</a>
		  <a class="nav-link w-25" href="#profile">Link</a>
		  <a class="nav-link w-25" href="#message">Link</a>
		  <a class="nav-link w-25" href="#settings">D</a>
		</nav>
		
		<div>
			<div id="option">
				<h3 class="mt-3">차량 옵션</h3>
				<hr />
				<fieldset class="w-100">
					<legend>외관</legend>
					<div class="row">
						<div class="col">1</div>
						<div class="col">2</div>
						<div class="col">3</div>
						<div class="col">4</div>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
		
		
	
	
	
	
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script>
	var myApp=angular.module("myApp",[]);
	function searchParam(key) {
		  return new URLSearchParams(location.search).get(key);
	};
	myApp.controller("viewController",function($scope,$http) {
		//북마크 추가 링크 data={"isAdded":boolean,"bookmarkinfo":BookMarkDto} 
		$scope.Clicked=0;
		$scope.num=searchParam('num');
		$http({
			url:'/mycar/member/private/check_bookmark.do',
			method:'post',
			params:{car_num:$scope.num},
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(data){
			console.log(data);
			if(data.isChecked){
				$scope.Clicked=1;			
			}
		});
		$scope.addbookmark=function(){
			if($scope.Clicked==0){
				$http({
					url:'/mycar/member/private/add_bookmark.do',
					method:'post',
					params:{car_num:$scope.car_num},
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					console.log(data);
					alert("관심차량으로 등록되었습니다");
					$scope.Clicked=1;
				})
			}else{
				$http({
					url:'/mycar/member/private/delete_bookmark.do',
					method:'post',
					params:{car_num:$scope.car_num},
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					console.log(data);
					alert("관심차량에서 삭제되었습니다.");
					$scope.Clicked=0;
				});
			};
		};
		
		
		$scope.load=function() {
			$scope.car_num="${car_num}";
				
			$http({
				url:"detail_ajax.do",
				method:"post",
				params:{num:$scope.car_num},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data) {
				console.log(data.data);
				console.log(data.images);
				
				$scope.data=data.data;
				$scope.images=data.images;
			});
		};
		
		$scope.load();
	});
	
	
	
	var btnSizeAble=function() {
		$(".carousel-control-next").css("height",$(".active").first().height());
		$(".carousel-control-prev").css("height",$(".active").first().height());
	}
	
	$(document).ready(function() {
		var right=($(window).width()-$(".carousel-inner").width())/2;
		console.log($(".carousel-image").first().height());
		
		$(".carousel-control-prev").css("left","auto");
		$(".carousel-control-next").css("right",right);
	});
	
	$(window).resize(function() {
		var right=($(window).width()-$(".carousel-inner").width())/2;
		$(".carousel-control-prev").css("left","auto");
		$(".carousel-control-next").css("right",right);
	});
	
	$('#imageCarousel').on('slide.bs.carousel', function () {
		$(".carousel-control-next").css("height",$(".active").height());
		$(".carousel-control-prev").css("height",$(".active").height());
	});
	
	$('#imageCarousel').on('slid.bs.carousel', function () {
		$(".carousel-control-next").css("height",$(".active").height());
		$(".carousel-control-prev").css("height",$(".active").height());
	});
	
	btnSizeAble();
	
	$(".nav-link").on("click",function() {
		$(".nav-link").removeClass("active");
		$(this).addClass("active");
	});
	
	$("#updateBtn").on("click",function() {
		
	});
</script>
</body>
</html>