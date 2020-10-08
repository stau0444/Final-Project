var verificationApp = angular.module("verificationApp", [])
	verificationApp.controller("verificationCtrl",function($scope, $http) {
			$scope.isSentVCode=false;
			$scope.isSentMail=false;
			$scope.sendEmailCode=function(){
				 $http({
					url:'sendMail.do',
					method:'post',
					params:{user_mail:$scope.userEmail},
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					alert("인증번호를 보냈습니다");
					$scope.isSentMail=true;
				});
			}	
			$scope.checkEmailCode=function(){
				$http({
					url:'checkVCode.do',
					method:'post',
					params:{
							userMail:$scope.userEmail,
							verificationCode:$scope.EmailVCode
							},
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					console.log(data);
					if (data.isValid) {
						alert("인증 되었습니다!")
						location.replace("/mycar/member/verified/identification.do")
					} else {
						alert("인증에 실패했습니다. 다시시도 해주세요!")
					}
				});
			}
			$scope.sendCode = function() {
				$http({
					url:'checkPhone.do',
					method:'post',
					params:{user_phone:$scope.userPhone},
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
						if(data.isExist){
							alert("해당 핸드폰번호로 등록된 아이디가 존재합니다.아이디 혹은 비밀번호를 찾아 로그인 해주세요");
							location.replace("/mycar/member/login_form.do")
						}else{
							$http({
								url : "sendSms.do",
								method : "post",
								params : {userPhone : $scope.userPhone},
								headers : {"Content-Type" : "application/x-www-form-urlencoded;charset=utf-8"}
							}).success(function(data) {
								console.log(data);
								alert("인증 번호를 보냈습니다.");
								$scope.isSentVCode=true;
							});
						};
					});
				};
				$scope.checkCode = function() {
					$http({
						url : "checkVCode.do",
						method : "post",
						params : {
						userPhone : $scope.userPhone,
						verificationCode : $scope.VCode
					}
				}).success(function(data) {
					if (data.isValid) {
						alert("인증 되었습니다!")
						location.replace("/mycar/member/verified/identification.do")
					} else {
						alert("인증에 실패했습니다. 다시시도 해주세요!")
					}
					console.log(data);
				});
			};
		});