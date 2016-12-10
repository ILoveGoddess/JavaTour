<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>维修工新增问题类型</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
<script type="text/javascript">
    function ckick(){
       var wtlxs=document.getElementById("wtlxw");
       if(wtlxs.value==""){
         alert("问题类型名称");
         wtlxs.focus();
         return false;
       }
   }
   </script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
		<tr>
			<td width="2%" align="center">
			</td>
			<td width="98%">
				<span class="sys_list_yh">维修工&gt;&gt;新增问题类型</span>
			</td>
		</tr>
	</table>
	<br><br>
	  <form  method="post" action="../wxg/insertType.do"  onsubmit="return ckick();">

	   <input type="hidden"  name="po.repairid"  value="${repairId }" >
	   <%--<input type="hidden"  name="wtlx"  value="${param.wtlx }" >
	  
	   --%><table width="95%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
		
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">问题类型名称</td><td><input id="wtlxw" name="wtlxmc" size="20"></td>
		</tr>
		
		<tr align="center" > 
		  <td colspan="2"  >
		   <input type="submit"  value="新增"  > 
					      <input type="button" value="取消" onclick="history.go(-1)">
		   </td>
		 
		</tr>
	</table>
	</form>
  </body>
</html>
