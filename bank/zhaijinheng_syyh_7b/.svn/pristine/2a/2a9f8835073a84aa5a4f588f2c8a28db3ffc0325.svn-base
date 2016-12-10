<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>网点设备报修</title>
    
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
	
	    
	    var i=${pageinfo.totalPage} ;
	  
	    if(v<1||v>i){
		
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
							<span class="sys_list_yh">网点&gt;&gt;设备报修</span>
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
												class="input_button9" value="新增" onclick="window.location.href='../wd/towdaddrepair.do'" />
											<input name="button" type="image" src="../images/search1.gif"
												class="input_button9" value="查询" onClick="openfind();" />
											<div id="addnew" style="display:none">
											</div>
											<div id="find" style="display:none">
												<form name="" method="post" action="../wd/wdlist.do">
													
													报修记录状态：
													<select  name="rs" >
														<option value="">所有</option>
														<option value="0">处在报修</option>
														<option value="1">结束报修</option>
														<option value="2">正在申请</option>
														<option value="3">银行确认</option>
													</select>
													&nbsp;
													小组分配状态:
													<select  name="as" >
														<option value="">请选择</option>
														<option value="0">未分配小组</option>
														<option value="1">已分配小组</option>
													</select>
													&nbsp;&nbsp;
												   报修时间从：<input type="date" name="repairfrom"/>
												   至：<input  type="date" name="repairend"/>
												  &nbsp;报修完成时间从：<input type="date" name="endfrom"/>
												   至：<input type="date" name="endend"/>	
													<input type="image" src="../images/search2.gif"
														class="input_button9" title="搜索"></input>
												</form>
											</div>
										</td>
									</tr>
								</table>
								<br />
								<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="5%"></td>
							<td> 
							    
								<table width="100%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<caption align="right" ><a href="../wd/exportExcel.do">导出excel表</a>  </caption>
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="7%">
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
										<td bgcolor="#F2F2F2" align="center" width="18%">
											报修时间
										</td>
										<td bgcolor="#F2F2F2" align="center" width="9%">
											记录状态
										</td>
										<td bgcolor="#F2F2F2" align="center" width="18%">
											修完时间
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
										   ${repair.repairDateStr }
										</td>
										<td bgcolor="#FFFFFF">
										   <c:if  test="${repair.status == 0}">处在报修</c:if>
										   <c:if  test="${repair.status == 1}">结束报修</c:if>
										  <c:if  test="${repair.status == 2}">正在申请</c:if>
										   <c:if  test="${repair.status == 3}">银行确认</c:if>
										</td>
										 <td bgcolor="#FFFFFF">
										    ${repair.repairEndDateStr }
										   </td>
										<td bgcolor="#FFFFFF">
										   <c:if test="${repair.status == 1}">
											<a href="../wd/wdSureNeedRepair.do?repairId=${repair.repairId}&curpage=${pageinfo.curpage}" onclick="return(confirm('确实要确定吗?'))" ><img src="../images/fix.gif" title="确认维修" border="0"></a>
											 </c:if>
											<c:if test="${repair.status == 2}">
											  <a href="../wd/wdsure.do?repairId=${repair.repairId}&curpage=${pageinfo.curpage}" onclick="return(confirm('确实要提交吗?'))"><img src="../images/fix.gif" title="确认提交" border="0"></a>
									          <a href="../wd/towdupdate.do?repairId=${repair.repairId}&curpage=${pageinfo.curpage}"><img src="../images/fix.gif" title="修改" border="0"></a>
									          <a href="../wd/wddeleterepair.do?repairId=${repair.repairId}&curpage=${pageinfo.curpage}" onclick="return(confirm('确实要删除吗?'))" ><img src="../images/fix.gif" title="删除" border="0"></a>
									        </c:if>
									         <a href="../wd/sbbxview.do?repairId=${repair.repairId}"><img src="../images/fix.gif" title="查看" border="0"></a>
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
         <a href="../wd/wdlist.do?curpage=1">首  页</a>
         <a href="../wd/wdlist.do?curpage=${pageinfo.curpage}">上一页</a>
         </c:if>
         <c:if test="${pageinfo.curpage != pageinfo.totalPage}">
         <a href="../wd/wdlist.do?curpage=${pageinfo.curpage}">下一页</a>
         <a href="../wd/wdlist.do?curpage=${pageinfo.curpage}">尾  页</a>
         </c:if>
          第<input id="pagebox" type="text" size="4">页<a  href="#" onclick="goto('./sbbx!listw.do?pageinfo.curpage=');"> 跳转</a>
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

