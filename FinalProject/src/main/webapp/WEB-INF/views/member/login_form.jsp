<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="loginApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	.container{
		width:475px;
	}
</style>
<script src="../resources/js/angular.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="../resources/js/member/login_form.js"></script>
</head>
<body >
	<div class="container">
			<h2 class="text-center my-3" >LOG-IN</h2>
			<div>
				<form data-ng-controller="loginCtrl">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" name="user_id" data-ng-model="userId" class="form-control"/>
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호</label>
						<input type="password" name="user_pwd" data-ng-model="userPwd" class="form-control"/>
					</div>
					<div class="text-center">
						<button data-ng-click="login()" class="btn btn-primary ">로그인</button>
					</div>
				</form>
			</div>
			<div class="text-center ">
				<div id="naver_id_login" class="my-3">
					<a href="${url}">
						<img width="223px" src="../resources/img/Nlogin.PNG"/>
					</a>
				</div>
				<div data-ng-controller="findIdPwdCtrl">
					<div>
						<a data-ng-click="findIdPopUp()" href="#">아이디 찾기</a> /
						<a data-ng-click="findPwdPopUp()" href="#">비밀번호 찾기</a>
					<div>
				</div>
					<a href="identification_form.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>