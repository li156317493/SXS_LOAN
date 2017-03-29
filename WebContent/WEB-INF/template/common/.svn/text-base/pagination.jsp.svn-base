<%@ page language="java" contentType="text/html;  charset=utf-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function tiaozhuan() {
		
		if($("#goPage").val() >= 1 && $("#goPage").val() <= parseInt($("#totalPages").text())){
			displayData($('#goPage').val()-1);return false;
		}else {
			alert("请输入正确的页码 范围为：1-  "+$("#totalPages").text());
			return false;
		}
		
	}
</script>
<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" class="page_table">
  <tr>
    <td width="100" class="font_left">数据:<span id="totalRecords" style="color: red;"></span>条</td>
    <td width="200" class="font_left">
    	到第
       <input id="pageSize" type="hidden" value="${initParam.pageSize}" />
      <input id="totalPages" type="hidden"/>
       <input id="goPage" type="text" maxlength="3" size="3" />
       	页
      <input style="width:40px;height:23px; color:#999;border-radius:2px;border: 1px solid #E4E4E4;background-color:#fff;"  type="button" 	  name="RedImg" value="确定" onclick="tiaozhuan()" />
      
      </td>
      
     <td  align="center";height="10" class="font_right">
     	<div id="pagination"></div>
     		
      </td>
      
  </tr>
</table>