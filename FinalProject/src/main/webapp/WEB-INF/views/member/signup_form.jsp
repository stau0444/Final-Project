<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="carApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/css/member/signup_form.css" />
<script src="../../resources/js/angular.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../../resources/js/member/signup_form.js"></script>
</head>
<body data-ng-controller="loginCtrl">
	<div class="container">
		<h2>회원가입폼</h2>
		<div class="progress my-5">
		  <div class="progress-bar" role="progressbar" id="p1" style="width: 33% " aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">본인인증</div>
		  <div class="progress-bar bg-warning" role="progressbar" id="p2"  aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">회원가입</div>
		</div>
		<form method="post" novalidate name="signUpForm" class="border-success">
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" id="name"  name="user_name" class="form-control"
					placeholder="한글로 입력해주세요"
					data-ng-required="true"
					data-ng-model="inputName"
					data-ng-pattern="/^[가-힇]{2,10}$/"/>
			</div>
			
						
			<div class="form-group d-inline">
				<label for="id">아이디</label>
				<div class="input-group">
					<input type="text" id="id"  name="user_id"  class="form-control mr-2 "
						data-ng-model="inputId"
						data-ng-required="true"
						data-ng-pattern="/^[a-zA-Z0-9]{8,15}$/"
						data-ng-class="{'is-valid':signUpForm.user_id.$valid}"
						placeholder="영문 또는 숫자   8~15글자를 입력해주세요"/>
				  <div class="input-group-append">
				    <span class="input-group" id="basic-addon2">
				    	<button data-ng-click="checkId()" class="btn btn-primary">중복확인</button>
				    </span>
				  </div>
				</div>
				    <small class="text-success" data-ng-show="signUpForm.user_id.$valid">형식에 맞는 아이디 입니다 중복 확인해주세요</small>
				
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" id="pwd"  name="user_pwd " class="form-control"
					data-ng-class="{'is-valid':signUpForm.user_pwd.$valid}"
					data-ng-model="inputPwd"
					data-ng-required="true"
					data-ng-minlength="8"
					data-ng-maxlength="15"
					data-ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z가-힇])(?=.*[!@#$%^&+=]).*$/"
					placeholder="숫자,특수문자 포함  8~15글자를 입력해주세요"/>
			</div>
			<div class="form-group">
				<label for="checkpwd">비밀번호 확인</label>
				<input type="password" name="checkpwd " id="checkpwd" class="form-control"
					data-ng-class="{'is-valid':signUpForm.checkpwd.$valid}"
					data-ng-model="checkpwd"
					data-ng-required="true"
					data-ng-minlength="8"
					data-ng-maxlength="15"
					data-ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z가-힇])(?=.*[!@#$%^&+=]).*$/"
					placeholder="영문,숫자,특수문자 포함  8~15글자를 입력해주세요"/>
			</div>
			<div class="form-group">
				<label for="p_code">우편번호</label>
				<div class="input-group mb-3">
					<input type="text" id="p_code"  name="user_p_code" class="form-control" data-ng-model="inputPCode"/>
				  <div class="input-group-append">
					<button onClick="searchPostCode()" class="btn btn-primary">우편번호 찾기</button>
				  </div>
				</div>
			</div>
			<div class="form-group">
				<label for="addr">주소</label>
				<input type="text" id="addr"  name="user_addr" class="form-control"
					data-ng-model="inputAddr"/>
			</div>
			<div class="form-group">
				<label for="addrDetail">상세주소</label>
				<input type="text" id="addrDetail" class="form-control" data-ng-model="addrDetail"/>
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label>
				<input type="text" id="phone"  name="user_phone" class="form-control"
					data-ng-required="true"
					data-ng-model="inputPhone"
					data-ng-pattern="/^[0-9]{11,11}$/"
					placeholder="( - ) 없이 입력해 주세요"/>
			</div>
			<div class="">
				<label for="sort">판매자로 등록</label>
				<input type="checkbox" id="sort" name="user_sort" data-ng-model="inputSort"/>
			</div>
			<div>
				<button class=" btn btn-outline-success float-right"
						data-ng-click="addUser()" 
						data-ng-disabled="signUpForm.$invalid">등록</button>
			</div>
		</form>
	</div>
</body>
</html>