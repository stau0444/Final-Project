<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="carApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../resources/js/angular.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var searchPostCode=function(){
	new daum.Postcode({
        oncomplete: function(data) {
        	document.getElementById("addr").value = data.address;
        	document.getElementById("p_code").value =data.zonecode;
        }
    }).open();

};
</script>
<script>
	var carApp=angular.module("carApp",[]);
	carApp.controller("loginCtrl",function($scope,$http){
		$scope.isExist=true;
		$scope.addUser=function(){
			if($scope.inputPwd!=$scope.checkpwd){
				alert("입력한 비밀번호가 다릅니다 확인 후 다시 시도해주세요");
			}else{
				$scope.inputAddr=document.getElementById("addr").value;
				$scope.inputPCode=document.getElementById("p_code").value;
				
						$http({
							url:'sign_up.do',
							method:'post',
							params:{user_id:$scope.inputId ,
									user_pwd:$scope.inputPwd,
									user_name:$scope.inputName , 
									user_phone:$scope.inputPhone , 
									user_addr:$scope.inputAddr+$scope.addrDetail , 
									user_p_code:$scope.inputPCode , 
									user_sort:$scope.inputSort},
							headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
						}).success(function(data){
							alert("회원 가입에 성공했습니다 로그인을 해주세요.");
							location.replace("/mycar/member/login_form.do")
						});
					};
			};
		$scope.checkId=function(){
				$http({
					url:'/mycar/member/verified/checkid.do',
					method:'post',
					params:{user_id:$scope.inputId}
				}).success(function(data){
					if(data.isExist){
						console.log(data);
						alert("이미 존재하는 아이디입니다");
					}else{
						alert("사용가능한 아이디입니다");
						$scope.isExist=false;
					}
				});
		};
	});
</script>


</head>
<body data-ng-controller="loginCtrl">
	<h2>회원가입폼</h2>
	<form method="post" novalidate name="signUpForm">
		<div>
			<label for="name">이름</label>
			<input type="text" id="name"  name="user_name" 
				data-ng-required="true"
				data-ng-model="inputName"
				data-ng-pattern="/^[가-힇]{2,10}$/"/>
		</div>
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id"  name="user_id" 
				data-ng-model="inputId"
				data-ng-required="true"
				data-ng-minlength="8"
				data-ng-maxlength="15"
				data-ng-pattern="/^[a-z]+[a-z0-9]{5,19}$/g"
				placeholder="영문 소문자로 시작 숫자포함   5~19글자를 입력해주세요"/>
			<button data-ng-click="checkId()">중복확인</button>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd"  name="user_pwd " 
				data-ng-model="inputPwd"
				data-ng-required="true"
				data-ng-minlength="8"
				data-ng-maxlength="15"
				data-ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z가-힇])(?=.*[!@#$%^&+=]).*$/"
				placeholder="숫자,특수문자 포함  8~15글자를 입력해주세요"/>
		</div>
		<div>
			<label for="checkpwd">비밀번호 확인</label>
			<input type="password" id="checkpwd" 
				data-ng-model="checkpwd"
				data-ng-required="true"
				data-ng-minlength="8"
				data-ng-maxlength="15"
				data-ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z가-힇])(?=.*[!@#$%^&+=]).*$/"
				placeholder="숫자,특수문자 포함  8~15글자를 입력해주세요"/>
		</div>
		<div>
			<label for="p_code">우편번호</label>
			<input type="text" id="p_code"  name="user_p_code" 
				data-ng-model="inputPCode"/>
			<button onClick="searchPostCode()">우편번호 찾기</button>
		</div>
		<div>
			<label for="addr">주소</label>
			<input type="text" id="addr"  name="user_addr" 
				data-ng-model="inputAddr"/>
		</div>
		<div>
			<label for="addrDetail">상세주소</label>
			<input type="text" id="addrDetail" data-ng-model="addrDetail"/>
		</div>
		<div>
			<label for="sort">판매자로 등록</label>
			<input type="checkbox" id="sort" name="user_sort" 
				data-ng-model="inputSort"/>
		</div>
		<div>
			<label for="phone">전화번호</label>
			<input type="text" id="phone"  name="user_phone" 
				data-ng-required="true"
				data-ng-model="inputPhone"
				data-ng-pattern="/^[0-9]{11,11}$/"
				placeholder="( - ) 없이 입력해 주세요"/>
		</div>
		<button data-ng-click="addUser()" 
				data-ng-disabled="isExist||signUpForm.$invalid">등록</button>
	</form>
</body>
</html>