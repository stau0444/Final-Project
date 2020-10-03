<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="invalitateApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/css/member/signup_success.css" />
<script src="../../resources/js/angular.min.js"></script>
<script src="../../resources/js/member/signup_success.js"></script>
</head>
<body data-ng-controller="invalitateCtrl">
	<div class="container">
		<div class="progress my-5">
			 <div class="progress-bar" role="progressbar" id="p1" style="width: 33% " aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">본인인증</div>
			 <div class="progress-bar bg-warning" role="progressbar" id="p2" style="width: 33% " aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">회원가입</div>
			 <div class="progress-bar bg-success" role="progressbar" id="p3"  aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">가입완료!</div>
		</div>
		<div class="text-center">
			<img src="../../resources/img/loginSuccessImg.png" alt="" class="w-75"/>
			<h2>회원가입을 환영합니다!</h2>
			<a href="/mycar">HOME</a>
			<br />
			<a href="/mycar/member/login_form.do">LOG-IN</a>
		</div>
	</div>	
</body>

</html>