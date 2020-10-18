<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr />
<h3 class="text-info my-4 text-center"> 회원정보수정</h3>
<hr />	
	<div class="row my-5" >
		<!-- 회원정보 링크-->
		<div class="col-md-6">
			<div class="jumbotron text-center">
			  <h4>회원정보수정</h4>
			  <p class="lead">회원 정보 수정을 원하십니까?</p>
			  <hr class="my-4">
			  <p class="lead">
			    <a class="btn btn-primary btn-lg" href="#/update_form" role="button">수정</a>
			  </p>
			</div>
		</div>
		<div class="col-md-6">
			<div class="jumbotron text-center ">
			  <h4>회원탈퇴</h4>
			  <p class="lead">회원 탈퇴를  원하십니까?</p>
			  <hr class="my-4">
			  <p class="lead">
			    <a class="btn btn-primary btn-lg" data-ng-click="deleteIdPopUp()" role="button">탈퇴</a>
			  </p>
			</div>
		</div>
	</div>