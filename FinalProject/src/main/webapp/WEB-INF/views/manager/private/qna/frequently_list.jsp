<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" ng-controller="qnaCtrl">

	<h1>자주묻는질문 리스트</h1>
	<a href="#frequently-form" class="float-right">질문추가</a>
	<table class="table table-light">
		<thead class="table-dark">
			<tr>
				<th>카테고리</th>
				<th>질문</th>
				
			</tr>
			
		</thead>
		<tbody>
			<tr ng-repeat="tmp in list">
				<td ng-show="tmp.category == 1">사이트 이용</td>
				<td ng-show="tmp.category == 2">장애/오류</td>
				<td ng-show="tmp.category == 3">기타</td>
				<td>
					{{tmp.question}} 
					<button class="btn btn-warning float-right ml-4" ng-click="updateFrequently(tmp.qna_num)">수정</button> 
					<button class="btn btn-danger float-right mr-4"  ng-click="deleteFrequently(tmp.qna_num)">삭제</button>
				</td>
				
				
			</tr>
		</tbody>
	</table>
	
	<nav aria-label="Page navigation">
		<ul class="pagination">
			<li class="page-item" ng-repeat="pagenum in pagelist"><a
				class="page-link" href="#QnA" ng-click="getList(pagenum)">{{pagenum}}</a></li>
		</ul>
	</nav>
</div>