<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="managerApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<script
	src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/angular-route.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/angular-animate.min.js"></script>
<style>
/* .page-change-animation 클래스를 가지고 있는 요소가 만들어 질때 적용할 애니매이션 */
.page-change-animation.ng-enter {
	animation: fadeIn 0.4s ease-out;
}
</style>

<script>
	var managerApp = angular.module("managerApp", [ "ngRoute", "ngAnimate" ]);

	managerApp.controller("dataCtrl", function($scope, $http, $routeParams,
			$location) {
		var iq_num = $routeParams.iq_num;
		$http({
			url : "/mycar/manager/private/qna/getdata_iq.do",
			method : "GET",
			params : {
				iq_num : iq_num
			}
		}).success(function(data) {
			console.log(data);
			$scope.data = data.dto;
		});
	});

	managerApp.controller("qnaCtrl", function($scope, $http, $location) {

		$scope.deleteFrequently = function(qna_num){
			$http({
				url : "/mycar/manager/private/qna/delete_f.do",
				method : "get",
				params : {qna_num : qna_num},
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;"
				}
			}).success(function(data){
				console.log(data.isSuccess);
				if(data.isSuccess){
					console.log("삭제성공");
				}else{
					console.log("삭제실패");
				}
				location.reload();
			});
		}

		$http({
			url : "/mycar/manager/private/getlist_f.do",
			method : "get",
			headers : {
				"Content-Type" : "application/x-www-form-urlencoded;"
			}
		}).success(function(data) {
			console.log(data);
			$scope.list = data.list;
			$scope.pagelist = data.pageList;
			$location.url("/QnA");
		});

		$scope.getList = function(pageNum) {
			$http({
				url : "/mycar/manager/private/getlist_f.do",
				method : "get",
				params : {
					pageNum : pageNum
				},
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;"
				}
			}).success(function(data) {
				console.log(data);
				$scope.list = data.list;
				$scope.pagelist = data.pageList;
				$location.url("/QnA");
			});
		}
	});

	managerApp.controller("iqCtrl", function($scope, $http, $location) {
		$http({
			url : "/mycar/manager/private/getlist_iq.do",
			method : "get",
			headers : {
				"Content-Type" : "application/x-www-form-urlencoded;"
			}
		}).success(function(data) {
			console.log(data);
			$scope.list = data.list;
			$scope.pagelist = data.pageList;
			$location.url("/QnA_individual");
		});

		$scope.getList = function(pageNum) {
			$http({
				url : "/mycar/manager/private/getlist_iq.do",
				method : "get",
				params : {
					pageNum : pageNum
				},
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;"
				}
			}).success(function(data) {
				console.log(data);
				$scope.list = data.list;
				$scope.pagelist = data.pageList;
				$location.url("/QnA_individual");
			});
		}
	});

	managerApp.controller("ipCtrl", function($scope, $http, $location) {
		$scope.addIp = function() {
			$http({
				url : "/mycar/manager/private/join.do",
				method : "post",
				params : {
					ip_num : $scope.inputIp
				},
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;"
				}
			}).success(function(data) {
				if (data.isSuccess) {
					alert("ip 등록에 성공했습니다.");
					console.log(data.isSuccess);
				} else {
					alert("ip 등록에 실패했습니다.")
					console.log(data.isSuccess);
				}
			});
			location.reload();
		}

		$http({
			url : "/mycar/manager/private/getlist_ip.do",
			method : "get",
			headers : {
				"Content-Type" : "application/x-www-form-urlencoded;"
			}
		}).success(function(data) {
			console.log(data);
			$scope.list = data.list;
			$scope.pagelist = data.pageList;
			$location.url("/registration");
		});

		$scope.getList = function(pageNum) {
			$http({
				url : "/mycar/manager/private/getlist_ip.do",
				method : "get",
				params : {
					pageNum : pageNum
				},
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;"
				}
			}).success(function(data) {
				console.log(data);
				$scope.list = data.list;
				$scope.pagelist = data.pageList;
				$location.url("/registration");
			});
		}

		$scope.deleteIp = function(tmp) {
			$http({
				url : "/mycar/manager/private/deleteip.do",
				method : "get",
				params : {
					ip_num : tmp
				},
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded;"
				}
			}).success(function(data) {
				console.log(data.isSuccess);
			});
			location.reload();
		}

	});

	managerApp.config(function($routeProvider) {
		$routeProvider.when("/QnA_individual", {
			page : "QnA_individual",
			title : "1:1 상담 관리 페이지",
			templateUrl : "qna/individual.do"
		}).when("/QnA", {
			page : "QnA",
			title : "자주 묻는 질문",
			templateUrl : "qna/frequently_list.do"
		}).when("/frequently-delete/:num", {
			page : "frequently-delete",
			title : "자주 묻는 질문",
			templateUrl : "qna/frequently_delete.do",
			controller : "qnaCtrl"
		}).when("/frequently-form", {
			page : "frequently-form",
			title : "자주 묻는 질문 추가",
			templateUrl : "qna/frequently_form.do",
			controller : "qnaCtrl"
		}).when("/frequently-update/:num", {
			page : "frequently-update",
			title : "자주 묻는 질문 수정",
			templateUrl : "qna/frequently_update.do",
			controller : "qnaCtrl"
		}).when("/registration", {
			page : "registration",
			title : "ip관리 페이지",
			templateUrl : "registration.do"
		}).when("/answer-form/:iq_num", {
			page : "answer-form",
			title : "답변 페이지",
			templateUrl : "qna/answer_form.do",
			controller : "dataCtrl"
		}).otherwise({
			redirectTo : "/QnA_individual"
		});

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