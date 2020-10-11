<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html data-ng-app="myPageApp">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="../../resources/js/angular.min.js"></script>
<script>
	var myPageApp=angular.module("myPageApp",[]);
	myPageApp.controller("myPageCtrl",function($scope,$http){
		$http({
			url:'getUserInfo.do',
			method:'post',
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(data){
			var userinfo=data.userinfo;
			console.log(userinfo)
			console.log(data);
			$scope.user_name=userinfo.user_name;
			$scope.user_id=userinfo.user_id;
			$scope.user_phone=userinfo.user_phone;
			$scope.user_addr=userinfo.user_addr;
			
			if(userinfo.user_sort=="1"){
				$scope.user_sort="판매자";				
			}else{
				$scope.user_sort="일반회원";
			}
		})
	});
</script>
</head>
<body data-ng-controller="myPageCtrl">
<div class="container">
	
	<div class="row my-4">
	<!-- 회원 정보 테이블-->
		<h4 class="text-info h-50">회원정보</h4>
		<hr />
		<br />
			<table class="table border-bottom">
					<tbody >
						<tr>
							<th>이름</th>
							<td class="">{{user_name}}</td>
						</tr>
						<tr>	
							<th>아이디</th>
							<td>{{user_id}}</td>
						</tr>
						<tr>						
							<th>전화번호</th>
							<td>{{user_phone}}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>{{user_addr}}</td>
						</tr>
						<tr>	
							<th>계정 구분</th>
							<td>{{user_sort}}</td>
						</tr>
					</tbody>
			</table>
	</div>
	<hr class="my-3"/>
	<!-- 관심차량리스트 -->
	<div class="row my-4">
		<h4 class="text-info">관심차량</h4>
		<div class="w-100 border" style="height:200px;">
			<!-- 슬라이드 -->
		</div>	
	</div>
	<hr class="my-3"/>
	<!-- 최근본차량 리스트 -->
	<div class="row my-4">
		<h4 class="text-info">최근 본 차량</h4>
		<div class="w-100 border" style="height:200px;">
			<!-- 슬라이드 -->
		</div>
		<hr class="my-2"/>
	</div>
	<hr class="my-2"/>
	<div class="row my-4" >
		<!-- 회원정보 링크-->
		<div class="col-6">
			<div class="jumbotron text-center">
			  <h4 class="text-primary">회원정보수정</h4>
			  <p class="lead">회원 정보 수정을 원하십니까?</p>
			  <hr class="my-4">
			  <p class="lead">
			    <a class="btn btn-primary btn-lg" href="#" role="button">수정</a>
			  </p>
			</div>
		</div>
		<div class="col-6">
			<div class="jumbotron text-center ">
			  <h4 class="text-primary">회원탈퇴</h4>
			  <p class="lead">회원 탈퇴를  원하십니까?</p>
			  <hr class="my-4">
			  <p class="lead">
			    <a class="btn btn-primary btn-lg" href="#" role="button">탈퇴</a>
			  </p>
			</div>
		</div>
	</div>
	<hr />
</div>
</body>
</html>