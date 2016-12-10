<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>设备报修查看</title>

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
				<span class="sys_list_yh">设备报修&gt;&gt;查看明细</span>
			</td>
		</tr>
	</table>
	<br><br>
	<table table width="95%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备报修序列号</td><td>${view.repairId }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">银行设备编号</td><td>${view.equipmentEachId }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备种类名称</td><td>${view.equipmentName }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">登陆用户</td><td>
			<c:if test="${view.loginId != null}">
			${view.loginId }
			</c:if>
			</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">银行名称</td><td>${view.bankName }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">巡检组名称</td><td>
			<c:if test="${view.groupName != null}">
			${view.groupName }
			</c:if>
			</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备报修问题类型</td><td>
			<c:if test="${view.typeName != null}">
			${view.typeName }
			</c:if>
			</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备报修时间</td><td>${view.repairDateStr }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">报修记录状态</td><td> <c:if  test="${view.repairStatus==0}">处在报修</c:if>
										    <c:if  test="${view.repairStatus==1}">结束报修</c:if>
										    <c:if  test="${view.repairStatus==2}">正在申请</c:if>
										    <c:if  test="${view.repairStatus==3}">银行确认</c:if></td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">小组分配状态</td><td> <c:if  test="${view.allocateStatus==0}">未分配小组</c:if>
										    <c:if  test="${view.allocateStatus==1}">已分配小组</c:if></td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备维修结束时间</td><td>${view.repairEndDateStr }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备维修情况描述</td><td>${view.repairEvaluation}</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%" colspan="2"><input type="button" value="返回" onclick="history.go(-1)"></td>
		</tr>
		
	</table>
  </body>
</html>
