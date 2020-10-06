<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>판매 상세 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>
<body data-ng-controller="viewController">
	<div id="carouselExampleControls" class="carousel slide w-25" data-ride="carousel">
	  <div class="carousel-inner">
	  
	    <div class="carousel-item" data-ng-repeat="image in images" data-ng-class="{'active':$first}">
	      <img src="${pageContext.request.contextPath}/upload/{{image}}" class="d-block" alt="...">
	    </div>

	      
	    </div>
	  </div>
	  <a class="carousel-control-prev bg-secondary" href="#carouselExampleControls" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next bg-secondary" href="#carouselExampleControls" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	
	
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script>
	var myApp=angular.module("myApp",[]);
	
	myApp.controller("viewController",function($scope,$http) {
		
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
</script>
</body>
</html>