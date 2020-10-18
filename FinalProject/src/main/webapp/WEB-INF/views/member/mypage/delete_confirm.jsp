<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="deleteIdApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="../../resources/js/angular.min.js"></script>
<script>
	var deleteIdApp= angular.module("deleteIdApp",[]);
	deleteIdApp.controller("deleteIdCtrl",function($http,$scope,$window){
		$scope.deleteId=function(){
			$http({
				url:'/mycar/member/private/deleteIdLast.do',
				method:'get',
				header:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
					console.log(data);
					alert("아이디가 삭제 되었습니다.");
					opener.location="/mycar/";
					$window.close();
			});
		};
		
		$scope.cancel=function(){
			var isDeleteId=confirm("회원 탈퇴를 취소하시겠습니까?")
			if(isDeleteId){
				$window.close();
			}
		}
		
	});
</script>
</head>
<body data-ng-controller="deleteIdCtrl">
<div class="container text-center" >
		{{user_phone}}
		<h2 class="text-center">정말 탈퇴 하시겠습니까?</h2>
		<button data-ng-click="deleteId()" class="btn btn-primary">예</button>
		<button data-ng-click="cancel()"class="btn btn-danger">아니오</button>
</div>
</body>
</html>