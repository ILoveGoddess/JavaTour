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
        <script type="text/javascript" src="../js/check.js"></script>
		<link rel="stylesheet" type="text/css" href="../css/main.css">
	</head>
	<body>
	   <table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td width="2%" align="center">

							</td>
							<td width="98%">

								<span class="sys_list_yh">系统管理&gt;&gt;岗位管理&gt;&gt;添加岗位信息</span>
							</td>
						</tr>
					</table>
					<br />
	   
		<form action="../job/addJob.do" method="post"  onsubmit="return checkData();">
			<table width="60%" border="0" align="center" cellpadding="2"
				cellspacing="1" bgcolor="#E4E4E4">
				   <tr>
				      <td>岗位性质</td><td><input type="radio" name="gwxz" value="gl" checked="checked">管理
				                         <input type="radio" name="gwxz" value="xjz">巡检组
				      </td>
				   </tr>
				   
					<tr bgcolor="#F2F2F2">
					<td  align="center">岗位名称：</td>
					<td><input name="job.name" id="jobName" onblur="checkJobName(this.value);"><span align="left" id="div1"></span></td>
					</tr>
					<tr bgcolor="#F2F2F2">
					<td align="center">岗位描述：</td>
					<td><textarea name="job.description" cols="30" rows="3"></textarea></td>
				</tr>
			</table><br>
			<center><input type="submit" value="新增">&nbsp;&nbsp;
			<input type="button" value="返回" onclick="history.back();"></center>
		</form>
	</body>
</html>
