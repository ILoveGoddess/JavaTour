<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>银行设备种类管理展现</title>
    
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
		if(val>${pageinfo.totalPage} || val<1){
			$("#pagebox").val(${pageinfo.curpage});
		}
	});
	
});

function goto2(u) {
    var url = u;
    var v = document.getElementById("pagebox").value;
    var i=${pageinfo.totalPage} ;
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
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td width="2%" align="center">

							</td>
							<td width="98%">

								<span class="sys_list_yh">系统管理&gt;&gt;银行设备种类管理列表</span>
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
												class="input_button9" value="新增" onclick="window.location.href='../equipmentType/toAddEqu.do'" />
								<table width="100%" border="0" align="center" cellpadding="2"
									cellspacing="1" bgcolor="#E4E4E4">
									<tr>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											设备种类ID
										</td>
										<td bgcolor="#F2F2F2" align="center" width="15%">
											设备种类名称
										</td>
										
										<td bgcolor="#F2F2F2" align="center" width="15%">
											操作
										</td>
									</tr>
									 <c:forEach items="${pageinfo.pagedata}" var="equ">
									<tr align="center">
										<td bgcolor="#FFFFFF">
											${equ.equipmentId}
										</td>
										<td bgcolor="#FFFFFF">
											${equ.equipmentName}
										</td>
										
										<td bgcolor="#FFFFFF">
											<a href="../equipmentType/toUpdateEqu.do?equipmentId=${equ.equipmentId}&equipmentName=${equ.equipmentName}"><img src="../images/fix.gif" title="编辑" border="0"></a>
									     &nbsp;&nbsp;
									     <c:if test="${equ.equipmentTypeCount == 0}">
									        <a href="../equipmentType/deleteEqu.do?equipmentId=${equ.equipmentId}"><img src="../images/del.gif" title="删除"  onClick="return confirm('确定删除此信息吗？')" border="0"></a>
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
									<font color="black">每页</font><font color="black"> ${pageinfo.pageSize}</font><font color="black">项&nbsp;
									<font color="black">当前第</font><font color="black">${pageinfo.curpage}</font>
									<font color="black">页&nbsp;
									<font color="black">共</font><font color="black">${pageinfo.totalPage}</font>
									<font color="black">页&nbsp;
									  <c:if test="${pageinfo.curpage != 1}">
								         <a href="../equipmentType/equipmentTypeList.do?curpage=1">首  页</a>
								         <a href="../equipmentType/equipmentTypeList.do?curpage=${pageinfo.curpage-1}">上一页</a>
								      </c:if>
								      <c:if test="${pageinfo.curpage != pageinfo.totalPage}">
								         <a href="../equipmentType/equipmentTypeList.do?curpage=${pageinfo.curpage+1}">下一页</a>
								         <a href="../equipmentType/equipmentTypeList.do?curpage=${pageinfo.totalPage}">尾页</a>
								      </c:if> <input id="pagebox" size="1" name="pagebox"></input>&nbsp;
								              <a onclick="goto2('../equipmentType/equipmentTypeList.do?curpage=');" href="#">跳转</a>&nbsp;
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
