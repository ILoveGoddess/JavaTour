<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <title>部门展现</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
		<script type="text/javascript" src="js/selecttime1.js"> </script>
	    <script type="text/javascript" src="../js/jump.js"></script>
	    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#pagebox").keyup(function(event){
					var val = $("#pagebox").val();
					if(val == ""){
						return;
					}
					if(event.keyCode<=48 || event.keyCode>57){
						$("#pagebox").val(val.substring(0,val.length-1));
					}
					if(val > ${pageInfo.totalPage } || val < 1){
						$("#pagebox").val(${pageInfo.curpage});
					}
				});	
			});
			
			function gotoTwo(u) {
				var url = u;
				var v = document.getElementById("pagebox").value;
				var i=${pageInfo.totalPage} ;
				if(v<1||v>i){
				}else{
					location.href = url+v;
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
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="2%" align="center"></td>
							<td width="98%">
								<span class="sys_list_yh">系统管理&gt;&gt;日志列表</span>
							</td>
						</tr>
					</table>
					<br/>
					<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
						<caption align="right">
						    <a href="../log/clearLog.do">清空日志</a>&nbsp;&nbsp;&nbsp;&nbsp;
						    <a href="../log/exportExcel.do">生成excel</a>
					    </caption>
						<tr>
							<td width="5%"></td>
							<td>
								<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#E4E4E4">
									<tr>
										<td>
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="15%">日志编号</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">登陆ID</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">登陆时间</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">退出时间</td>
									</tr>
									<c:forEach items="${pageInfo.pagedata }" var="log">
										<tr align="center">
											<td bgcolor="#FFFFFF">${log.logId }</td>
											<td bgcolor="#FFFFFF">${log.userId }</td>
											<td bgcolor="#FFFFFF"><!--  ${log.checkinTimeStr }-->
											<fmt:formatDate value="${log.checkinTime }" pattern="yyy-MM-dd HH:mm:ss"/>
											</td>
											<td bgcolor="#FFFFFF">
												  <fmt:formatDate value="${log.checkoutTime }" pattern="yyy-MM-dd HH:mm:ss"/>
												<!--${log.checkoutTimeStr }-->
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
									<font color="black">${pageInfo.totalRecord}</font>
									<font color="black">项&nbsp;</font>
									<font color="black">每页</font>
									<font color="black">${pageInfo.pageSize}</font>
									<font color="black">项&nbsp;</font>
									<font color="black">当前第</font>
									<font color="black">${pageInfo.curpage}</font>
									<font color="black">页&nbsp;</font>
									<font color="black">共</font>
									<font color="black">${pageInfo.totalPage}</font>
									<font color="black">页&nbsp;</font>
								    <c:if test="${pageInfo.curpage != 1}">
									    <a href="../log/logList.do?curpage=1">首页</a>
									    <a href="../log/logList.do?curpage=${pageinfo.curpage-1 }"> 上一页</a>
								    </c:if>
								    <c:if test="${pageInfo.curpage != pageInfo.totalPage}">
									    <a href="../log/logList.do?curpage=${pageInfo.curpage+1 }"> 下一页</a>
									    <a href="../log/logList.do?curpage=${pageInfo.totalPage }"> 尾页</a>
								    </c:if>
								    <input id="pagebox" size="1" name="pagebox"></input>&nbsp;
									<a onclick="gotoTwo('../log/logList.do?curpage=');" href="#">跳转</a>&nbsp;
									<input id="totalpage" type="hidden" size="1" value="${pageInfo.totalPage }" name="totalpage"></input>	
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