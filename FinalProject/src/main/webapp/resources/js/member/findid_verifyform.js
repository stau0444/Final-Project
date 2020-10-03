var verificationApp=angular.module("verificationApp",[])
	verificationApp.controller("verificationCtrl",function($scope,$http){
		$scope.isSentVCode=false;
		$scope.sendCode=function(){
			$http({
				url:"findid_sendSMS.do",
				method:"post",
				params:{userPhone:$scope.userPhone},
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				console.log(data);
				alert("인증 번호를 보냈습니다.");
				$scope.isSentVCode=true;
			});
		}
		$scope.checkCode=function(){
			$http({
				url:"findid_verify.do",
				method:"post",
				params:{userPhone:$scope.userPhone,verificationCode:$scope.VCode}
			}).success(function(data){
				if(data.isValid){
					alert("인증 되었습니다!")	
					location.replace("/mycar/member/verified/findid_form.do?userPhone="+data.userPhone);
				}else{
					alert("인증에 실패했습니다. 다시시도 해주세요!");
				}
				console.log(data);
			})
		}
	})