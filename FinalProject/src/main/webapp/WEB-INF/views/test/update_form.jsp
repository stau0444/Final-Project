<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${num}</h1>
	<form action="update.do">
		<input type="hidden" value="${num}" />
		<label for="name">이름</label>
		<input type="text" id="name" name="name"/>
		<label for="addr">주소</label>
		<input type="text" id="addr" name="addr"/>
		<button type="submit">수정</button>
	</form>
</body>
</html>