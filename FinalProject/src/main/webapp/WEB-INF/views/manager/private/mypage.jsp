<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="managerApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
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

	managerApp.controller("managerCtrl", function($scope, $http){
		
	});
	
	managerApp.controller("ipCtrl", function($scope, $http){
		$scope.addIp = function(){
			$http({
				url : "/practice/manager/private/join.do",
				method : "post",
				params : {ip_num : $scope.inputIp},
				headers : {"Content-Type":"application/x-www-form-urlencoded;"}
			}).success(function(data){
				if(data.isSuccess){
					alert("ip 등록에 성공했습니다.");
					console.log(data.isSuccess);
				}else{
					alert("ip 등록에 실패했습니다.")
					console.log(data.isSuccess);
				}
			});
		}
	});
	
	managerApp.config(function($routeProvider){
		$routeProvider
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
		.when("/registration", {
			page : "registration",
			title : "ip관리 페이지",
			templateUrl : "registration.do"
		})
		.when("/answer-form", {
			page : "answer-form",
			title : "답변 페이지",
			templateUrl : "qna/answer_form.do"
		})
		.otherwise({redirectTo:"/QnA_individual"});
			
	});
</script>
</head>
<body>
	<div class="container">
		<h1>관리자 페이지 입니다.</h1>
			<ul>
				<li><a href="news/news_list.do">뉴스리스트</a></li>
				<li><a href="#QnA_individual">1:1상담 리스트</a></li>
				<li><a href="#QnA">자주 묻는 질문</a></li>
				<li><a href="#registration">관리자 ip</a></li>
			</ul>
	</div>
	<div data-ng-view class="page-change-animation"></div>
</body>
</html>