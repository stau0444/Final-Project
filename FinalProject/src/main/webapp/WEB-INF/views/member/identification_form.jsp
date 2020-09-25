<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="verificationApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/angular.min.js"></script>
<script>
	var verificationApp=angular.module("verificationApp",[])
	verificationApp.controller("verificationCtrl",function($scope,$http){
		$scope.sendCode=function(){
			$http({
				url:"sendSms.do",
				method:"post",
				params:{userPhone:$scope.userPhone},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				console.log(data);
				alert("인증 번호를 보냈습니다.");
			});
		}
		$scope.checkCode=function(){
			$http({
				url:"checkVCode.do",
				method:"post",
				params:{userPhone:$scope.userPhone,verificationCode:$scope.VCode}
			}).success(function(data){
				if(data.isValid){
					alert("인증 되었습니다!")	
					location.replace("/mycar/member/verified/identification.do")
				}else{
					alert("인증에 실패했습니다. 다시시도 해주세요!")
				}
				console.log(data);
			})
		}
	})
</script>
</head>
<body  data-ng-controller="verificationCtrl">
	<form>
		<table border="1"  width="300" height="200">
			<tr>
				<td>
					<center>
						<br> 
						<span style="color: green; font-weight: bold;">SMS전송 (문자보내기)</span>
					</center>
					<ul>
						<li>전화번호 : <input type="text" data-ng-model="userPhone" placeholder="  '-' 없이  입력해주세요 " /></li>
						<br />
						<center>
							<button data-ng-click="sendCode()">전송</button>
						</center>
					</ul>
				</td>
			</tr>
		</table>
	</form>
	<form>
		<label for="VCode">인증번호 입력</label>
		<input type="text"  data-ng-model="VCode" name="VCode" id="VCode"/>
		<button data-ng-click="checkCode()">전송</button>
	</form>



</body>
</html>