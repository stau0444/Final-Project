<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="loginApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/angular.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script>
	var loginApp=angular.module("loginApp",[])
	loginApp.controller("loginCtrl",function($scope,$http){
		$scope.isLogined=false;
		$scope.login=function(){
			$http({
				url:'private/login.do',
				method:'post',
				params:{
					user_id:$scope.userId,
					user_pwd:$scope.userPwd
					},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},
			}).success(function(data){
					console.log(data)
					if(data.isValid){
						alert("로그인 되었습니다");
						location.replace("/mycar/index.do");						
					}else{
						alert("아이디 혹은 비밀번호가 다릅니다 다시 시도해주세요")
					}
				})
		}
	})
</script>
</head>
<body data-ng-controller="loginCtrl">
	<h2>로그인 폼</h2>
	<form >
		<div>
			<label for="id">아이디</label>
			<input type="text" name="user_id" data-ng-model="userId"/>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" name="user_pwd" data-ng-model="userPwd"/>
		</div>
		<button data-ng-click="login()">로그인</button>
		<div id="naver_id_login" style="margin-top:40px;"><a href="${url}"><img width="223" src="../resources/img/Nlogin.PNG"/></a></div>
	</form>
</body>
</html>