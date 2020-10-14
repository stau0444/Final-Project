<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" data-ng-controller="dataCtrl">

	<form action="answer.do" method="post">
		<input type="hidden" name="iq_num" value="{{data.iq_num}}" />
		<div class="form-group">
			<label for="writer">문의자</label> <input class="form-control"
				type="text" name="user_id" value="{{data.user_id }}" readonly />
		</div>
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" type="text"
				name="iq_title" id="title" value="{{data.iq_title}}" readonly/>
		</div>

		<div class="form-group">
			<label for="user_email">문의자 이메일</label> <input type="text"
				class="form-control" name="iq_email" id="user_email" value="{{data.iq_email}}" readonly>
			</textarea>
		</div>

		<div class="form-group">
			<label for="content">내용</label>
			<input class="form-control" name="iq_content" id="content" value={{data.iq_content}} readonly>
		</div>

		<div class="form-group">
			<label for="content_a">답변</label>
			<textarea class="form-control" name="iq_content_a" id="content_a" cols="30"
				rows="10"></textarea>
		</div>
		<button class="btn btn-outline-primary" type="submit">답변하기</button>
		<button class="btn btn-outline-warning" type="reset">취소</button>
	</form>
</div>
