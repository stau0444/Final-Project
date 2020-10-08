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
	<div class="container border">
		<div class="progress my-5">
		  <div class="progress-bar" role="progressbar"  aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">본인인증</div>
		</div>
		<h3 class="text-center mb-5">인증방식을 선택해주세요</h3>
		<div class="row text-center">
			<div class="col-6">
				<label for="phone">휴대폰인증</label>
				<input type="checkbox" id="phone" data-ng-model="choosePhoneAuth" data-ng-disabled="chooseMailAuth"/>
				<br />
				<svg class="border rounded px-2 py-2"  width="8em" height="7em" viewBox="0 0 16 16" class="bi bi-phone-vibrate" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M10 3H6a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM6 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H6z"/>
				  <path fill-rule="evenodd" d="M8 12a1 1 0 1 0 0-2 1 1 0 0 0 0 2zM1.599 4.058a.5.5 0 0 1 .208.676A6.967 6.967 0 0 0 1 8c0 1.18.292 2.292.807 3.266a.5.5 0 0 1-.884.468A7.968 7.968 0 0 1 0 8c0-1.347.334-2.619.923-3.734a.5.5 0 0 1 .676-.208zm12.802 0a.5.5 0 0 1 .676.208A7.967 7.967 0 0 1 16 8a7.967 7.967 0 0 1-.923 3.734.5.5 0 0 1-.884-.468A6.967 6.967 0 0 0 15 8c0-1.18-.292-2.292-.807-3.266a.5.5 0 0 1 .208-.676zM3.057 5.534a.5.5 0 0 1 .284.648A4.986 4.986 0 0 0 3 8c0 .642.12 1.255.34 1.818a.5.5 0 1 1-.93.364A5.986 5.986 0 0 1 2 8c0-.769.145-1.505.41-2.182a.5.5 0 0 1 .647-.284zm9.886 0a.5.5 0 0 1 .648.284C13.855 6.495 14 7.231 14 8c0 .769-.145 1.505-.41 2.182a.5.5 0 0 1-.93-.364C12.88 9.255 13 8.642 13 8c0-.642-.12-1.255-.34-1.818a.5.5 0 0 1 .283-.648z"/>
				</svg>
			</div>
			<div class="col-6">
				<label for="mail">이메일인증</label>
				<input type="checkbox" id="mail" data-ng-model="chooseMailAuth"  data-ng-disabled="choosePhoneAuth"/>
				<br />
				<svg class="border rounded px-2 py-2" width="8em" height="7em" viewBox="0 0 16 16" class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
				</svg>
			</div>
		</div>
			<div class="text-center mt-4">
			<form name="identification" data-ng-show="choosePhoneAuth">
				<h2 style="color: green; font-weight: bold;">휴대폰 본인인증</h2>
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
			<div class="text-center">
				<form name="identificationMail" data-ng-show="chooseMailAuth">
					<h2 style="color: green; font-weight: bold;">이메일 인증</h2>
					<div class="form-group">
						<input type="text" name="userEmail" placeholder=" 이메일주소를 입력 해주세요 " 
								class="form-control"
								data-ng-model="userEmail"/>
						<button  class="btn btn-outline-success my-3" data-ng-disabled="identification.userPhone.$invalid" 
								data-ng-click="sendEmailCode()">
							전송
						</button>
					</div>
				</form>
			</div>
				<!-- 인증 번호 입력,확인 폼 -->
			<div class="text-center">
				<form name="checkEmailVCode" data-ng-show="isSentMail">
					<label for="VCode"><strong>인증번호 입력</strong></label> 
					<input type="text" name="EmailVCode" class="form-control"
						data-ng-model="EmailVCode" />
					<button  class="btn btn-outline-primary my-3"data-ng-disabled="checkVCode.VCode.$invalid"
							data-ng-click="checkEmailCode()">전송</button>
				</form>
			</div>
		</div>
	
	
</body>
</html>