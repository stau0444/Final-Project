<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	테스트페이지입니다
	
	<form action="insert.do" method="get">
		<label for="name">이름</label>
		<input type="text" id="name"  name="name"/>
		<label for="num">번호</label>
		<input type="text" id="num" name="num"/>
		<label for="addr">주소</label>
		<input type="text" id="addr" name="addr"/>
		<button type="submit">전송</button>
	</form>
	
	<h1>리스트</h1>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list}">
				<tr>
					<td>${tmp.name }</td>
					<td>${tmp.num }</td>
					<td>${tmp.addr }</td>
					<td><a href="delete.do?num=${tmp.num}">삭제</a></td>
					<td><a href="update_form.do?num=${tmp.num}">수정</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>