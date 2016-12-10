<%@ page language="java"  contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <title>用户分页展现</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="../css/main.css" rel="stylesheet" type="text/css" />
	    <script type="text/javascript" src="../js/jump.js"></script>   
		<script type="text/javascript">
	    	function openfind() {
	    		document.all('find').style.display = "";
	    	}
    	
	    	function goto2(u) {
			    var url = u;
			    var v = document.getElementById("pagebox").value;
			    var i="${pageinfo.totalPage}";
			    if(v<1||v>i){
			    }else{
					location.href = url+v;
			  	}
	     	}
		</script>               
	</head>
	<body>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="2%" align="center"></td>
				<td width="98%">
					<span class="sys_list_yh">系统管理&gt;&gt;用户管理</span>
				</td>
			</tr>
		</table>
		<br><br>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="2%" align="center"></td>
				<td>
					<span>
						<input name="button" type="image" src="../images/add.gif" class="input_button9" onclick="location.href='../user/toAddUser.do'"/>
					    <input name="button" type="image" src="../images/search1.gif" class="input_button9" onclick="openfind();"/>
					    <div id="find" style="display:block">
					    	<form action="../user/userList.do" >
					    		<table>
					    			<tr>
					    				<td>用户登陆ID：</td>
					    				<td>
					    					<input name="loginId" type="text" value="${userSearch.loginId }">
					    				</td>
					    				<td>用户中文名字 ：</td>
					    				<td>
					    					<input name="username" type="text" value="${userSearch.userName }">
					    				</td>
					    				<td>
					    					<input type="image" src="../images/search2.gif" class="input_button9" title="搜索" />
					    				</td>
					    			</tr>
					    		</table>
					    	</form>
					    </div>
				    </span>
				</td>
			</tr>
		</table>
		<br>		
  		<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#E4E4E4">
			<tr>
				<td bgcolor="#F2F2F2" align="center" width="20%"> 用户登陆ID </td>
				<td bgcolor="#F2F2F2" align="center" width="20%"> 用户中文名字 </td>
				<td bgcolor="#F2F2F2" align="center" width="20%"> 用户所在部门 </td>
				<td bgcolor="#F2F2F2" align="center" width="15%"> 用户所属岗位 </td>
				<td bgcolor="#F2F2F2" align="center" width="10%"> 用户状态 </td>
				<td bgcolor="#F2F2F2" align="center" width="10%"> 操作 </td>
			</tr>
			<c:forEach items="${pageinfo.pagedata }" var="user">
				<tr align="center">
                     <td bgcolor="#FFFFFF">${user.loginId } </td>
					 <td bgcolor="#FFFFFF">${user.userName } </td>
					 <td bgcolor="#FFFFFF">${user.departmentName }</td>
					 <td bgcolor="#FFFFFF">${user.jobName } </td>
					 <td bgcolor="#FFFFFF">${user.userStatus =='1'? '启用':'禁用' }</td>
					 <td bgcolor="#FFFFFF">
						 <a href="../user/toUpdateUser.do?loginId=${user.loginId }" >
						 	<img src="../images/fix.gif" title="编辑" border="0"/>
						 </a>
						 <a href="../user/updateUserState.do?loginId=${user.loginId }&userStatus=${user.userStatus}" >
						 	<img src="../images/editstate.gif" title="更改用户状态" border="0"/>
						 </a>
	                     <c:if test="${user.loginId!='admin' }">
		                     <a href="../user/deleteUser.do?loginId=${user.loginId }"  title="删除" onClick="return confirm('确定删除此信息吗？')">
		                     	<img src="../images/del.gif" border="0">
		                     </a>
                     	 </c:if>
                     </td>
				</tr>
			</c:forEach>
		</table>
 		<p align="right">
			<font color="black">共</font>
			<font color="black">${pageinfo.totalRecord}</font>
			<font color="black">项&nbsp;</font>
			<font color="black">每页</font>
			<font color="black">${pageinfo.pageSize}</font>
			<font color="black">项&nbsp;</font>
			<font color="black">当前第</font>
			<font color="black">${pageinfo.curpage}</font>
			<font color="black">页&nbsp;</font>
			<font color="black">共</font>
			<font color="black">${pageinfo.totalPage}</font>
			<font color="black">页&nbsp;</font>
			<c:if test="${pageinfo.curpage!=1 }">
		        <a href="../user/userList.do?curpage=1">首  页</a>
		        <a href="../user/userList.do?curpage=${pageinfo.curpage-1}">上一页</a>
	        </c:if>
	        <c:if test="${pageinfo.curpage!=pageinfo.totalPage }">
		        <a href="../user/userList.do?curpage=${pageinfo.curpage+1 }">下一页</a>
		        <a href="../user/userList.do?curpage=${pageinfo.totalPage}">尾  页</a>
	        </c:if>
			<label>第</label>
			<input id="pagebox" type="text" size="4"><label>页</label>
			<a onclick="goto2('../user/userList.do?curpage=');" href="#"> 跳转</a>
		</p>	   
	</body>
</html>