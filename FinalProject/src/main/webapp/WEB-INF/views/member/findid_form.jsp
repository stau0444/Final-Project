<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container text-center" style="margin-top:150px;">
		<h1 class="my-5">MYCAR</h1>
		<p class="alert alert-success my-5">회원님의 아이디는<strong>${userid}</strong> 입니다.</p>
		<a href="/mycar/member/findpwd_form.do">비밀번호 찾기</a> |
		<a href="/mycar/member/login_form.do" target="_blank">로그인하러 가기</a>
	</div>
</body>
</html>