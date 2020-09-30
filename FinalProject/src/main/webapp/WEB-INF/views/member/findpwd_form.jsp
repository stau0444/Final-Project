<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="findpwdApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/angular.min.js"></script>
<script>
	var findpwdApp=angular.module("findpwdApp",[]);
	findpwdApp.controller("findpwdCtrl",function($scope,$http){
		$scope.test="test";
		$scope.isCheckedId=false;
		$scope.findpwd=function(){
			$http({
				url:'findpwd_verifyform.do',
				method:'post',
				params:{user_id:$scope.user_id},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				console.log(data)
				if(!data.isExsist){
					alert("존재하지 않는 아이디입니다");
				}else{
					alert("본인인증 페이지로 넘어갑니다");
					$scope.userPhone="01091150444";
					$scope.isCheckedId=true;
				}
			});
		};
		$scope.findpwd_verify=function(){
			$http({
				url:'findpwd_sendSMS.do',
				method:'post',
				params:{userPhone:$scope.userPhone},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				alert("인증번호가 전송되었습니다.");
			});
		};
		$scope.findpwd_checkVCode=function(){
			$http({
				url:'findpwd_checkVCode.do',
				method:'post',
				params:{
					userPhone:$scope.userPhone,
					verificationCode:$scope.Vcode
					},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				console.log(data);
				if(data.isValid){
					alert("인증되었습니다");
					location.href="changepwd_form.do?userid="+$scope.user_id;
				}
			});
		};
	});
</script>
</head>
<body data-ng-controller="findpwdCtrl">
<h2>비밀번호 찾기 폼입니다</h2>
<form >
	<p>{{test}}</p>
	<label for="">아이디를 입력해주세요</label>
	<input type="text" id="user_id" data-ng-model="user_id"/>
	<button data-ng-click="findpwd()">전송</button>
</form> 
<form data-ng-show="isCheckedId" >
	<p>{{userPhone}} 등록된 핸드폰으로 본인인증하기</p>
	<button data-ng-click="findpwd_verify()">인증번호받기</button>
</form>
<form data-ng-show="isCheckedId">
	<label for="">인증번호입력</label>
	<input type="text" data-ng-model="Vcode" />
	<button data-ng-click="findpwd_checkVCode()">인증번호 확인</button>
</form>
</body>
</html>