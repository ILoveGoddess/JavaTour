<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>网点新增设备报修</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/selecttime1.js"> </script>
    <script type="text/javascript" src="../js/ajaxsbmx.js"></script>
    <script type="text/javascript">
    function ckick(){
       var wtlxs=document.getElementById("sbmx");
       if(wtlxs.value==""){
         alert("请选择设备明细");
          return false;
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
							<span class="sys_list_yh">网点&gt;&gt;新增设备报修</span>
							</td>
						</tr>
					 </table>
					 <br />
				       <form action="../wd/wdaddrepair.do" method="post" onsubmit="return ckick();" >
				         <%--<input id="wdxx" type="hidden"  name="po.bank.bankId"  value="${wdid }" >
					     --%><input type="hidden" name="po.users.loginId" value="${user.loginId }" > 
				         <input type="hidden" name="po.repairStatus" value="2" >
				   
				    <table width="50%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4"><%--
					       <tr>
					      <td>设备种类</td>
					       <td>
					          <s:select id="sbzl" name="po.equipmenttype.equipmentId"  list="#request.sbzls"  listKey="equipmentId"  listValue="equipmentName" theme="simple" onchange="checksbmx();" ></s:select>
					          
					       <select id="sbzl" name="po.equipmenttype.equipmentId" onchange="checksbmx();">
					       		<c:forEach items="${equTypes}" var="equType">
					       			<option value="${equType.equipmentId }">${equType.equipmentName}</option>
					       		</c:forEach>
					       </select>   
					       </td>
					     </tr>
					     <tr>
					   --%><td>设备流水号</td>
					       <td>
					        <select id="sbmx" name="po.bankEquipment.equipmenteachId" >
					         
					          <c:forEach items="${eachIds}" var="id">
					            <option  value="${id }">${id }</option>
					          </c:forEach>
					        </select>
					       </td>
					     </tr>
					    
					    
					    <tr align="center" >
					      <td colspan="2" ><input type="submit"  value="新增"  > 
					      <input type="button" value="取消" onclick="history.go(-1)">
					       </td>
					    </tr>
					      
					 </table>
				 </form>
			   	</td>
			   	</tr>
			   </table>
			   		 
  </body>
</html>
