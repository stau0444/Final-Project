<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" data-ng-controller="ipCtrl">
	<table class="table" id="ipList">
		<thead>
			<tr>
				<th scope="col">등록된 ip</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="tmp in list">
				<td>{{tmp}}</td>
				<td><button class="btn btn-danger" ng-click="deleteIp(tmp)">삭제</button></td>
			</tr>
		</tbody>
	</table>

	<form>
		<div class="form-group float-right">
			<input type="text" name="ip" placeholder="ip입력"
				data-ng-model="inputIp" />
			<button data-ng-click="addIp()" class="btn btn-primary">등록</button>
		</div>

	</form>
</div>