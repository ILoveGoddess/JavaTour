<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>巡检工添加页面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="../css/main.css">
		<link rel="stylesheet" type="text/css" href="../css/css.css">
		<script type="text/javascript" src="../js/jump.js"></script>
	</head>
	<body topmargin="50">	 
	 <table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td width="2%" align="center">

							</td>
							<td width="98%">

								<span class="sys_list_yh">系统管理&gt;&gt;巡检工列表&gt;&gt;新增巡检工</span>
							</td>
						</tr>
					</table>	
	   
		<form action="../inspectionWorker/addWoker.do" method="post" onsubmit="return checkTel();">
			<table width="60%" border="0" align="center" cellpadding="2"
				cellspacing="1" bgcolor="#E4E4E4">
					<tr bgcolor="#F2F2F2">
					<td  align="center">巡检工姓名：</td>
					<td><input name="piwoker.workerName"></td>
					</tr>
				    <tr bgcolor="#F2F2F2">
					<td  align="center">电话1：</td>
					<td><input name="piwoker.workerTel1" id="tel" onblur="checkTel('tel')"></td>
					</tr>
					<tr bgcolor="#F2F2F2">
					<td  align="center">电话2：</td>
					<td><input name="piwoker.workerTel2" id="te2" onblur="checkTel('te2')"></td>
					
					</tr>
			
			</table><br>
			<center><input type="submit" value="提交">&nbsp;&nbsp;<input type="button" value="返回" onclick="history.back();"></center>
		</form>
	</body>
</html>

