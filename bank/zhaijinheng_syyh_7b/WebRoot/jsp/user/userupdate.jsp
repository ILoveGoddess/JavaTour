<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <title>用户修改</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="../css/main.css" rel="stylesheet" type="text/css" />
	    <script type="text/javascript" src="../js/userupdate.js"></script>
	</head>
	<body>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="2%" align="center"></td>
				<td width="98%">
					<span class="sys_list_yh">系统管理</span>
					<span>&gt;&gt;</span>
					<span>用户管理</span>
					<span>&gt;&gt;</span>
					<span>用户修改</span>
				</td>
			</tr>
		</table>
		<span><br><br></span>
		<form action="../user/updateUser.do" method="post" onsubmit="return checkdata();">
	    	<table width="60%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#E4E4E4">
	    		<caption align="center">用户修改</caption>
	    		<tr bgcolor="#FFFFFF">
	    			<input type="hidden" name="users.loginId"  value="${user0.loginId }" >
	    			<td >用户登陆ID</td>
	    			<td>${user0.loginId }</td>
	    		</tr>
	    		<tr bgcolor="#FFFFFF">
	    			<td>用户登陆密码</td>
	    			<td>
	    				<input type="password" name="users.loginPassword" value="${user0.loginPassword }">
	    			</td>
	    		</tr>
	    		<tr bgcolor="#FFFFFF">
	    			<td>确认密码</td>
	    			<td>
	    				<input type="password" name="checkpwd" class="input" value="${user0.loginPassword }">
	    			</td>
	    		</tr>
	    		<tr bgcolor="#FFFFFF">
	    			<td>用户中文名称</td>
	    			<td>
	    				<input type="text" name="users.userName" value="${user0.userName }">
	    			</td>
	    		</tr>
	    		<tr bgcolor="#FFFFFF">
	    			<td>用户所属部门</td>
	    			<td>
	    				<select name="departmentId">
	    					<c:forEach items="${depts }" var="dept">
	    						<option value="${dept.departmentId }" <c:if test="${user0.departmentId==dept.departmentId }">selected="selected"</c:if>>${dept.departmentName }</option>
	    					</c:forEach>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr bgcolor="#FFFFFF">
	    			<td>用户所在岗位</td>
	    			<td>
	    				<select name="jobId">
	    					<c:forEach items="${jobs }" var="job">
	    						<c:choose>
	    							<c:when test="${user0.jobId==job.jobId }">
	    								<option value="${job.jobId }" selected="selected">${job.name }</option>
	    							</c:when>
	    							<c:otherwise>
	    								<option value="${job.jobId }">${job.name }</option>
	    							</c:otherwise>
	    						</c:choose>
	    					</c:forEach>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr bgcolor="#FFFFFF">
	    			<td>用户状态</td>
	    			<td>
	    				<input type="radio" name="users.userStatus" value="1" <c:if test="${user0.userStatus=='1' }">checked="checked"</c:if> >
	    				<span>启用</span>
	    				<input type="radio" name="users.userStatus" value="0" <c:if test="${user0.userStatus=='0' }">checked="checked"</c:if> >
	    				<span>禁用</span>
	    			</td>
	    		</tr>
	    		<tr bgcolor="#FFFFFF">
	    			<td colspan="2" align="center">
	    			<input type="submit" value="修改">
	    			<input type="button" value="返回" onclick="history.back();">
	    			</td>
	    		</tr>
	    	</table>
    	</form>
	</body>
</html>