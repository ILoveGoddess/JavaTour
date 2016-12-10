<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <title>巡检工基本信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
		<script type="text/javascript" src="../js/selecttime1.js"> </script>
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
			
			//跳转页面
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
		</script>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="2%" align="center"></td>
							<td width="98%">
								<span class="sys_list_yh">系统管理&gt;&gt;巡检工基本信息列表</span>
							</td>
						</tr>
					</table>
					<br />
					<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="5%"></td>
							<td>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<%-- <input name="button" type="image" src="../images/add.gif" class="input_button9" value="新增" onclick="window.location.href='./piwokernew.jsp'" />--%>
											<input name="button" type="image" src="../images/add.gif" class="input_button9" value="新增" onclick="window.location.href='../inspectionWorker/toAddWorker.do'" />
											<div id="addnew" style="display:none">
												<form name="" method="post" action="workeare.html">
													<label>名称：</label>
													<input type="text" name="employeename" size="12"></input>
													<label>&nbsp;&nbsp; 地址：</label>
													<input type="text" name="uuid" size="9"></input>
													<label>&nbsp;&nbsp;&nbsp; 电话：</label>
													<input type="text" name="phone" size="9"></input>
													<label>&nbsp;&nbsp;&nbsp; 网点编号：</label>
													<input type="text" name="uuid" size="9"></input>
													<label>&nbsp;&nbsp;&nbsp;</label> 
													<img onClick="fPopCalendar(STARTTIME,STARTTIME)" style="cursor:hand" src="../images/calendar.gif" width="25" height="21" />
													<input type="image" src="../images/add2.gif" class="input_button9" title="提交"></input>
												</form>
											</div>
											<div id="find" style="display:none">
												<form name="" method="post" action="">
													<label>名称：</label>
													<input type="text" name="employeename" size="12"></input>
													<label>&nbsp;&nbsp; 网点编号：</label>
													<input type="text" name="uuid" size="9"></input>
													<label>&nbsp;&nbsp;&nbsp;类型：</label>
													<select name="type">
														<option value="0">-请选择-</option>
														<option value="0">自建</option>
														<option value="0">合作</option>
													</select>
													<input type="image" src="../images/search2.gif" class="input_button9" title="搜索"></input>
												</form>
											</div>
										</td>
									</tr>
								</table>
								<br/>
								<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#E4E4E4">
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="15%">巡检工编号</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">巡检工姓名</td>
										<%--<td bgcolor="#F2F2F2" align="center" width="15%">所属巡检组</td>--%>
										<td bgcolor="#F2F2F2" align="center" width="15%">电话1</td>	
										<td bgcolor="#F2F2F2" align="center" width="15%">电话2</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">操作</td>
									</tr>
									<c:forEach items="${pageinfo.pagedata}" var="piworker">
										<tr align="center">
											<td bgcolor="#FFFFFF">${piworker.workerId}</td>
											<td bgcolor="#FFFFFF">${piworker.workerName}</td>
											<%--<td bgcolor="#FFFFFF">${piGroup.groupId}</td>--%>
											<td bgcolor="#FFFFFF">${piworker.workerTel1}</td>
											<td bgcolor="#FFFFFF">${piworker.workerTel2}</td>			
											<td bgcolor="#FFFFFF">
												<a href="../inspectionWorker/toUpdateWorker.do?workerId=${piworker.workerId}">
													<img src="../images/fix.gif" title="修改" border="0">
												</a>
											    <label>&nbsp;&nbsp;</label>
											    <a href="../inspectionWorker/deleteWorker.do?workerId=${piworker.workerId}" onClick="return confirm('确定删除此信息吗？')">
											    	<img src="../images/del.gif" title="删除" border="0">
											    </a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table0">
						<tr>
							<td width="35%"></td>
							<td width="62%">
								<p align="right">
									<font color="black">共</font>
									<font color="black">${pageinfo.totalRecord}</font>
									<font color="black">项&nbsp;</font>
									<font color="black">每页</font>
									<font color="black"> ${pageinfo.pageSize}</font>
									<font color="black">项&nbsp;</font>
									<font color="black">当前第</font>
									<font color="black">${pageinfo.curpage}</font>
									<font color="black">页&nbsp;</font>
									<font color="black">共</font>
									<font color="black">${pageinfo.totalPage}</font>
									<font color="black">页&nbsp;</font>
									<c:if test="${pageinfo.curpage != 1}">
	        							<a href="../inspectionWorker/inspectionWorkerList.do?curpage=1">首页</a>
	        							<a href="../inspectionWorker/inspectionWorkerList.do?curpage=${pageinfo.curpage - 1}">上一页</a>
       								</c:if>
       								<c:if test="${pageinfo.curpage != pageinfo.totalPage}">
	        							<a href="../inspectionWorker/inspectionWorkerList.do?curpage=${pageinfo.curpage + 1}">下一页</a>
	        							<font color="black">
	        								<a href="../inspectionWorker/inspectionWorkerList.do?curpage=${pageinfo.totalPage}">尾页</a>
	        							</font>&nbsp; 
       								</c:if>
        							<input id="pagebox" size="1" name="pagebox">&nbsp;
        							<a onclick="gotoTwo('../inspectionWorker/inspectionWorkerList.do?');" href="#">跳转</a>&nbsp;
        							<input id="totalpage" type="hidden" value="${pageinfo.totalPage }" name="totalpage">	  					
       								</font>
       							</p>
							</td>
							<td width="3%">&nbsp;</td>					
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>