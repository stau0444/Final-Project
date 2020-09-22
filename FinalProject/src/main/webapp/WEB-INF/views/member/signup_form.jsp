<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입폼</h2>
	<form action="sign_up.do" method="post">
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id"  name="user_id"/>
			<button>중복확인</button>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd"  name="user_pwd"/>
		</div>
		<div>
			<label for="checkpwd">비밀번호 확인</label>
			<input type="password" id="checkpwd"/>
		</div>
		<div>
			<label for="name">이름</label>
			<input type="text" id="name"  name="user_name"/>
		</div>
		<div>
			<label for="phone">전화번호</label>
			<input type="text" id="phone"  name="user_phone"/>
		</div>
		<div>
			<label for="addr">주소</label>
			<input type="text" id="addr"  name="user_addr"/>
		</div>
		<div>
			<label for="p_code">우편번호</label>
			<input type="text" id="p_code"  name="user_p_code"/>
		</div>
		<div>
			<label for="sort">판매자로 등록</label>
			<input type="checkbox" id="sort" name="user_sort"/>
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>