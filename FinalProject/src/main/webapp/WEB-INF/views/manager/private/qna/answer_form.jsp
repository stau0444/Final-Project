<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">

	<form action="insert.do" method="post">
		<div class="form-group">
			<label for="writer">문의자</label> <input class="form-control"
				type="text" value="${id }" disabled />
		</div>
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" type="text"
				name="title" id="title" />
		</div>

		<div class="form-group">
			<label for="admin_email">작성자 이메일</label> <input type="text"
				class="form-control" id="admin_email">
			</textarea>
		</div>

		<div class="form-group">
			<label for="user_email">문의자 이메일</label> <input type="text"
				class="form-control" id="user_email">
			</textarea>
		</div>

		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30"
				rows="10"></textarea>
		</div>
		<button class="btn btn-outline-primary" type="submit"
			onclick="submitContents(this);">답변하기</button>
		<button class="btn btn-outline-warning" type="reset">취소</button>
	</form>
</div>
