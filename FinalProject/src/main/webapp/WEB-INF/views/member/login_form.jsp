<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 폼</h2>
	<form action="private/login.do" method="post">
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id"  id="id"/>
		</div>
		<div>
			<label for="pwd">아이디</label>
			<input type="password" name="pwd"  id="pwd"/>
		</div>
		<button type="submit">로그인</button>
	</form>
</body>
</html>