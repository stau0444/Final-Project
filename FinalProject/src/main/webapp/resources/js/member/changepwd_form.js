var changePwdApp=angular.module("changePwdApp",[]);
	changePwdApp.controller("changePwdCtrl",function($scope,$http,$location){
		function searchParam(key) {
			  return new URLSearchParams(location.search).get(key);
		};
		$scope.user_id=searchParam('userid');
		console.log($scope.user_id);
		$scope.changePwd=function(){
			if($scope.user_pwd!=$scope.check_pwd){
				alert("입력한 비밀번호가 다릅니다 다시 시도해주세요");
			}else{
				$http({
					url:'changePwd.do',
					method:'post',
					params:{user_id:$scope.user_id,user_pwd:$scope.user_pwd},
					header:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					if(data.isChanged){
						alert("비밀번호가 변경되었습니다");
						window.close();
					}else{
						alert("비밀번호 변경에 실패했습니다.");
					}
				});
			};
		};
	});