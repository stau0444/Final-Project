<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<div class="text-center">
			<h2 class=>1:1문의</h2>
			<p>고객님의 불편사항을 문의해주시면 성실하게 답변해드리겠습니다.</p>
		</div>

		<div class="card pt-5 pb-3">
			<form action = "ask.do">
				<div class="form-group row  text-center">
					<label for="id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="user_id" value=${id}>
					</div>
				</div>

				<div class="form-group row text-center">
					<label for="Email" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="iq_email" id="Email">
					</div>
				</div>

				<div class="form-group row text-center">
					<label for="title" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-8">
						<input type="text" name="iq_title" class="form-control" id="title">
					</div>
				</div>

				<div class="form-group text-center">
					<!-- Default inline 1-->
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input"
							id="site" name="iq_category"> <label
							class="custom-control-label" for="site">사이트 이용 문의</label>
					</div>

					<!-- Default inline 2-->
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input"
							id="site-error" name="iq_category"> <label
							class="custom-control-label" for="site-error">장애/오류 문의</label>
					</div>

					<!-- Default inline 3-->
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input"
							id="etc" name="iq_category"> <label
							class="custom-control-label" for="etc">기타 문의</label>
					</div>
				</div>

				<div class="form-group">
					<label for="iq_content" class="form-label">내용</label>
					<textarea name="iq_content" id="iq_content" rows="15" cols="150"></textarea>
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-outline-primary mr-4">접수</button>
					<button type="reset" class="btn btn-outline-danger ml-4">취소</button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>