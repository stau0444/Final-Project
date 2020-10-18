<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr />
<h3 class="text-info my-4 text-center">회원정보</h3>
<hr />
<div class="row ">		
		<div class="container" style="width:475px;">
			<form class="border-success">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" id="name"  name="user_name" class="form-control" data-ng-model="user_name" disabled/>
				</div>			
				<div class="form-group d-inline">
					<label for="id">아이디</label>
					<div class="input-group">
						<input type="text" value="{{user_name}}" id="id"  name="user_id"  class="form-control mr-2 " data-ng-model="user_id" disabled/>
					</div>
				</div>
				<div class="form-group">
					<label for="p_code">우편번호</label>
					<div class="input-group mb-3">
						<input type="text" id="p_code"  name="user_p_code" class="form-control" data-ng-model="user_info.user_p_code" disabled/>
					</div>
				</div>
				<div class="form-group">
					<label for="addr">주소</label>
					<input type="text" id="addr"  name="user_addr" class="form-control"
						data-ng-model="user_info.user_addr" disabled/>
				</div>
				<div class="form-group">
					<label for="phone">전화번호</label>
					<input type="text" id="phone"  name="user_phone" class="form-control" data-ng-model="user_phone" disabled/>
				</div>
				<div class="form-group">
					<label for="sort">회원구분</label>
					<input type="text" id="sort" name="user_sort" class="form-control" data-ng-model="user_sort" disabled/>
				</div>
			</form>
		</div>
	</div>