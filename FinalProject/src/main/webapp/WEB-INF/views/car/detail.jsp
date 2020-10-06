<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>판매 상세 페이지</title>
</head>
<body data-ng-controller="viewController">
	
	
	
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<script>
	var myApp=angular.module("myApp",[]);
	
	myApp.controller("viewController",function() {
		$scope.data=${data};
		$scope.images=${images};
		
		$scope.func=function() {
			console.log("데이터들: "+$scope.data);
			console.log("이미지들: "+$scope.images);
		};
		
		$scope.func();
	});
</script>
</body>
</html>