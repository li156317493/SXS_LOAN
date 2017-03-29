<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${stylesRoot }/login.css"/>
	</head>
	<body onkeydown="keyLogin();">

	<div class="wrapper">
		<div class="main">
			<div class="main-inner">
				<div class="login-box">
					<ul class="box">
						<li class="user">用户登录</li>
						<li class="account"> <input  type="text" value="" class="number" maxlength="12" id="loginAcct" placeholder="账号:" /></li>
						<li class="password"><input class="pass" value="" type="password" id="password"  maxlength="12"  placeholder="密码:"/></li>
						<li><input id="pass" class="attestation" maxlength="40" type="text" placeholder="验证码1:"/><a href="#" onclick="javascript:getValCode();" class="dx_yzm">发送短信验证码</a></li>
						<li></li>
						<li class="error" id="message"></li>
						<li class="li-login"><input class="btn-login" type="button" id="login"  value="登录1" /></li>
					</ul>
				</div>
			</div>
		</div>	
	</div>	
<%@include file="common/footer.jsp" %>
<script type="text/javascript" src="${scriptsRoot }/lib/jquery-1.11.1.js"></script>
<script type="text/javascript">
	var CONTEXTPATH="${contextPath}";
</script>
<script type="text/javascript" src="${scriptsRoot }/login/login.js" ></script>
</body>
</html>
