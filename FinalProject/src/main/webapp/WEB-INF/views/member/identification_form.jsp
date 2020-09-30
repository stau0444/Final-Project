<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="verificationApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/angular.min.js"></script>
<script>
	var verificationApp = angular.module("verificationApp", [])
	verificationApp.controller("verificationCtrl",function($scope, $http) {
			
			$scope.isSentVCode=false;	
			$scope.sendCode = function() {
				$http({
					url:'checkPhone.do',
					method:'post',
					params:{user_phone:$scope.userPhone},
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
						if(data.isExist){
							alert("해당 핸드폰번호로 등록된 아이디가 존재합니다.아이디 혹은 비밀번호를 찾아 로그인 해주세요");
							location.replace("/mycar/member/login_form.do")
						}else{
							$http({
								url : "sendSms.do",
								method : "post",
								params : {userPhone : $scope.userPhone},
								headers : {"Content-Type" : "application/x-www-form-urlencoded;charset=utf-8"}
							}).success(function(data) {
								console.log(data);
								alert("인증 번호를 보냈습니다.");
								$scope.isSentVCode=true;
							});
						};
					});
				};
				$scope.checkCode = function() {
					$http({
						url : "checkVCode.do",
						method : "post",
						params : {
						userPhone : $scope.userPhone,
						verificationCode : $scope.VCode
					}
				}).success(function(data) {
					if (data.isValid) {
						alert("인증 되었습니다!")
						location.replace("/mycar/member/verified/identification.do")
					} else {
						alert("인증에 실패했습니다. 다시시도 해주세요!")
					}
					console.log(data);
				});
			};
		});
</script>
</head>
<body data-ng-controller="verificationCtrl">
	<!-- 유저 번호 입력 폼 -->
	<form name="identification">
		<span style="color: green; font-weight: bold;">SMS전송 (문자보내기)</span>
		<div>
			<span>전화번호 :</span> 
			<input type="text" name="userPhone" placeholder="  '-' 없이  입력해주세요 " 
					data-ng-pattern="/^[0-9]{11,11}$/" 
					data-ng-model="userPhone"/>
			<button data-ng-disabled="identification.userPhone.$invalid" 
					data-ng-click="sendCode()">
				전송
			</button>
		</div>
	</form>
	<!-- 인증 번호 입력,확인 폼 -->
	<form name="checkVCode" data-ng-show="isSentVCode">
		<label for="VCode">인증번호 입력</label> 
		<input type="text" name="VCode" 
			data-ng-model="VCode"
			data-ng-pattern="/^[0-9]{6,6}$/" />
		<button data-ng-disabled="checkVCode.VCode.$invalid"
				data-ng-click="checkCode()">전송</button>
	</form>
</body>
</html>