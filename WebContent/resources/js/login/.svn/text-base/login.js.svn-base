$(function(){
		$("#login").click(function() {
			$.ajax({
				url:CONTEXTPATH+'/user/loginin',
				data:{"account":$("#loginAcct").val(),"passWord":$("#password").val(),"pass":$("#pass").val()},
				type:"post",
				beforeSend: function() {
				$("#message").html("正在登录后台管理系统，请稍后...");
					return true;
				},
				success: function(retVal) {
					if (retVal.success) {
						$("#message").html("正在转向后台管理系统主控页面...");
							//window.location=CONTEXTPATH+"/newsAdmin?menuId=26";
						window.location="https://www.baidu.com/";
					}else {
						$("#message").html(retVal.error);
					}
				}
			});
		});
	})
    function keyLogin(){
  		if (event.keyCode==13){//回车键的键值为13
  			document.getElementById("login").click();  //调用登录按钮的登录事件
  		}   
	}
	
	function getValCode(){
		var userName=$("#loginAcct").val();
		if(userName==""){
			alert("请输入用户名!");
			return;
		}
		$.ajax( {    
		    url:CONTEXTPATH+'/user/getValCode.json',// 跳转到 action    
		    data:{    
		    		 userName:userName,
		    },    
		    type:'post',    
		    cache:false,    
		    success:function(json){
		    	if(json.errorCode==0){
		    		if(json.isDev==1){
		    			alert("发送成功,稍后会将验证码发送到您登陆账号绑定的手机上，请及时查看!"+json.msg);
		    		}else{
		    			alert("发送成功,稍后会将验证码发送到您登陆账号绑定的手机上，请及时查看!");
		    		}
		    		//alert("发送成功,稍后会将验证码发送到您登陆账号绑定的手机上，请及时查看!");
		    	}else if(json.errorCode==1){
		    		alert("无此用户，请重新输入!");
		    	}else if(json.errorCode==2){
		    		alert("该用户无手机号，请联系超级管理员添加!");
		    	}else if(json.errorCode==4){
		    		alert("用户频繁获取验证码，被判定为恶意攻击并列入黑名单，30分钟内禁止获取验证码，如继续操作则进行封IP处理！");
		    	}else if(json.errorCode==5){
		    		alert("一分钟内仅允许一次获取验证码！请您稍后再试");
		    	}
		    }
		});  
	}