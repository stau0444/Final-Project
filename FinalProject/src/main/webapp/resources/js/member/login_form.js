var loginApp=angular.module("loginApp",[])
	//아이디 비밀번호 찾기 팝업 제어하는 컨트롤러
	loginApp.controller('findIdPwdCtrl', function ($scope, $window) {
            $scope.findIdPopUp = function () {
                var $popup = $window.open("findid_verifyform.do", "popup", "width=450,height=600,left=200,top=100");
                $popup.Name = $scope.Name;
            };
            $scope.findPwdPopUp = function () {
                var $popup = $window.open("findpwd_form.do", "popup", "width=450,height=600,left=200,top=100");
                $popup.Name = $scope.Name;
            };
        });
	//로그인  폼을 제어하는 컨트롤러
	loginApp.controller("loginCtrl",function($scope,$http){
			$scope.isLogined=false;
			$scope.login=function(){
				if($scope.userId==null){
					alert("아이디를 입력해주세요");
				}else if($scope.userPwd==null){
					alert("비밀번호를 입력해주세요");
				}else{
					$http({
						url:'private/login.do',
						method:'post',
						params:{
							user_id:$scope.userId,
							user_pwd:$scope.userPwd
							},
						headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},
					}).success(function(data){
							console.log(data)
							if(data.isValid){
								alert("로그인 되었습니다");
								location.replace("/mycar/index.do");						
							}else{
								alert("아이디 혹은 비밀번호가 다릅니다 다시 시도해주세요")
							}
					});
			};
		};
	});