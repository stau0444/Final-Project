var searchPostCode=function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	document.getElementById("addr").value = data.address;
	        	document.getElementById("p_code").value =data.zonecode;
	        }
	    }).open();
	
	};
	var carApp=angular.module("carApp",[]);
	carApp.controller("loginCtrl",function($scope,$http){
		$scope.isExist=true;
		$scope.checkId=function(){	
				$http({
					url:'/mycar/member/verified/checkid.do',
					method:'post',
					params:{user_id:$scope.inputId},
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					if(data.isExist){
						console.log(data);
						alert("이미 존재하는 아이디입니다");
					}else{
						alert("사용가능한 아이디입니다");
						$scope.isExist=false;
					}
				});
			
		};
		$scope.addUser=function(){
			if($scope.isExist){
				 alert("아이디 중복 확인을 해주세요")
			}else if($scope.inputPwd!=$scope.checkpwd){
				alert("입력한 비밀번호가 다릅니다 확인 후 다시 시도해주세요");
			}else{
				$scope.inputAddr=document.getElementById("addr").value;
				$scope.inputPCode=document.getElementById("p_code").value;
				
						$http({
							url:'sign_up.do',
							method:'post',
							params:{user_id:$scope.inputId ,
									user_pwd:$scope.inputPwd,
									user_name:$scope.inputName , 
									user_phone:$scope.inputPhone , 
									user_addr:$scope.inputAddr+$scope.addrDetail , 
									user_p_code:$scope.inputPCode , 
									user_sort:$scope.inputSort},
							headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
						}).success(function(data){
								location.replace("/mycar/member/verified/signup_success.do");								
							
						});
					};
			};
	});