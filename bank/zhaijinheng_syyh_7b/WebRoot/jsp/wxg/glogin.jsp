<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>维修工初始界面</title>
    
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
							    
								<table width="95%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<caption  align="right" ><a href="../wxg/getMoreRepair.do">更多...</a>  </caption>
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
										<td bgcolor="#FFFFFF"><%--
											 <s:if test="%{#session.wdid!=null&&!''.equals(#session.wdid)}">
											
											  <s:if test="%{#session.wdid==bank.bankId}">
											  --%><a href="../wxg/wxgrepair.do?repairId=${repair.repairId}"><img src="../images/fix.gif" title="小组维修" border="0"></a>
									     <%--</s:if>
									     </s:if>
									     --%><a href="../wd/sbbxview.do?repairId=${repair.repairId}"><img src="../images/fix.gif" title="查看" border="0"></a>
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
