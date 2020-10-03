<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="changePwdApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="../resources/js/angular.min.js"></script>
<script src="../resources/js/member/changepwd_form.js"></script>
</head>
<body data-ng-controller="changePwdCtrl">
<div class="container">
	<h2 class="text-success my-5">비밀번호 변경</h2>
	<form name="changePwdForm">
		<p class="alert alert-success">등록된아이디:<strong>{{user_id}}</strong></p>
		<div class="form-group">
			<label for=""><strong>새 비밀번호 입력</strong></label>
			<input type="password" class="form-control" data-ng-model="user_pwd"
							   data-ng-required="true"
							   data-ng-minlength="8"
							   data-ng-maxlength="15"
							   data-ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z가-힇])(?=.*[!@#$%^&+=]).*$/"
							   placeholder="숫자,특수문자 포함  8~15글자를 입력해주세요"/>
		</div>
		<div class="form-group">
			<label for=""><strong>새 비밀번호 확인</strong></label>
			<input type="password" class="form-control" data-ng-model="check_pwd"
							   data-ng-required="true"
							   data-ng-minlength="8"
							   data-ng-maxlength="15"
							   data-ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z가-힇])(?=.*[!@#$%^&+=]).*$/"
							   placeholder="숫자,특수문자 포함  8~15글자를 입력해주세요"/>
		</div>
		<button class="btn btn-primary my-3 float-right" data-ng-click="changePwd()"
				data-ng-disabled="changePwdForm.$invalid">변경</button>
	</form>
</div>
</body>
</html>