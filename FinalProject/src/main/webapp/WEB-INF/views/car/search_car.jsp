<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>차량 검색창</title>
</head>
<body data-ng-controller="searchController">
	<label for="car_search">차량 검색</label>
	<input type="text" id="car_search" data-ng-model="data" placeholder="모델명을 입력..."/>
	<button type="button" data-ng-click="searchClick()">검색</button>
	<br />
	<table>
		<thead>
			<tr>
				<th>구분</th>
				<th>차종</th>
				<th>회사</th>
				<th>모델명</th>
			</tr>
		</thead>
		<tbody>
			<tr data-ng-repeat="tmp in list" data-ng-click="selector(tmp.m_name)">
				<td data-ng-bind="car_group[tmp.car_group]"></td>
				<td data-ng-bind="c_sort[tmp.c_sort]"></td>
				<td data-ng-bind="company[tmp.company]"></td>
				<td id="m_name" data-ng-bind="tmp.m_name"></td>
			</tr>
		</tbody>
	</table>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
	<script>
		var myApp=angular.module("myApp",[]);
		
		myApp.controller("searchController",function($scope,$http) {
			$scope.car_group=["해외","국내"];
			$scope.c_sort=["","소형차","중형차","대형차","스포츠카","SUV","화물차"];
			$scope.company=["","현대","기아","제네시스","쉐보레","르노삼성","쌍용","벤츠","BMW","아우디","폭스바겐","도요타"];		
			
			$scope.searchClick=function() {

				$http({
					url:"searchModel.do",
					method:"post",
					params:{m_name:$scope.data},
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					$scope.list=data;
				});
			};
			
			$scope.selector=function(m_name) {
				console.log(m_name);
				opener.document.querySelector("#m_name_view").value=m_name;
				opener.document.querySelector("#m_name").value=m_name;
				window.close();
			};
		});
	</script>
</body>
</html>