<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>巡检中心分配小组2</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/main.css">

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
		<tr>
			<td width="2%" align="center">
			</td>
			<td width="98%">
				<span class="sys_list_yh">巡检中心&gt;&gt;分配小组</span>
			</td>
		</tr>
	</table>
	<br><br>
	  <form  method="post" action="../xj/xjupdategroup.do">
	   <input type="hidden"  name="po.repairid"  value="${repair.repairId }" >
	   <%--<input type="hidden"  name="pageinfo.curpage"  value="${pageinfo.curpage}" >
				    
	--%><table width="95%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
		
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备报修序列号</td><td>${repair.repairId }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">银行设备编号</td><td>${repair.equipmentEachId }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备种类名称</td><td>${repair.equipmentName }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备报修时间</td><td>${repair.repairDateStr }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">分配小组</td>
			<td>
				<%--<s:select name="po.piGroup.groupId"  list="#request.gzzs" listKey="groupId" listValue="groupName" theme="simple"></s:select>
			--%>
			<select name="group">
				<c:forEach items="${list}" var="group">
					<option value="${group.groupId }">${group.groupName }</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr align="center" > 
		  <td colspan="2" >
		   <input type="submit"  value="分配"  > 
			   <input type="button" value="取消" onclick="history.go(-1)">
		   </td>
		 
		</tr>
	</table>
	</form>
  </body>
</html>
