
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${stylesRoot }/common.css"/>

<div class="header">
	<div class="header-inner">
		<img class="logo" src="${imagesRoot }/yc-logo.png" />
		<p class="system">后台系统管理</p>
		<div class="headerRight">
			<div class="user">
				<span style=" color: #999999;">${session_user.account}</span>	
			</div>
			<div class="line"></div>
			<div class="close-ico">
				<div class="hover">
					<h3 class="xgmm">修改信息</h3>
					<h3 onclick="logout();" class="tcxt">退出系统</h3>
				</div>
			</div>
		</div>
		<div id="dialog-two">
			<div class="dialog-header">
				<input type="hidden" value="${session_user.passWord }" id="session_userpassword"/>
				<span class="admin-wz">${session_user.account}</span>
				<span class="two-closed" id="closed"><a href="#"><img src="${imagesRoot }/close_06.png"/></a></span>
			</div>
			<ul style="list-style:none;" >
				<li><input id="yuanmima" maxlength="15"  type="password" placeholder="原密码" /></li>
				<li><input id="pass1" maxlength="15"  type="password" placeholder="密码" /></li>
	           <li><input id="pass2" maxlength="15"  type="password" placeholder="确认密码" /></li>
	           <li><input placeholder="手机号码" class="qrmm" type="text" name="" maxlength="11" id="tel" value="${session_user.desc1}" /></li>			
        	</ul>
        	<div class="two-tg-box">
        		<span id="message55" style="color: red;margin-left:40px;"></span>
				<div class="two-box-footer">
					<input class="submit" type="submit" onclick="updatemyUser()" value="提交" />
					<input class="no-pass" onclick="closer()" type="button"  value="取消" />
				</div>
			</div>
        </div>
	</div>
</div>
<div id="fullbg-two"></div>
<div id="keep-success"></div>
<div id="keep-fail"></div>

	<!--header end-->
