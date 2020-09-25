<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
<script>
	if(${isSuccess}){
		alert("회원가입에 성공했습니다.");
		location.replace("/mycar/index.do");
	}else{
		alert("회원가입에 실패했습니다 다시 시도해 주세요");
		location.replace("signup_form.do");
	}
</script>
</html>