<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="verificationApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="../resources/js/angular.min.js"></script>
<script>
	var verificationApp=angular.module("verificationApp",[])
	verificationApp.controller("verificationCtrl",function($scope,$http){
		$scope.isSentVCode=false;
		$scope.sendCode=function(){
			$http({
				url:"findid_sendSMS.do",
				method:"post",
				params:{userPhone:$scope.userPhone},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				console.log(data);
				alert("인증 번호를 보냈습니다.");
				$scope.isSentVCode=true;
			});
		}
		$scope.checkCode=function(){
			$http({
				url:"findid_verify.do",
				method:"post",
				params:{userPhone:$scope.userPhone,verificationCode:$scope.VCode}
			}).success(function(data){
				if(data.isValid){
					alert("인증 되었습니다!")	
					location.replace("/mycar/member/verified/findid_form.do?userPhone="+data.userPhone);
				}else{
					alert("인증에 실패했습니다. 다시시도 해주세요!");
				}
				console.log(data);
			})
		}
	})
</script>
</head>
<body  data-ng-controller="verificationCtrl">
	<!-- 유저 번호 입력 폼 -->
	<div class="container">
		<form name="identification">
			<span style="color: green; font-weight: bold;">SMS전송 (문자보내기)</span>
			<div class="form-group">
				<span>전화번호 :</span> 
					<input type="text" name="userPhone" placeholder="  '-' 없이  입력해주세요 "  class="form-control"
						data-ng-pattern="/^[0-9]{11,11}$/" 
						data-ng-model="userPhone"/>
						<button class="btn btn-primary" 
						data-ng-disabled="identification.userPhone.$invalid" 
						data-ng-click="sendCode()">
					전송
				</button>
			</div>
		</form>
		<!-- 인증 번호 입력,확인 폼 -->
		<form name="checkVCode" data-ng-show="isSentVCode">
			<label for="VCode">인증번호 입력</label> 
			<div class="form-group">
				<input type="text" name="VCode" class="form-control" 
					data-ng-model="VCode"
					data-ng-pattern="/^[0-9]{6,6}$/" />
				<button class="btn btn-primary"
						data-ng-disabled="checkVCode.VCode.$invalid"
						data-ng-click="checkCode()">전송</button>
			</div>
		</form>
	</div>
</body>
</html>