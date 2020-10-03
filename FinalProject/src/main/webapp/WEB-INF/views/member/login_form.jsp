<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="loginApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="../resources/js/angular.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script>
	var loginApp=angular.module("loginApp",[])
	//아이디 비밀번호 찾기 팝업 제어하는 컨트롤러
	loginApp.controller('findIdPwdCtrl', function ($scope, $window) {
            $scope.findIdPopUp = function () {
                var $popup = $window.open("findid_verifyform.do", "popup", "width=450,height=600,left=200,top=100");
                $popup.Name = $scope.Name;
            };
            $scope.findPwdPopUp = function () {
                var $popup = $window.open("findpwd_form.do", "popup", "width=450,height=600,left=200,top=100");
                $popup.Name = $scope.Name;
            };
        });
	//로그인  폼을 제어하는 컨트롤러
	loginApp.controller("loginCtrl",function($scope,$http){
			$scope.isLogined=false;
			$scope.login=function(){
				if($scope.userId==null){
					alert("아이디를 입력해주세요");
				}else if($scope.userPwd==null){
					alert("비밀번호를 입력해주세요");
				}else{
					$http({
						url:'private/login.do',
						method:'post',
						params:{
							user_id:$scope.userId,
							user_pwd:$scope.userPwd
							},
						headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},
					}).success(function(data){
							console.log(data)
							if(data.isValid){
								alert("로그인 되었습니다");
								location.replace("/mycar/index.do");						
							}else{
								alert("아이디 혹은 비밀번호가 다릅니다 다시 시도해주세요")
							}
					});
			};
		};
	});
	
</script>
</head>
<body >
	<div class="container">
		<h2>로그인 폼</h2>
		<form data-ng-controller="loginCtrl">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="user_id" data-ng-model="userId" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" name="user_pwd" data-ng-model="userPwd" class="form-control"/>
			</div>
			<button data-ng-click="login()" class="btn btn-primary">로그인</button>
		</form>
		<div id="naver_id_login" style="margin-top:40px;"><a href="${url}"><img width="223" src="../resources/img/Nlogin.PNG"/></a></div>
		<div data-ng-controller="findIdPwdCtrl">
			<div>
				<a data-ng-click="findIdPopUp()" href="#">아이디를 잃어버리셨나요?</a>
			</div>
			<div>
				<a data-ng-click="findPwdPopUp()" href="#">비밀번호를 잃어버리셨나요?</a>
			</div>
			<div>
		</div>
			<a href="identification_form.do">회원가입</a>
		</div>
	</div>
</body>
</html>