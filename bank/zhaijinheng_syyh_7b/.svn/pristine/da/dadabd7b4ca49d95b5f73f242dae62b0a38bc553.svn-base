<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>维修工维修设备</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	
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
function goto(u) {
	  var url = u;
	  var v = document.getElementById("pagebox").value;
	
	  if(v<1||v>${pageinfo.totalPage}){
		
	  }else{
	 	location.href = url+v;
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

								<span class="sys_list_yh">维修工&gt;&gt;确认维修</span>
							</td>
						</tr>
					</table>
					<br />
					<table width="95%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="5%"></td>
							<td>
								
								<br />
								<table width="95%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="5%"></td>
							<td> 
							    
								<table width="100%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="10%">
											编号
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											银行名称
										</td>
										<td bgcolor="#F2F2F2" align="center" width="10%">
											设备种类
										</td>
										<td bgcolor="#F2F2F2" align="center" width="10%">
											设备流水号
										</td>
										<td bgcolor="#F2F2F2" align="center" width="10%">
											小组名称
										</td>
										<td bgcolor="#F2F2F2" align="center" width="18%">
											报修时间
										</td>
										<td bgcolor="#F2F2F2" align="center" width="8%">
											记录状态
										</td>
										<td bgcolor="#F2F2F2" align="center" width="12%">
											小组分配状态
										</td>
										<td bgcolor="#F2F2F2" align="center" >
											操作
										</td>
									</tr>
									 <c:forEach items="${pageinfo.pagedata}" var="repair">
									<tr align="center">
										<td bgcolor="#FFFFFF">
											${repair.repairId}
										</td>
										<td bgcolor="#FFFFFF">
											${repair.bankName}
										</td>
										<td bgcolor="#FFFFFF">
											${repair.equipmentName}
										</td>
										<td bgcolor="#FFFFFF">
											${repair.equipmentEachId}
										</td>
										<td bgcolor="#FFFFFF">
											${repair.groupName}
										</td>
										<td bgcolor="#FFFFFF">
										  
											${repair.repairDateStr }
										
										</td>
										<td bgcolor="#FFFFFF">
										   <c:if  test="${repair.repairStatus==0}">处在报修</c:if>
										   <c:if  test="${repair.repairStatus==1}">结束报修</c:if>
										   <c:if  test="${repair.repairStatus==2}">正在申请</c:if>
										   <c:if  test="${repair.repairStatus==3}">银行确认</c:if>
										</td>
										<td bgcolor="#FFFFFF">
										    <c:if  test="${repair.allocateStatus==0}">未分配小组</c:if>
										    <c:if  test="${repair.allocateStatus==1}">已分配小组</c:if>
										   </td>
										<td bgcolor="#FFFFFF">
										   
										   <%--<s:if test="%{#session.wdid!=null&&!''.equals(#session.wdid)}">
											
											  <s:if test="%{#session.wdid==bank.bankId}">
											  --%><a href="../wxg/wxgrepair.do?repairId=${repair.repairId}"><img src="../images/fix.gif" title="小组维修" border="0"></a>
									     <%--</s:if>
									     </s:if>
									     --%><a href="../wd/sbbxview.do?repairId=${repair.repairId}"><img src="../images/fix.gif" title="查看" border="0"></a>
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
									<font color="black">每页</font><font color="black">${pageinfo.pageSize}</font>
									<font color="black">项&nbsp;
									<font color="black">当前第</font><font color="black">${pageinfo.curpage}</font>
									<font color="black">页&nbsp;
									<font color="black">共</font><font color="black">${pageinfo.totalPage}</font>
									<font color="black">页&nbsp;
		<c:if test="${pageinfo.curpage != 1}">
         <a href="../wxg/getMoreRepair.do?curpage=1">首  页</a>
         <a href="../wxg/getMoreRepair.do?curpage=${pageinfo.curpage-1}">上一页</a>
         </c:if>
         <c:if test="${pageinfo.curpage != pageinfo.totalPage}">
         <a href="../wxg/getMoreRepair.do?curpage=${pageinfo.curpage+1}">下一页</a>
         <a href="../wxg/getMoreRepair.do?curpage=${pageinfo.totalPage}">尾  页</a>
         </c:if>
         第<input  id="pagebox"  type="text" size="4">页<a href="#" onclick="goto('./sbbx!listg.do?pageinfo.curpage=');" > 跳转</a>
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
		</td>
		</tr>
		</table>
  </body>
</html>