<script type="text/javascript" src="${scriptsRoot }/lib/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${scriptsRoot }/commonUtil.js"></script>
<script type="text/javascript" src="${scriptsRoot}/util.js"></script>
<script src="${scriptsRoot}/lib/jquery.alert.js" type="text/javascript"></script>
<script type="text/javascript">
	var CONTEXTPATH="${contextPath}";
	var contextPath="${contextPath}";
	var currentUser={
			id:"1",
	        username:"zhangwei",
	        name:"zhangwei"
		};
	var _cookid = '<%=request.getSession().getId()%>';
	var scriptsRoot="${scriptsRoot}";
	var stylesRoot="${stylesRoot}";
	var imagesRoot="${imagesRoot}";
	var account="${session_user.account}";
	var userType="${session_user.userType}";
	var nginxRoot="${nginxRoot }";
	var RexStr = /\<|\>|\&/g;
	function logout(){
		if(window.confirm('是否退出后台管理系统?')){
			window.location.href=CONTEXTPATH+"/user/loginOff";
		}
	}
	
	/**
		验证特殊字符
	**/
	function checkSc(){
			var title=$(".title-box input").val();
			if(RexStr.test(title)){
				alert("不允许输入<>等字符!");
				$(".title-box input").focus();
				return true;
			}else{
				return false;
			}
		}
	
	
	$(function(){
		$(".top img").hover(
			function(){
				$(this).attr("src",imagesRoot+"/return.png");
			},
			function(){
				$(this).attr("src",imagesRoot+"/jt.png");
			}
			);
		$(".top img").click(function(){
			history.go(-1);
		});
		
		//弹出保存成功  图片消失后跳转传入的方法
		 $.afteSuccess = function (settings) {
			 $("#keep-success").fadeIn();
			 setTimeout(
					 function () {
						 $("#keep-success").fadeOut();
						 if ($.isFunction(settings.okCallback)) {
	             				settings.okCallback.call(this);
             				}
					 },1500);
         }
	});
	 $(document).ready(function() { 

	      var rheight=$(".content").height(); 

	      $(".menu").css("height",rheight+"px"); 

	});
	
	$(".xgmm").click(function(){
		
		$("#dialog-two").show()
		var bh = $("html").height();
		var bw = $("html").width();
		$("#fullbg-two").css({
		height:bh,
		width:bw,
		display:"block"
			});
		});
	$(".two-closed").click(function(){
		$("#dialog-two,#fullbg-two").hide();
		$(".hover").hide();
	});
	$(".close-ico").mouseover(function(){
		$(".hover").show();
	}).mouseout(function(){
		$(".hover").hide()
	});
	
	
	
	//MD5 js加密 方法，调用 hex_md5()即可进行加密
		var hexcase = 0;
		function hex_md5(a) {
			if (a == "")
				return a;
			return rstr2hex(rstr_md5(str2rstr_utf8(a)))
		}
		function hex_hmac_md5(a, b) {
			return rstr2hex(rstr_hmac_md5(str2rstr_utf8(a), str2rstr_utf8(b)))
		}
		function md5_vm_test() {
			return hex_md5("abc").toLowerCase() == "900150983cd24fb0d6963f7d28e17f72"
		}
		function rstr_md5(a) {
			return binl2rstr(binl_md5(rstr2binl(a), a.length * 8))
		}
		function rstr_hmac_md5(c, f) {
			var e = rstr2binl(c);
			if (e.length > 16) {
				e = binl_md5(e, c.length * 8)
			}
			var a = Array(16), d = Array(16);
			for ( var b = 0; b < 16; b++) {
				a[b] = e[b] ^ 909522486;
				d[b] = e[b] ^ 1549556828
			}
			var g = binl_md5(a.concat(rstr2binl(f)), 512 + f.length * 8);
			return binl2rstr(binl_md5(d.concat(g), 512 + 128))
		}
		function rstr2hex(c) {
			try {
				hexcase
			} catch (g) {
				hexcase = 0
			}
			var f = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
			var b = "";
			var a;
			for ( var d = 0; d < c.length; d++) {
				a = c.charCodeAt(d);
				b += f.charAt((a >>> 4) & 15) + f.charAt(a & 15)
			}
			return b
		}
		function str2rstr_utf8(c) {
			var b = "";
			var d = -1;
			var a, e;
			while (++d < c.length) {
				a = c.charCodeAt(d);
				e = d + 1 < c.length ? c.charCodeAt(d + 1) : 0;
				if (55296 <= a && a <= 56319 && 56320 <= e && e <= 57343) {
					a = 65536 + ((a & 1023) << 10) + (e & 1023);
					d++
				}
				if (a <= 127) {
					b += String.fromCharCode(a)
				} else {
					if (a <= 2047) {
						b += String
								.fromCharCode(192 | ((a >>> 6) & 31), 128 | (a & 63))
					} else {
						if (a <= 65535) {
							b += String.fromCharCode(224 | ((a >>> 12) & 15),
									128 | ((a >>> 6) & 63), 128 | (a & 63))
						} else {
							if (a <= 2097151) {
								b += String.fromCharCode(240 | ((a >>> 18) & 7),
										128 | ((a >>> 12) & 63),
										128 | ((a >>> 6) & 63), 128 | (a & 63))
							}
						}
					}
				}
			}
			return b
		}
		function rstr2binl(b) {
			var a = Array(b.length >> 2);
			for ( var c = 0; c < a.length; c++) {
				a[c] = 0
			}
			for ( var c = 0; c < b.length * 8; c += 8) {
				a[c >> 5] |= (b.charCodeAt(c / 8) & 255) << (c % 32)
			}
			return a
		}
		function binl2rstr(b) {
			var a = "";
			for ( var c = 0; c < b.length * 32; c += 8) {
				a += String.fromCharCode((b[c >> 5] >>> (c % 32)) & 255)
			}
			return a
		}
		function binl_md5(p, k) {
			p[k >> 5] |= 128 << ((k) % 32);
			p[(((k + 64) >>> 9) << 4) + 14] = k;
			var o = 1732584193;
			var n = -271733879;
			var m = -1732584194;
			var l = 271733878;
			for ( var g = 0; g < p.length; g += 16) {
				var j = o;
				var h = n;
				var f = m;
				var e = l;
				o = md5_ff(o, n, m, l, p[g + 0], 7, -680876936);
				l = md5_ff(l, o, n, m, p[g + 1], 12, -389564586);
				m = md5_ff(m, l, o, n, p[g + 2], 17, 606105819);
				n = md5_ff(n, m, l, o, p[g + 3], 22, -1044525330);
				o = md5_ff(o, n, m, l, p[g + 4], 7, -176418897);
				l = md5_ff(l, o, n, m, p[g + 5], 12, 1200080426);
				m = md5_ff(m, l, o, n, p[g + 6], 17, -1473231341);
				n = md5_ff(n, m, l, o, p[g + 7], 22, -45705983);
				o = md5_ff(o, n, m, l, p[g + 8], 7, 1770035416);
				l = md5_ff(l, o, n, m, p[g + 9], 12, -1958414417);
				m = md5_ff(m, l, o, n, p[g + 10], 17, -42063);
				n = md5_ff(n, m, l, o, p[g + 11], 22, -1990404162);
				o = md5_ff(o, n, m, l, p[g + 12], 7, 1804603682);
				l = md5_ff(l, o, n, m, p[g + 13], 12, -40341101);
				m = md5_ff(m, l, o, n, p[g + 14], 17, -1502002290);
				n = md5_ff(n, m, l, o, p[g + 15], 22, 1236535329);
				o = md5_gg(o, n, m, l, p[g + 1], 5, -165796510);
				l = md5_gg(l, o, n, m, p[g + 6], 9, -1069501632);
				m = md5_gg(m, l, o, n, p[g + 11], 14, 643717713);
				n = md5_gg(n, m, l, o, p[g + 0], 20, -373897302);
				o = md5_gg(o, n, m, l, p[g + 5], 5, -701558691);
				l = md5_gg(l, o, n, m, p[g + 10], 9, 38016083);
				m = md5_gg(m, l, o, n, p[g + 15], 14, -660478335);
				n = md5_gg(n, m, l, o, p[g + 4], 20, -405537848);
				o = md5_gg(o, n, m, l, p[g + 9], 5, 568446438);
				l = md5_gg(l, o, n, m, p[g + 14], 9, -1019803690);
				m = md5_gg(m, l, o, n, p[g + 3], 14, -187363961);
				n = md5_gg(n, m, l, o, p[g + 8], 20, 1163531501);
				o = md5_gg(o, n, m, l, p[g + 13], 5, -1444681467);
				l = md5_gg(l, o, n, m, p[g + 2], 9, -51403784);
				m = md5_gg(m, l, o, n, p[g + 7], 14, 1735328473);
				n = md5_gg(n, m, l, o, p[g + 12], 20, -1926607734);
				o = md5_hh(o, n, m, l, p[g + 5], 4, -378558);
				l = md5_hh(l, o, n, m, p[g + 8], 11, -2022574463);
				m = md5_hh(m, l, o, n, p[g + 11], 16, 1839030562);
				n = md5_hh(n, m, l, o, p[g + 14], 23, -35309556);
				o = md5_hh(o, n, m, l, p[g + 1], 4, -1530992060);
				l = md5_hh(l, o, n, m, p[g + 4], 11, 1272893353);
				m = md5_hh(m, l, o, n, p[g + 7], 16, -155497632);
				n = md5_hh(n, m, l, o, p[g + 10], 23, -1094730640);
				o = md5_hh(o, n, m, l, p[g + 13], 4, 681279174);
				l = md5_hh(l, o, n, m, p[g + 0], 11, -358537222);
				m = md5_hh(m, l, o, n, p[g + 3], 16, -722521979);
				n = md5_hh(n, m, l, o, p[g + 6], 23, 76029189);
				o = md5_hh(o, n, m, l, p[g + 9], 4, -640364487);
				l = md5_hh(l, o, n, m, p[g + 12], 11, -421815835);
				m = md5_hh(m, l, o, n, p[g + 15], 16, 530742520);
				n = md5_hh(n, m, l, o, p[g + 2], 23, -995338651);
				o = md5_ii(o, n, m, l, p[g + 0], 6, -198630844);
				l = md5_ii(l, o, n, m, p[g + 7], 10, 1126891415);
				m = md5_ii(m, l, o, n, p[g + 14], 15, -1416354905);
				n = md5_ii(n, m, l, o, p[g + 5], 21, -57434055);
				o = md5_ii(o, n, m, l, p[g + 12], 6, 1700485571);
				l = md5_ii(l, o, n, m, p[g + 3], 10, -1894986606);
				m = md5_ii(m, l, o, n, p[g + 10], 15, -1051523);
				n = md5_ii(n, m, l, o, p[g + 1], 21, -2054922799);
				o = md5_ii(o, n, m, l, p[g + 8], 6, 1873313359);
				l = md5_ii(l, o, n, m, p[g + 15], 10, -30611744);
				m = md5_ii(m, l, o, n, p[g + 6], 15, -1560198380);
				n = md5_ii(n, m, l, o, p[g + 13], 21, 1309151649);
				o = md5_ii(o, n, m, l, p[g + 4], 6, -145523070);
				l = md5_ii(l, o, n, m, p[g + 11], 10, -1120210379);
				m = md5_ii(m, l, o, n, p[g + 2], 15, 718787259);
				n = md5_ii(n, m, l, o, p[g + 9], 21, -343485551);
				o = safe_add(o, j);
				n = safe_add(n, h);
				m = safe_add(m, f);
				l = safe_add(l, e)
			}
			return Array(o, n, m, l)
		}
		function md5_cmn(h, e, d, c, g, f) {
			return safe_add(bit_rol(safe_add(safe_add(e, h), safe_add(c, f)), g), d)
		}
		function md5_ff(g, f, k, j, e, i, h) {
			return md5_cmn((f & k) | ((~f) & j), g, f, e, i, h)
		}
		function md5_gg(g, f, k, j, e, i, h) {
			return md5_cmn((f & j) | (k & (~j)), g, f, e, i, h)
		}
		function md5_hh(g, f, k, j, e, i, h) {
			return md5_cmn(f ^ k ^ j, g, f, e, i, h)
		}
		function md5_ii(g, f, k, j, e, i, h) {
			return md5_cmn(k ^ (f | (~j)), g, f, e, i, h)
		}
		function safe_add(a, d) {
			var c = (a & 65535) + (d & 65535);
			var b = (a >> 16) + (d >> 16) + (c >> 16);
			return (b << 16) | (c & 65535)
		}
		function bit_rol(a, b) {
			return (a << b) | (a >>> (32 - b))
		};
	
	function closer(){
		$("#closed").click();
	}
	function updatemyUser(){
		var reg = /^[A-Za-z0-9]+$/;
		if ($.trim($("#yuanmima").val()) == "") {
			$("#message55").html("原密码不能为空,请输入...");
			return;
		}
		//alert($.trim($("#session_userpassword").val()));
		//alert(hex_md5($.trim($("#yuanmima").val())));
		if ($.trim($("#session_userpassword").val()) != hex_md5($.trim($("#yuanmima").val()))) {
			$("#message55").html("原密码输入错误，请重新输入...");
			document.getElementById('yuanmima').value = '';
			$("#yuanmima").focus();
			return;
		}
		if ($.trim($("#tel").val()) == "") {
				$("#message55").html("手机号码不能为空,请输入...");
				return;
		} else if(!/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/i.test($.trim($("#tel").val()))){
		  		$("#message55").html("密码只能是数字或字母,请重新输入...");
				return;
		}
		if ($.trim($("#pass1").val()) != "" || $.trim($("#pass2").val()) != "") {
			if ($.trim($("#pass1").val()) == "") {
				$("#message55").html("密码不能为空,请输入...");
				return;
			} else if (!reg.test($("#pass1").val())) {
				$("#message55").html("密码只能是数字或字母,请重新输入...");
				return;
			} else if ($.trim($("#pass1").val()).length <3) {
				$("#message55").html("密码长度少于3位,请重新输入...");
				return;
			} else if ($.trim($("#pass1").val()).length > 12) {
				$("#message55").html("密码长度大于12位,请重新输入...");
				return;
			}
			if ($.trim($("#pass2").val()) == "") {
				$("#message55").html("确认密码不能为空,请输入...");
				return;
			} else if (!reg.test($("#pass2").val())) {
				$("#message55").html("确认密码只能是数字,请重新输入...");
				return;
			}
			if ($.trim($("#pass1").val()) != $.trim($("#pass2").val())) {
				$("#message55").html("密码和确认密码不一致，请重新输入...");
				return;
			}
		}
	
		var queryCond = {
			passWord : $.trim($("#pass1").val()),
			tel:$.trim($("#tel").val())
		};
		$.ajax( {
			type : "get",
			url : '${pageContext.request.contextPath}/user/updatemyUser',
			cache : false,
			data : queryCond,
			beforeSend : function() {
				 $("#message55").html("正在修改，请稍候...");
				 return true;
			},
		success : function() {
			alert("信息修改成功");
			$("#message55").html("修改信息成功...");
			$("#closed").click();
		},
		error : function() {
			$("#message55").html("修改信息失败...");
		}
		});
	}
</script>