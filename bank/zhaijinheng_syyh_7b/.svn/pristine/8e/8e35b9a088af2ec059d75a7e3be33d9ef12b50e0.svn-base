<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>维修工维修1</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
    <style type="text/css" media="screen">
			body{
				font: 11px arial;
			}
			td{
				font: 11px arial;
			}
			.suggest_link {
				background-color:#ffffff;
				padding: 2px 6px 2px 6px;
			}
			.suggest_link_over {
				background-color: #00ffff;
				padding: 2px 6px 2px 6px;
			}
			#search_suggest
			{
				position:absolute; 
				background-color:#0000FF; 
				text-align:left; 
				border: 1px solid #000000;
			}		
		</style>
		<script language="JavaScript" type="text/javascript" src="../js/ajax_search.js"></script>

  <script type="text/javascript">
    function ckick(){
       var wtlxs=document.getElementById("txtSearch");
       if(wtlxs.value==""){
         alert("设备报修问题类型能为空");
         wtlxs.focus();
         return false;
       }
       var sbwxqkm = document.getElementById("sbwxqkms");
       if(sbwxqkm.value==""){
         alert("设备维修情况描述");
         sbwxqkm.focus();
         return false;
       }
       
    }
  </script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
		<tr>
			<td width="2%" align="center">
			</td>
			<td width="98%">
				<span class="sys_list_yh">维修工&gt;&gt;维修</span>
			</td>
		</tr>
	</table>
	<br><br>
	  <form  method="post" action="../wxg/repairOver.do" onsubmit="return ckick();" >
	   <input type="hidden"  name="po.repairid"  value="${repair.repairId }" >
	  
	   <table width="60%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
		
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备报修序列号</td><td>${repair.repairId }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">银行设备编号</td><td>${repair.equipmentEachId }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备种类名称</td><td>${repair.equipmentName }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">设备报修时间</td><td>${repair.repairDateStr }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" align="center">
			<td width="40%">分配小组</td>
			<td>${repair.groupName }</td>
		</tr>
		<tr height="25"  bgcolor="#F2F2F2" >
			<td width="40%" align="center" >设备报修问题类型</td>
			<td>
		        <%--<input type="text" id="txtSearch" name="wtlx" value="${repair.repairEvaluation }"  onkeyup="searchSuggest('txtSearch','search_suggest');" autocomplete="off" />
				--%>
				<select name="repairType">
				<c:forEach items="${list}" var="type">
					<option value="${type.typeId }">${type.typeValue }</option>
				</c:forEach>
				</select>
				<input type="button" id="cmdSearch" name="cmdSearch" value="创建" alt="Run Search"  onclick="window.location.href='../wxg/addnewType.do?repairId=${repair.repairId }'"  /><br />
			
			<div id="search_suggest">
		    </div>
		    </td>
			
		</tr>
		<tr height="25"  bgcolor="#F2F2F2">
			<td width="40%" align="center" >设备维修情况描述</td>
			<td><textarea id="sbwxqkms"  rows="5" cols="30" name="po.faultRepairEvaluation" ></textarea>  </td>
		</tr>
		<tr align="center"  > 
		  <td colspan="2"  >
		   <input type="submit"  value="确定"  > 
					      <input type="button" value="取消" onclick="history.go(-1)">
		   </td>
		 
		</tr>
	</table>
	</form>
  </body>
</html>
