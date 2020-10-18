<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="width:475px;">
		<h2>회원 정보 수정 폼</h2>
			<form method="post"  name="signUpForm" class="border-success">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" id="name"  name="user_name" class="form-control"
						data-ng-required="true"
						data-ng-model="user_name" disabled/>
				</div>			
				<div class="form-group d-inline">
					<label for="id">아이디</label>
					<div class="input-group">
						<input type="text" value="{{user_name}}" id="id"  name="user_id"  class="form-control mr-2 "
							data-ng-model="user_id"
							data-ng-required="true"
							data-ng-pattern="/^[a-zA-Z0-9]{8,15}$/"
							placeholder="영문 또는 숫자   8~15글자를 입력해주세요" disabled/>
					</div>
				</div>
				<div class="form-group">
					<label for="p_code">우편번호</label>
					<div class="input-group mb-3">
						<input type="text" id="p_code"  name="user_p_code" class="form-control" data-ng-model="user_info.user_p_code"/>
					  <div class="input-group-append">
						<button onClick="searchPostCode()" class="btn btn-primary">우편번호 찾기</button>
					  </div>
					</div>
				</div>
				<div class="form-group">
					<label for="addr">주소</label>
					<input type="text" id="addr"  name="user_addr" class="form-control"
						data-ng-model="user_info.user_addr"/>
				</div>
				<div class="form-group">
					<label for="phone">전화번호</label>
					<input type="text" id="phone"  name="user_phone" class="form-control"
						data-ng-required="true"
						data-ng-model="user_phone"
						data-ng-pattern="/^[0-9]{11,11}$/"
						placeholder="( - ) 없이 입력해 주세요"/>
				</div>
				<div>
					<label for="sort">판매자로 등록</label>
					<input type="checkbox" id="sort" name="user_sort" data-ng-model="isDealer"/>
				</div>
				<div>
					<button class=" btn btn-outline-success float-right"
							data-ng-click="updateUserInfo()" 
							>등록</button>
				</div>
			</form>
		</div>
</body>
</html>