<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="changePwdApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/angular.min.js"></script>
<script>
	var changePwdApp=angular.module("changePwdApp",[]);
	changePwdApp.controller("changePwdCtrl",function($scope,$http,$location){
		function searchParam(key) {
			  return new URLSearchParams(location.search).get(key);
		};
		$scope.user_id=searchParam('userid');
		console.log($scope.user_id);
		$scope.changePwd=function(){
			if($scope.user_pwd!=$scope.check_pwd){
				alert("입력한 비밀번호가 다릅니다 다시 시도해주세요");
			}else{
				$http({
					url:'changePwd.do',
					method:'post',
					params:{user_id:$scope.user_id,user_pwd:$scope.user_pwd},
					header:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					if(data.isChanged){
						alert("비밀번호가 변경되었습니다");
						window.close();
					}else{
						alert("비밀번호 변경에 실패했습니다.");
					}
				});
			};
		};
	});
</script>
</head>
<body data-ng-controller="changePwdCtrl">
	<h2>비밀번호 변경폼입니다.</h2>
	<form name="changePwdForm">
		<p>{{user_id}}</p>
		<div>
			<label for="">새 비밀번호 입력</label>
			<input type="password" data-ng-model="user_pwd"
							   data-ng-required="true"
							   data-ng-minlength="8"
							   data-ng-maxlength="15"
							   data-ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z가-힇])(?=.*[!@#$%^&+=]).*$/"
							   placeholder="숫자,특수문자 포함  8~15글자를 입력해주세요"/>
		</div>
		<div>
			<label for="">새 비밀번호 확인</label>
			<input type="password" data-ng-model="check_pwd"
							   data-ng-required="true"
							   data-ng-minlength="8"
							   data-ng-maxlength="15"
							   data-ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z가-힇])(?=.*[!@#$%^&+=]).*$/"
							   placeholder="숫자,특수문자 포함  8~15글자를 입력해주세요"/>
		</div>
		<button data-ng-click="changePwd()"
				data-ng-disabled="changePwdForm.$invalid">변경</button>
	</form>
</body>
</html>