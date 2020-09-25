<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test12.html</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>뉴스리스트</h1>
		<a href="news_form.do" class="float-right">뉴스등록</a>
		<table class="table table-light">
			<thead class="table-dark">
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>전기차 수출 증가</td>
					<td>2020-09-24</td>
					<td><a href="#">삭제</a></td>
					<td><a href="#">수정</a></td>
				</tr>
			</tbody>
		</table>
	</div>	
	
</body>	
</html>	
