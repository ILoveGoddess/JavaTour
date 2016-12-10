<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>页面列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="../css/main.css">
		<script type="text/javascript" src="../js/check.js">
  </script>
	</head>

	<body>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">

			<tr>
				<td width="2%" align="center">

				</td>
				<td width="98%">

					<span class="sys_list_yh">系统管理&gt;&gt;岗位管理</span>
				</td>
			</tr>
		</table>
		<br />
		<center>
			<span class="sys_list_yh">${funcName }页面列表</span>
		</center>
		
		<form action="../job/changePow.do?jobId=${jobId }&funcId=${funcId}" method="post">
		    		<table width="50%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<div align="top" valign="left">
					<input type="checkbox" name="allbox" onclick="checkall();">
					全选/撤选
				</div>
									<tr bgcolor="#F2F2F2">
										<td bgcolor="#F2F2F2" align="center" width="15%">
											选择
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											页面名称
										</td>
									</tr>
				<c:forEach items="${list}" var="xtymb">
					<tr bgcolor="#F2F2F2">
					<c:choose>
						<c:when test="${xtymb.hasPow != 0}">
							<td>
								<input type="checkbox" value="${xtymb.ymbh }" checked
									name="ymbhs">
							</td>
							<td>
								${xtymb.ymmc }
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<input type="checkbox" value="${xtymb.ymbh }" name="ymbhs">
							</td>
							<td>
								${xtymb.ymmc }
							</td>
						</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			<br>
			<center>
				<input type="submit" value="新增">
				&nbsp;&nbsp;
				<input type="button" value="返回" onclick="history.back();">
			</center>
		</form>
	</body>
</html>
