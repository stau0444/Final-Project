var invalitateApp = angular.module("invalitateApp",[]);
	invalitateApp.controller("invalitateCtrl",function($http){
		console.log("구동됨");
		$http({
			url:"invalidateSession.do",
			method:'post',
			headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
		}).success(function(){
			console.log("세션삭제됨");
		});
	});