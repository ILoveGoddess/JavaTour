<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>程序功能展现</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="./css/main.css">
        
<link rel="stylesheet" type="text/css" href="../css/main.css">
 
</head>
<body>
    <table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td width="2%" align="center">

							</td>
							<td width="98%">

								<span class="sys_list_yh">系统管理&gt;&gt;岗位管理&gt;&gt;程序功能列表</span>
							</td>
						</tr>
					</table>
					<br />
	 <table width="40%" border="0" align="center" cellpadding="2"
				cellspacing="1"  bgcolor="#E4E4E4">
		<tr  bgcolor="#F2F2F2">
			<td>
				编号
			</td>
			<td>
				名称
			</td>
			<td>
				操作
			</td>
		</tr>
		<c:forEach items="${list}" var="func">
			<tr  bgcolor="#F2F2F2">
				<td>
					${func.funcId }
				</td>
				<td>
					${func.funcName } </td>
				<td>
					<a <c:if test="${func.contains != 0 }"> href='../job/toSetPow.do?funcId=${func.funcId}&jobId=${jobId }'</c:if> >
						<img src="../images/VIEW.GIF" border="0" title="页面列表">
					</a>
				</td>
			</tr>
		</c:forEach>
	</table><br>
				<center><input type="button" value="返回" onclick="window.location.href='../job/jobList.do'"></center>
	</body>
</html>
