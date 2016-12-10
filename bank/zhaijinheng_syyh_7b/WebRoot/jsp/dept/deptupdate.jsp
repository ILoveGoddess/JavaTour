<%@ page language="java" pageEncoding="utf-8"%>


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

								<span class="sys_list_yh">系统管理&gt;&gt;部门列表&gt;&gt;修改部门</span>
							</td>
						</tr>
  </table>
     
    <form action="../dept/updateDept.do?departmentId=${dept.departmentId }" method="post">
        <table align="center" border="1" width="60%">
          <tr>
          <td bgcolor="#F2F2F2" align="center" width="30%">部门编号</td><td>  <input name="dept.departmentId" readonly="true" value="${dept.departmentId }"></td>
          </tr>
           <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">部门名称</td><td><input type="text" name="dept.departmentName" value="${dept.departmentName }">
        
         </td>
        </table>
        <p align="center">
           <input type="submit" value="修改">
         
           <input type="button" value="返回" onclick="history.back();">
        </p>
     </form>
  </body>
</html>
