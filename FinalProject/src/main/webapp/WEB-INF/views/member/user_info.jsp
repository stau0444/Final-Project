<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row my-4" data-ng-controller="myPageCtrl">
	<!-- 회원 정보 테이블-->
	<h3 class="text-info">회원정보</h3>
	<hr />
	<br />
	<table class="table border-bottom" >
		<tbody>
			<tr>
				<th>이름</th>
				<td>{{user_name}}</td>
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