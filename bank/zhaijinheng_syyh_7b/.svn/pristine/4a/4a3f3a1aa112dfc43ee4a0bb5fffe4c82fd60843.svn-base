<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>My JSP 'globalsnew.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/check.js"></script>

  </head>
  
  <body>
  		<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td width="2%" align="center">

							</td>
							<td width="98%">

								<span class="sys_list_yh">系统管理&gt;&gt;银行设备种类管理列表&gt;&gt;新增银行设备种类管理</span>
							</td>
						</tr>
					</table>
   
     <form action="../equipmentType/addEqu.do" method="post" onsubmit="return checkdata();">
        <table align="center" border="1" width="75%">
        
           <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">设备种类ID</td><td><input type="text" name="equipmenttype.equipmentId" onblur="checkEquipmentId('EqumentId');" id="EqumentId">(不能使用汉字且长度小于10位)
             <span id="show"></span>
             </td>
           </tr>
           
           <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">设备名称</td><td><input type="text" name="equipmenttype.equipmentName" onchange="checkEquipmentName('EqumentName')" id="EqumentName"> <span id="show1"></span></td>
           </tr>
           
        </table>
        <p align="center">
          <input type="submit" value="保存"> 
        
          <input type="button" value="返回" onclick="history.back();">
        </p>
     </form>
  </body>
</html>
