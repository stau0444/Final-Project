<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="findpwdApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="../resources/js/angular.min.js"></script>
<script src="../resources/js/member/findpwd_form.js"></script>
</head>
<body data-ng-controller="findpwdCtrl">
<div class="container text-center">
	<h2 class="text-success my-3">비밀번호 찾기 </h2>
	<form>
		<div class="form-group">
			<label for="" ><strong >등록된 아이디</strong></label>
			<input type="text" id="user_id" data-ng-model="user_id" class="form-control"/>
			<button data-ng-click="findpwd()" class="btn btn-primary my-3">전송</button>
		</div>
	</form> 
	<form data-ng-show="isCheckedId" >
		<p class="alert alert-success">{{userPhone}} 등록된 핸드폰으로 본인인증하기</p>
		<button data-ng-click="findpwd_verify()" class="btn btn-primary my-3">인증번호받기</button>
	</form>
	<form data-ng-show="isCheckedId">
		<div class="form-group">
			<label for="">인증번호입력</label>
			<input type="text" data-ng-model="Vcode" class="form-control" />
			<button data-ng-click="findpwd_checkVCode()" class="btn btn-primary my-3">인증번호 확인</button>
		</div>
	</form>
</div>
</body>
</html>