<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" data-ng-controller="ipCtrl">
	<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">등록된 ip</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>11.11.11.11<a href="" class="float-right">삭제</a></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>22.22.22.22<a href="" class="float-right">삭제</a></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>33.33.33.33<a href="" class="float-right">삭제</a></td>
     
    </tr>
    <tr>
      <th scope="row">4</th>
      <td>44.44.44.44<a href="" class="float-right">삭제</a></td>
    </tr>
    <tr>
      <th scope="row">5</th>
      <td>55.55.55.55<a href="" class="float-right">삭제</a></td>
    </tr>
  </tbody>
</table>
	
	<form>
		<div class="form-group float-right">
			<input type="text" name="ip" placeholder="ip입력" data-ng-model="inputIp"/>
			<button data-ng-click="addIp()" class="btn btn-primary">등록</button>
		</div>
		
	</form>
</div>