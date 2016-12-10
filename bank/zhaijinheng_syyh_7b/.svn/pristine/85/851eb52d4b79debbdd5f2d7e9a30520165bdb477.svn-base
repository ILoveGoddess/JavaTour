<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>展现可操作页面信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="../css/main.css">
       <script type="text/javascript" src="../js/jump.js"></script>
	</head>
	<body>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td width="2%" align="center">

							</td>
							<td width="98%">

								<span class="sys_list_yh">系统管理&gt;&gt;岗位管理&gt;&gt;岗位页面展现</span>
							</td>
						</tr>
					</table>
					<br />
					<table width="95%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="5%"></td>
							<td>
								<table width="95%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											页面编号
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											可操作页面
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											可操作模块
										</td>
									</tr>
									<c:forEach items="${pageinfo.pagedata}" var="gwym">
										<tr align="center">
											<td bgcolor="#FFFFFF">
												${gwym.ymbh}
											</td>
											<td bgcolor="#FFFFFF">
												${gwym.ymmc}
											</td>
											<td bgcolor="#FFFFFF">
												${gwym.funcName}
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
</table>
		<table width="95%" border="0" cellpadding="0" cellspacing="0"
						class="table0">
						<tr align="right">
							<td width="62%">
										<font color="black">共</font><font color="black">${pageinfo.totalRecord}</font>
								<font color="black">项&nbsp;
								<font color="black">每页</font><font color="black">${pageinfo.pageSize}</font><font color="black">项&nbsp;
								<font color="black">当前第</font><font color="black">${pageinfo.curpage}</font>
								<font color="black">页&nbsp;
								<font color="black">共</font><font color="black">${pageinfo.totalPage}</font>
								<font color="black">页&nbsp;
									<c:if test="${pageinfo.curpage != 1}">
									<a href="../job/showJob.do?curpage=1">首页</a> 
									<a href="../job/showJob.do?curpage=${pageinfo.curpage-1 }">上一页</a> 
									</c:if>
									<c:if test="${pageinfo.curpage != pageinfo.totalPage}">
									<a href="../job/showJob.do?curpage=${pageinfo.curpage+1 }">下一页</a>
									<a href="../job/showJob.do?curpage=${pageinfo.totalPage }">尾页</a>
									</c:if>
									&nbsp;    <input id="pagebox" size="1" name="pagebox"></input>&nbsp;
								              <a onclick="goto('./jobshow.do?m=list&');" href="#">跳转</a>&nbsp;
								              <input id="totalpage" type="hidden" size="1" value="${pageinfo.totalPage }" name="totalpage"></input>		   
							</td>
						</tr>
					</table>
										<div align="center">
											<input type="button" value="返回" onclick="history.back();">
										</div>
	</body>
</html>
