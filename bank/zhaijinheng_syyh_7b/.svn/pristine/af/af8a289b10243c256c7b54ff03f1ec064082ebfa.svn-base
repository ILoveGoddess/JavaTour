<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String checkdata = "return checkdata();";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <title>用户新增</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="../css/main.css" rel="stylesheet" type="text/css" />
<%--	<link href="../css/css.css" rel="stylesheet" type="text/css">--%>
		<script type="text/javascript" src="../js/checkUserName.js"></script>
	</head>
	<body>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="2%" align="center"></td>
				<td width="98%">
					<span class="sys_list_yh">系统管理&gt;&gt;用户管理&gt;&gt;用户新增</span>
				</td>
			</tr>
		</table>
		<br><br>
	  	<form action="../user/addUser.do" method="post" onsubmit=<%=checkdata %>>
		  	<table width="60%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#E4E4E4">
				<tr bgcolor="#FFFFFF">
			    	<td width="30%">用户登陆ID</td><td><input type="text" name="users.loginId" class="input" onblur="searchSuggest('users.loginId','title');">(只能是字母和数字长度不能大于10)
			    		<span id="title"></span>
			    	</td>
			    </tr>
			    <tr bgcolor="#FFFFFF">
			    	<td>用户登陆密码</td><td><input type="password" name="users.loginPassword" class="input"></td>
			    </tr>
			    <tr bgcolor="#FFFFFF">
			    	<td>确认密码</td><td><input type="password" name="checkpwd" class="input"></td>
			    </tr>
			    <tr bgcolor="#FFFFFF">
			    	<td>用户中文名称</td><td><input type="text" name="users.userName"></td>
			    </tr>
			    <tr bgcolor="#FFFFFF">
			    	<td>用户所属部门</td>
				    <td>
					    <select name="departmentId">
					    	<c:forEach items="${depts }" var="dept">
					    		<option value="${dept.departmentId }">${dept.departmentName }</option>
					    	</c:forEach>
					    </select>
				    </td>
			    </tr>
			    <tr bgcolor="#FFFFFF">
			    	<td>用户所在岗位</td>
			    	<td>
			    		<select name="jobId">
			    			<c:forEach items="${jobs }" var="job">
			    				<option value="${job.jobId }">${job.name }</option>
			    			</c:forEach>
			    		</select>
			    	</td>
			    </tr>
			    <tr bgcolor="#FFFFFF">
			    	<td>用户状态</td>
			    	<td>
			    		<input type="radio" name="users.userStatus" value="1" checked>启用
			    		<input type="radio" name="users.userStatus" value="0">禁用
			    	</td>
			    </tr>
			    <tr bgcolor="#FFFFFF">
			    	<td colspan="2" align="center">
			    		<input type="submit" value="新增">
			    		<input type="button" value="取消" onclick="history.back();">
			    	</td>
			    </tr>
			</table>
		</form>
	</body>
</html>