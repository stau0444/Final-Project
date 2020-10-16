<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr />
<h3 class="text-info my-4 text-center">회원정보</h3>
<hr />
<div class="row ">		
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