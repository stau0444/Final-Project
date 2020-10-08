<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" data-ng-controller="iqCtrl">

	<table class="table table-light">
		<thead class="table table-dark">
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>문의자ID</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="tmp in list">
				<td ng-show="tmp.iq_category == 1">사이트 이용</td>
				<td ng-show="tmp.iq_category == 2">장애/오류</td>
				<td ng-show="tmp.iq_category == 3">기타</td>
				<td>{{tmp.iq_title}}</td>
				<td>{{tmp.user_id}}<a href="#answer-form/{{tmp.iq_num}}" class="float-right">답변하기</a></td>
			</tr>
		</tbody>
	</table>

	<nav aria-label="Page navigation">
		<ul class="pagination">
			<li class="page-item" ng-repeat="pagenum in pagelist"><a
				class="page-link" href="#QnA_individual" ng-click="getList(pagenum)">{{pagenum}}</a></li>
		</ul>
	</nav>
</div>