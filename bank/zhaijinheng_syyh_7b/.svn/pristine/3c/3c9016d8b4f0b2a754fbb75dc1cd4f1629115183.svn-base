<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>设备报修问题展现</title>
    
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

								<span class="sys_list_yh">系统管理&gt;&gt;设备报修问题列表</span>
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
												class="input_button9" value="新增" onclick="window.location.href='../repairtype/toAddRepairtype.do'" />
								<table width="100%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											问题编号
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											问题名称
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											操作
										</td>
									</tr>
									 <c:forEach items="${pageinfo.pagedata}" var="repairtype">
									<tr align="center">
										<td bgcolor="#FFFFFF">
											${repairtype.typeId}
										</td>
										<td bgcolor="#FFFFFF">
											${repairtype.typeValue}
										</td>
										
										<td bgcolor="#FFFFFF">
											<a href="../repairtype/toUpdateType.do?typeId=${repairtype.typeId}"> <img src="../images/fix.gif" title="编辑" border="0"></a>&nbsp;&nbsp;
									        <c:if test="${repairtype.typeCount == 0}">
									          <a href="../repairtype/deleteType.do?typeId=${repairtype.typeId}"><img src="../images/del.gif" title="删除"  onClick="return confirm('确定删除此信息吗？')" border="0"></a>
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
								         <a href="../repairtype/repairtypelist.do?curpage=1">首  页</a>
								         <a href="../repairtype/repairtypelist.do?curpage=${pageinfo.curpage -1}">上一页</a>
								      </c:if>
								      <c:if test="${pageinfo.curpage != pageinfo.totalPage}">
								         <a href="../repairtype/repairtypelist.do?curpage=${pageinfo.curpage +1}">下一页</a>
								         <a href="../repairtype/repairtypelist.do?curpage=${pageinfo.totalPage}">尾页</a>
								      </c:if><input id="pagebox" size="1" name="pagebox"></input>&nbsp;
								              <a onclick="goto('./frtlist.do?m=list&');" href="#">跳转</a>&nbsp;
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
		
  </body>
</html>
