<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'globalsupdate.jsp' starting page</title>
    
	<link rel="stylesheet" type="text/css" href="../css/main.css">

  </head>
  
  <body>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">

						<tr>
							<td width="2%" align="center">

							</td>
							<td width="98%">

								<span class="sys_list_yh">系统管理&gt;&gt;设备报修问题列表&gt;&gt;修改设备报修问题</span>
							</td>
						</tr>
  </table>
      
     <form action="../repairtype/updateType.do" method="post">
        <table align="center" border="1" width="60%">
           <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">问题编号</td><td><input name="faultRepairType.pitypeId" value="${type.typeId}" readonly="readonly"></td>
           </tr>
           <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">问题名称</td><td><input name="faultRepairType.pitypeValue" value="${type.typeValue}"></td>
           </tr>
            
        </table>
        <p align="center">
           <input type="submit" value="提交">
         
           <input type="button" value="返回" onclick="history.back();">
        </p>
     </form>
  </body>
</html>
