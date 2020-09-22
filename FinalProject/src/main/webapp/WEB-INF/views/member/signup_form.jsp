<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="carApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/angular.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var carApp=angular.module("carApp",[]);
	carApp.controller("loginCtrl",function($scope,$http){
		$scope.isExist=true;
		$scope.clickedCount=0;
		$scope.addUser=function(){
			$http({
				url:'/mycar/member/sign_up.do',
				method:'post',
				params:{user_id:$scope.inputId ,
					user_pwd:$scope.inputPwd,
					user_name:$scope.inputName , 
					user_phone:$scope.inputPhone , 
					user_addr:$scope.inputAddr , 
					user_p_code:$scope.inputPCode , 
					user_sort:$scope.inputSort},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				alert("회원 가입에 성공했습니다 로그인을 해주세요.");
				location.href="/mycar/member/login_form.do"
			});
		};
		$scope.checkId=function(){
			$http({
				url:'/mycar/member/checkid.do',
				method:'post',
				params:{user_id:$scope.inputId}
			}).success(function(data){
				if(data.isExist){
					console.log(data);
					alert("이미 존재하는 아이디입니다");
					$scope.clickedCount++
				}else{
					alert("사용가능한 아이디입니다");
					$scope.isExist=false;
				}
			});
		};
	});
</script>
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

</head>
<body data-ng-controller="loginCtrl">
	<h2>회원가입폼</h2>
	<form >
		<div>
			<label for="name">이름</label>
			<input type="text" id="name"  name="user_name" data-ng-model="inputName"/>
		</div>
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id"  name="user_id" data-ng-model="inputId"/>
			<button data-ng-click="checkId()">중복확인</button>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd"  name="user_pwd " data-ng-model="inputPwd"/>
		</div>
		<div>
			<label for="checkpwd">비밀번호 확인</label>
			<input type="password" id="checkpwd" data-ng-model="checkpwd"/>
		</div>
		<div>
			<label for="phone">전화번호</label>
			<input type="text" id="phone"  name="user_phone" data-ng-model="inputPhone"/>
		</div>
		<div>
			<label for="addr">주소</label>
			<input type="text" id="addr"  name="user_addr" data-ng-model="inputAddr"/>
		</div>
		<div>
			<label for="p_code">우편번호</label>
			<input type="text" id="p_code"  name="user_p_code" data-ng-model="inputPCode"/>
			<button onClick="searchPostCode()">우편번호 찾기</button>
		</div>
		<div>
			<label for="sort">판매자로 등록</label>
			<input type="checkbox" id="sort" name="user_sort" data-ng-model="inputSort"/>
		</div>
		<button data-ng-click="addUser()" data-ng-disabled=isExist>등록</button>
	</form>
</body>
</html>