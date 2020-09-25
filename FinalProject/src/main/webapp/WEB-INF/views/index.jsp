<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.LoginInfo{
		border-radius:20px;
		border:3px solid YellowGreen;
		padding:3px;
	}
	.LoginInfo a{
		text-decoration: none;
		margin:20px;
	}
</style>
</head>
<body>
	<!--로그인 표시 -->
	<c:choose>
		<c:when test="${id ne null}">
		<c:choose>
			<c:when test="${isNLogin ne null}">
				<span class="LoginInfo">
					<span><strong>${id}</strong>님이 네이버로 로그인 되었습니다</span>
					<a href="member/logout.do">로그아웃</a>
				</span>
			</c:when>
			<c:otherwise>
				<span class="LoginInfo">
					<span><strong>${id}</strong>님 로그인 되었습니다</span>
					<a href="member/logout.do">로그아웃</a>
				</span>
			</c:otherwise>
		</c:choose>
		</c:when>
		<c:otherwise>
			<span class="LoginInfo">
				<a href="member/identification_form.do">회원가입</a>
				<a href="member/login_form.do">로그인</a>
			</span>
		</c:otherwise>
	</c:choose>
	<div style="margin-top:30px;"></div>
	<!-- 로그인표시끝 -->
	<!-- 각자 맡으실 페이지의 링크를  아래의 div에 적어두면 
	메인페이지 하시는분이 편하게할  수 있을거 같으니 본인의 링크는
	아래 div안에 작성해주세요 -->
	<div id="이상훈">
		<li><a href="review/list.do">리뷰 페이지 가기</a></li>
	</div>
	<div id="홍덕환">
		<a href="">ip등록</a>
		<a href="">관리자 로그인</a>
		<a href="manager/private/mypage.do">관리자 페이지</a>
	</div>
	<!-- 이 밑으로는 태희씨가 작업하시면 될 것 같아요 -->
	
	<h2>인덱스페이지입니다</h2>
	<p>모든 페이지는 여기서부터 시작합니다</p>
</body>
</html>