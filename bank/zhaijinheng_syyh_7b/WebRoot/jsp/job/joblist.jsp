<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>岗位信息展现</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/selecttime1.js"> </script>
    <script type="text/javascript" src="../js/check.js"> </script>
    <script type="text/javascript" src="../js/jump.js"></script>
	<script type="text/javascript">
		
			
		function gotoTwo(u) {
			var url = u;
			var v = document.getElementById("pagebox").value;
			var v1 = document.getElementById("totalpage").value;
			if (v != "" && v1 != "") {
				if (parseInt(v) <= parseInt(v1)) {
					location.href = url + "curpage=" + document.getElementById("pagebox").value;
				}
			}
		}
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

								<span class="sys_list_yh">系统管理&gt;&gt;岗位管理&gt;&gt;岗位列表</span>
							</td>
						</tr>
					</table>
					<br />
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
												class="input_button9" value="新增" onclick="window.location.href='../job/toAddJob.do'" />
										</td>
									</tr>
								</table>
								<br />
								<table width="95%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											编号
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											名称
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											描述
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											操作
										</td>
									</tr>
									 <c:forEach items="${pageinfo.pagedata}" var="job">
									<tr align="center">
										<td bgcolor="#FFFFFF">
											${job.jobId}
										</td>
										<td bgcolor="#FFFFFF">
											<a href="../job/showJob.do?jobId=${job.jobId }&curpage=1" title="查看拥有的权限">${job.name}</a>
										</td>
										<td bgcolor="#FFFFFF">
											${job.description}
										</td>
										<td bgcolor="#FFFFFF" >
											<a href="../job/toUpdateJob.do?jobId=${job.jobId }"><img src="../images/fix.gif" title="编辑" border="0"></a>
										   &nbsp;&nbsp;<a href="../job/toManageFunc.do?jobId=${job.jobId }"><img src="../images/VIEW.GIF" title="模块管理" border="0"></a>   
										   <c:if test="${job.userCount == 0}">
									       &nbsp;&nbsp;<a href="../job/jobdelete.do?jobId=${job.jobId }" onClick="return confirm('确定删除此信息吗？')"><img src="../images/del.gif" title="删除" border="0"></a>
									       </c:if>
										   <c:if test="${job.jobId >10}">
										      <a href="./addGzz.do?job.jobId=${job.jobId }"><img src="../images/ADD5.GIF" title="编辑工作组" border="0"></a>
										   </c:if>
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
								<font color="black">每页</font><font color="black">${pageinfo.pageSize}</font><font color="black">项&nbsp;
								<font color="black">当前第</font><font color="black">${pageinfo.curpage}</font>
								<font color="black">页&nbsp;
								<font color="black">共</font><font color="black">${pageinfo.totalPage}</font>
								<font color="black">页&nbsp;
									<c:if test="${pageinfo.curpage != 1}">
									<a href="../job/jobList.do?curpage=1">首页</a> 
									<a href="../job/jobList.do?curpage=${pageinfo.curpage-1 }">上一页</a> 
									</c:if>
									<c:if test="${pageinfo.curpage != pageinfo.totalPage}">
									<a href="../job/jobList.do?curpage=${pageinfo.curpage+1 }">下一页</a>
									<a href="../job/jobList.do?curpage=${pageinfo.totalPage }">尾页</a>
									</c:if>
									&nbsp;    <input id="pagebox" size="1" name="pagebox"></input>&nbsp;
								              <a onclick="gotoTwo('../job/jobList.do?m=list&');" href="#">跳转</a>&nbsp;
								              <input id="totalpage" type="hidden" size="1" value="${pageinfo.totalPage }" name="totalpage"></input>		   
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
				</td>
			</tr>
		</table>
		
  </body>
</html>
