<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




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
	
    <table width="80%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#E4E4E4">



		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="2%" align="center">
							</td>
							<td width="98%">
								<span class="sys_list_yh">系统管理&gt;&gt;巡检组信息</span>
							</td>
						</tr>
					</table>									
					<br/>					
					<table width="80%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="5%"></td>
						       <br/>
								<p align="center">巡检组信息</p>
								<table width="80%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<tr>										
										<td bgcolor="#F2F2F2" align="center" width="50%">
											巡检组名称
										</td>
										<td bgcolor="#FFFFFF">${group.groupName }</td>																																	
									</tr>																		
								</table>
					<p align="center">巡检工基本信息</p>
    <table width="80%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#E4E4E4">

      <tr>
        <td bgcolor="#F2F2F2" align="center" width="15%">巡检工编号</td>
        <td bgcolor="#F2F2F2" align="center" width="15%">巡检工姓名</td>
        <td bgcolor="#F2F2F2" align="center" width="15%">电话1</td>
        <td bgcolor="#F2F2F2" align="center" width="15%">电话2</td>
              
      </tr>
      <c:forEach items="${list}" var="worker">
        <tr>
         <td bgcolor="#FFFFFF" align="center">${worker.workerId}</td>
         <td bgcolor="#FFFFFF" align="center">${worker.workerName}</td>
         <td bgcolor="#FFFFFF" align="center">${worker.workerTel1}</td>
         <td bgcolor="#FFFFFF" align="center">${worker.workerTel2}</td>
                                
        </tr>
      </c:forEach>
    </table>
		</tr>
		</table>

		<p align="center"><input type="submit" value="返回" onclick="history.back();"></p>
	</body>
</html>

