<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${stylesRoot }/template.css"/>

<div class="menu">
	<input type="hidden" id="menuId" value="${menuId }">
				<div class="gn-box">
					<img src="${imagesRoot }/function.png" class="pic-function" />
					<p class="function">功能</p>
				</div>
				<div class="subNavBox" class="list">
					<ul id="menuList">
					</ul>
				</div>
			</div>
<%@include file="footer.jsp" %>
<script type="text/javascript"  src="${scriptsRoot }/template.js"></script>
<script type="text/javascript">
		$(function(){
			$.ajax( {    
			    url:'${contextPath }/mainMenu/queryMainMenu.json',// 跳转到 action    
			    type:'post',    
			    cache:false,    
			    success:function(data) {    
			    	var menuId=$("#menuId").val();
			    	var str="";
			    	$.each(data.menuList,function(i,menu){
			    		if(menu.afterNodeName != ""){
		    				if(menu.desc1=='yes'){
		    					str=str+"<div id='fmenu"+menu.id+"' class='subNav'><a href='#'>"+menu.afterNodeName+"</a></div>";
		    				}else{
		    					str=str+"<div id='fmenu"+menu.id+"' class='subNav'><a href='${contextPath}"+menu.afterUrl+menu.id+"'>"+menu.afterNodeName+"</a></div>";
		    				}	
			    			if(menu.desc1=='yes'){
			    				str=str+"<ul class='navContent'>";
			    				$.each(menu.nodesList,function(i,secondMenu){
			    					str=str+"<li><a id='smenu"+secondMenu.id+"' href='${contextPath}"+secondMenu.afterUrl+secondMenu.id+"'>"+secondMenu.afterNodeName+"</a></li>";
			    				});
			    				str=str+"</ul>";
			    			}
			    		}
			    	});
			    	$("#menuList").append(str);
			    	$(".subNav").click(function(){
						if($(this).children().attr("href")!='#'){
							window.location.href=$(this).children().attr("href");
						}
			    		$(this).css({"background-color":"#6fbee8","color":"#fff"}).siblings(".subNav").css({"background-color":"#FFFFFF","color":"#555"});
						$(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd");
						$(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt");
						
						// 修改数字控制速度， slideUp(500)控制卷起速度
						$(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
					});
					$(".navContent li a").click(function(){
						$(".navContent li a").css("background","none");
						$(this).css("background","url("+scriptsRoot+"/triangle.png) 30% center no-repeat");
					});	     
					var thisMenuId=$("#menuId").val();
					//初始化菜单
					if(typeof($("#fmenu"+thisMenuId+"").attr("id"))!='undefined'){
						$("#fmenu"+thisMenuId+"").addClass("currentDd").addClass("currentDt");
						$("#fmenu"+thisMenuId+"").css({"background-color":"#6fbee8","color":"#fff"}).siblings(".subNav").css({"background-color":"#FFFFFF","color":"#555"});
					}else{
						$("#smenu"+thisMenuId+"").css("background","url("+imagesRoot+"/triangle.png) 30% center no-repeat");
						$("#smenu"+thisMenuId+"").parent().parent().prev().addClass("currentDd").addClass("currentDt");
						$("#smenu"+thisMenuId+"").parent().parent().prev().css({"background-color":"#6fbee8","color":"#fff"}).siblings(".subNav").css({"background-color":"#FFFFFF","color":"#555"});
						$("#smenu"+thisMenuId+"").parent().parent().slideDown(0);
					}
					
					},    
			});  
		});
	</script>