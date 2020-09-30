<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${userinfo ne null}">
		<a href="findpwd_verify.do?user_phone=${userinfo.user_phone}">등록된 전화번호로 (${userinfo.user_phone}) 본인 인증</a>
		<button>인증번호 받기</button>
		<form action="">
			<label for="userPhone">인증번호 입력</label>
			<input type="text" />
		</form>
	</c:when>
	<c:otherwise>
		<script>
			alert("존재하지 않는 아이디 입니다.");
			location.href="findpwd_form.do";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>