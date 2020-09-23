<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="managerApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular-route.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/angular-animate.min.js"></script>
<style>
	/* .page-change-animation 클래스를 가지고 있는 요소가 만들어 질때 적용할 애니매이션 */
	.page-change-animation.ng-enter{
		animation: fadeIn 0.4s ease-out;
	}
</style>

<script>

	var managerApp = angular.module("managerApp", ["ngRoute", "ngAnimate"]);

	managerApp.controller("managerCtrl", function($scope, $http, $rootScope){
		
	});
	
	managerApp.config(function($routeProvider){
		$routeProvider
		.when("/news_list", {
			page : "news_list", 
			title : "뉴스 리스트 페이지", 
			templateUrl : "news/news_list.do", 
			controller : "managerCtrl"})
		.when("/QnA_individual", {
			page : "QnA_individual",
			title : "1:1 상담 관리 페이지",
			templateUrl : "qna/individual.do"
		})
		.when("/QnA", {
			page : "QnA",
			title : "자주 묻는 질문",
			templateUrl : "qna/frequently_ask.do"
		})
		.otherwise({redirectTo:"/news_list"});
			
	});
	
	
</script>
</head>
<body>
	<div class="container">
		<h1>관리자 페이지 입니다.</h1>
			<ul>
				<li><a href="#news_list">뉴스리스트</a></li>
				<li><a href="#QnA_individual">1:1상담 리스트</a></li>
				<li><a href="#QnA">자주 묻는 질문</a></li>
			</ul>
	</div>
	<div data-ng-view class="page-change-animation"></div>
	
</body>
</html>