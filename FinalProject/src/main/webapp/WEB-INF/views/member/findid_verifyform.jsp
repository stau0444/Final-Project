<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="verificationApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="../resources/js/angular.min.js"></script>
<script src="../resources/js/member/findid_verifyform.js"></script>
</head>
<body  data-ng-controller="verificationCtrl">
	<!-- 유저 번호 입력 폼 -->
	<div class="container  text-center">
		<form name="identification">
			<h2  class="text-success my-4"><strong>본인인증</strong></h2>
			<div class="form-group">
				<span><strong>전화번호</strong> </span> 
					<input type="text" name="userPhone" placeholder="  '-' 없이  입력해주세요 "  class="form-control my-3"
						data-ng-pattern="/^[0-9]{11,11}$/" 
						data-ng-model="userPhone"/>
						<button class="btn btn-primary mb-3" 
							data-ng-disabled="identification.userPhone.$invalid" 
							data-ng-click="sendCode()">
							전송
						</button>
			</div>
		</form>
		<!-- 인증 번호 입력,확인 폼 -->
		<form name="checkVCode" data-ng-show="isSentVCode">
			<label for="VCode"><strong>인증번호 입력</strong></label> 
			<div class="form-group">
				<input type="text" name="VCode" class="form-control my-3" 
					data-ng-model="VCode"
					data-ng-pattern="/^[0-9]{6,6}$/" />
				<button class="btn btn-primary"
						data-ng-disabled="checkVCode.VCode.$invalid"
						data-ng-click="checkCode()">확인</button>
			</div>
		</form>
	</div>
</body>
</html>