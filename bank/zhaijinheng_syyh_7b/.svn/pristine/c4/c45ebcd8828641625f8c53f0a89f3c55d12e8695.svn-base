<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>巡检组</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="../css/main.css">
		<script type="text/javascript" src="js/selecttime1.js"> </script>
        <script type="text/javascript" src="../js/jump.js"></script>
		<script type="text/javascript">
 
  function openfind(){
  
  var temp = document.getElementById("find").style.display;
  var temp1 = document.getElementById("addnew").style.display;
  if(temp1!="none"){
 
     document.getElementById("addnew").style.display="none";
  }
   if(temp=="none"){
     var st = document.getElementById("find").style.display="";
   }else{
     document.getElementById("find").style.display="none";
   }
  
  
  }
function openadd(){
  
  var temp = document.getElementById("addnew").style.display;
  var temp1 = document.getElementById("find").style.display;
   if(temp1!="none"){
 
     document.getElementById("find").style.display="none";
  }

   if(temp=="none"){
     var st = document.getElementById("addnew").style.display="";
   }else{
     document.getElementById("addnew").style.display="none";
   }
}
</script>
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
								<span class="sys_list_yh">系统管理&gt;&gt;巡检组列表</span>
							</td>
						</tr>
					</table>
					<br/>
					<table width="95%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="5%"></td>
							<td>
								<table width="95%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td>
											<input name="button" type="image" src="../images/add.gif"
												class="input_button9" value="新增"
												onclick="window.location.href='../inspectionGroup/toAddGroup.do'" />			
											<div id="addnew" style="display:none">
												<form name="" method="post" action="workeare.html">
													名称：
													<input type="text" name="employeename" size="12"></input>
													&nbsp;&nbsp; 地址：
													<input type="text" name="uuid" size="9"></input>
													&nbsp;&nbsp;&nbsp; 电话：
													<input type="text" name="phone" size="9"></input>
													&nbsp;&nbsp;&nbsp; 网点编号：
													<input type="text" name="uuid" size="9"></input>
													&nbsp;&nbsp;&nbsp;
													<img onClick="fPopCalendar(STARTTIME,STARTTIME)"
														style="cursor:hand" src="../images/calendar.gif"
														width="25" height="21" />
													<input type="image" src="../images/add2.gif"
														class="input_button9" title="提交"></input>
												</form>
											</div>
											<div id="find" style="display:none">
												<form name="" method="post" action="">
													名称：
													<input type="text" name="employeename" size="12"></input>
													&nbsp;&nbsp; 网点编号：
													<input type="text" name="uuid" size="9"></input>
													&nbsp;&nbsp;&nbsp; 类型：
													<select name="type">
														<option value="0">
															-请选择-
														</option>
														<option value="0">
															自建
														</option>
														<option value="0">
															合作
														</option>
													</select>
													<input type="image" src="../images/search2.gif"
														class="input_button9" title="搜索"></input>
												</form>
											</div>
										</td>
									</tr>
								</table>
								<br />
								<table width="95%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											巡检组编号
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											巡检组名称
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											操作
										</td>
									</tr>
									
									<c:forEach items="${pageinfo.pagedata}" var="group">
										<tr align="center">
											<td bgcolor="#FFFFFF">
												${group.groupId}
											</td>
											<td bgcolor="#FFFFFF">
												${group.groupName}
											</td>
											<td bgcolor="#FFFFFF">
											<a href="../inspectionGroup/toUpdateGroup.do?groupId=${group.groupId }"><img
														src="../images/fix.gif" title="修改" border="0">
													</a>
											<a href="<%=basePath %>jsp/inspectionGroup/eiditWork.jsp">重新分配</a>
											<c:choose>
												<c:when test="${group.workerCount == 0}">
													<a href="./deletePiGroup.do?pigroup.groupId=${group.groupId }" onClick="return confirm('确定删除此信息吗？')"><img
														src="../images/del.gif" title="删除" border="0">
													</a>
												</c:when>
												<c:otherwise>
												<a href="../inspectionGroup/viewWorker.do?groupId=${group.groupId }">查看巡检工</a>
												</c:otherwise>
											</c:choose>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="table0">
						<tr>
							<td width="35%">
							</td>
							<td width="62%">
								<p align="right">
								
								<font color="black">共</font><font color="black">${pageinfo.totalRecord}</font>
								<font color="black">项&nbsp;
								<font color="black">每页</font><font color="black"> ${pageinfo.pageSize}</font><font color="black">项&nbsp;
								<font color="black">当前第</font><font color="black">${pageinfo.curpage}</font>
								<font color="black">页&nbsp;
								<font color="black">共</font><font color="black">${pageinfo.totalPage}</font>
								<font color="black">页&nbsp;
		<c:if test="${pageinfo.curpage != 1}">
        <a href="../inspectionGroup/inspectionGroupList.do?curpage=1">首页</a>
        <a href="../inspectionGroup/inspectionGroupList.do?curpage=${pageinfo.curpage-1}">上一页</a>
       </c:if>
       <c:if test="${pageinfo.curpage != pageinfo.totalPage}">
        <a href="../inspectionGroup/inspectionGroupList.do?curpage=${pageinfo.curpage+1 }">下一页</a><font color="black">
        <a href="../inspectionGroup/inspectionGroupList.do?curpage=${pageinfo.totalPage}">尾页</a></font>&nbsp; 
       </c:if>	
       <input id="pagebox" size="1" name="pagebox">&nbsp;
		<a onclick="goto('../inspectionGroup/inspectionGroupList.do?m=list&');" href="#">跳转</a>&nbsp;
		<input id="totalpage" type="hidden" size="1" value="${pageinfo.totalPage }" name="totalpage">				
       </font></p>
							</td>
							<td width="3%">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
	</body>
</html>
