<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>岗位添加页面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="../css/main.css">
		<script type="text/javascript" src="../js/check.js"></script>
	</head>
	<body>
	   <table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td width="2%" align="center">

							</td>
							<td width="98%">

								<span class="sys_list_yh">系统管理&gt;&gt;岗位管理&gt;&gt;修改岗位信息</span>
							</td>
						</tr>
					</table>
					<br />
	    
		<form action="../job/updateJob.do?jobId=${job.jobId }" method="post" onsubmit="return checkData();">
			<table width="60%" border="0" align="center" cellpadding="2"
				cellspacing="1" bgcolor="#E4E4E4">
				<input name="job.jobId " value="${job.jobId }" type="hidden"/>
				<%--
				   <tr>
				      <td>岗位性质</td><td><input type="radio" name="gwxz" value="gl">管理
				                         <input type="radio" name="gwxz" value="xjz">巡检组
				      </td>
				   </tr>
				   
					--%><tr bgcolor="#F2F2F2">
					<td  align="center">岗位名称：</td>
					<td><input name="job.name" value="${job.name }" id="jobName" onblur="checkJobName(this.value);"><span align="left" id="div1"></span></td>
					</tr>
					<tr bgcolor="#F2F2F2">
					<td align="center">岗位描述：</td>
					<td><textarea name="job.description" cols="30" rows="3">${job.description}</textarea></td>
				</tr>
			</table><br>
			<center><input type="submit" value="修改">&nbsp;&nbsp;<input type="button" value="返回" onclick="history.back();"></center>
		</form>
	</body>
</html>
