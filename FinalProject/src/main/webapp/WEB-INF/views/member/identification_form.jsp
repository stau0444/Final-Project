<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="verificationApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/member/verification.css" />
<script src="../resources/js/angular.min.js"></script>
<script src="../resources/js/member/verification.js"></script>
</head>
<body data-ng-controller="verificationCtrl">
	<!-- 유저 번호 입력 폼 -->
	<div class="container">
		<div class="progress my-5">
		  <div class="progress-bar" role="progressbar"  aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">본인인증</div>
		</div>
		<div class="text-center">
		<form name="identification">
			<h2 style="color: green; font-weight: bold;">본인인증</h2>
			<div class="form-group">
				<input type="text" name="userPhone" placeholder=" 전화번호를  '-' 없이  입력해주세요 " 
						class="form-control"
						data-ng-pattern="/^[0-9]{11,11}$/" 
						data-ng-model="userPhone"/>
				<button  class="btn btn-outline-success my-3" data-ng-disabled="identification.userPhone.$invalid" 
						data-ng-click="sendCode()">
					전송
				</button>
			</div>
		</form>
		</div>
		<!-- 인증 번호 입력,확인 폼 -->
		<div class="text-center">
			<form name="checkVCode" data-ng-show="isSentVCode">
				<label for="VCode"><strong>인증번호 입력</strong></label> 
				<input type="text" name="VCode" class="form-control"
					data-ng-model="VCode"
					data-ng-pattern="/^[0-9]{6,6}$/" />
				<button  class="btn btn-outline-primary my-3"data-ng-disabled="checkVCode.VCode.$invalid"
						data-ng-click="checkCode()">전송</button>
			</form>
		</div>
	</div>
</body>
</html>