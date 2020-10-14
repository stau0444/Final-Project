<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container" data-ng-controller="dataCtrl">

	<form id="frequently_form">
	
		<div class="form-group">
			<label for="category">카테고리</label>
			<select data-ng-model="category" id="category">
				<option value="1">사이트 이용 관련</option>
				<option value="2">장애/오류 관련</option>
				<option value="3">기타</option>
			</select>
		</div>
		<div class="form-group">
			<label for="question">질문</label>
			<input type="text" data-ng-model="question" id="question"/>
		</div>
		
		<div class="form-group">
			<label for="answer">답변</label>
			<input type="text" data-ng-model="answer" id="answer"/>
		</div>
		
		<button ng-click="QnaInsert()"></button>
	</form>
</div>