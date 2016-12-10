<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css_js/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>

<script type="text/javascript">
function submitForm(){
	document.getElementById("userGroupForm").submit();
}



</script>
</head>
<body>
<form name="userGroupForm" method="post" id="userGroupForm" action="deptManagerClass/addDeptManager">
<input type="hidden" name="edit_id" id="edit_id" value="" />
<s:fielderror></s:fielderror>
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_main_table">
              <tr>
                <td height="26" width="100%"> <span style="color:#002450; font-size:13px; font-weight:bold;">　部门新建</span></td>
              </tr>
</table>
			
			<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_content">
              <tr>
                <td height="12"></td>
              </tr>
              <tr>
                <td valign="middle" >
	                <img src="image/s10.gif" width="58" height="22" style="cursor: pointer;" onclick="submitForm();">
	                <img src="image/s8.gif" width="59" height="22">
                </td>
              </tr>
               <tr>
               <td id="errorInfo" style="font-size:12px;color:red;">${mess }</td>
              </tr>
              <tr>
                <td valign="middle" ><table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif">
                    <img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">基本信息</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td width="10%">部门名称:</td>
                            <td width="37%"><input type="text" name="name" value="${userGroup.name }" class="addCText"></td>
                            <td width="10%" align="left">上级部门:</td>
                            <td width="42%">
	                            <select name="pid" class="addCText">
	                            	<option value="0">/</option>
	                            	<span>${str }</span>
	                            </select>
	                       	</td>
                            <td width="1%">&nbsp;</td>
                          </tr>
                          <tr>
                            <td>部门负责人:</td>
                            <td><input type="text" name="principal" value="${userGroup.principal}" class="addCText"></td>
                            <td align="left">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>部门职能</td>
                            <td colspan="3"><textarea name="incumbent"  class="addCText2">${userGroup.incumbent}</textarea></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>备注</td>
                            <td colspan="3"><textarea name="remark" class="addCText2">${userGroup.remark}</textarea></td>
                            <td>&nbsp;</td>
                          </tr>
                        </table>
                   </td>
                  </tr>
                </table>				</td>
              </tr>
			  <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
            </table>
</form>
</body>
</html>
