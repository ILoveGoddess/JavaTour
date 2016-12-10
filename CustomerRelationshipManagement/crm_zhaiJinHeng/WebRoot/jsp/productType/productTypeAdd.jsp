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
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<link href="css_js/index.css" rel="stylesheet" type="text/css"></link>
<title>添加商品类别</title>
<script type="text/javascript">
function submitForm(){
		document.getElementById("productTypeForm").submit();
}
</script>
</head>
<body STYLE='OVERFLOW:SCROLL;OVERFLOW-X:HIDDEN'>
<form name="form1" method="post" action="productType/addProductType" id="productTypeForm">
<input type="hidden" name="edit_id" id="edit_id" value="" />
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_main_table">
              <tr>
	              <c:if test="${productType.id==null }">
	              	<td height="26" width="100%"> <span style="color:#002450; font-size:13px; font-weight:bold;">　商品类别新建</span></td>
	              </c:if>
	              	<c:if test="${productType.id!=null }">
	              <td height="26" width="100%"> <span style="color:#002450; font-size:13px; font-weight:bold;">　商品类别修改</span></td>
              </c:if>
              </tr>
            </table>
			
			<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_content">
              <tr>
                <td height="12"></td>
              </tr>
              <tr>
                <td valign="middle" ><img src="image/s10.gif" width="58" height="22" style="cursor: pointer;" onclick="submitForm();"><img src="image/s8.gif" width="59" height="22"></td>
              </tr>
               <tr>
               <td id="errorInfo" style="font-size:12px;color:red;">${mess }</td>
              </tr>
              <tr>
                <td valign="middle" ><table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">基本信息</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td width="10%">商品类别名称:</td>
                            <td width="37%"><input type="text" name="name" class="addCText" value="${productType.name}"></td>
                            <td width="10%" align="left">商品类别编码:</td>
                            <td width="42%"><input type="text" name="code" class="addCText" value="${todayStr}${productType.code}"></td>
                            <td width="1%">&nbsp;</td>
                          </tr>
                          <tr>
                            <td>上一级:</td>
                            <td>
                            <select name="pid" class="addCText">
                            	<option value="0">/</option>
                            	<optin>${str }</optin>
                            </select>
                            </td>
                            <td align="left">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>备注</td>
                            <td colspan="3"><textarea name="remark" class="addCText2">${productType.remark}</textarea></td>
                            <td>&nbsp;</td>
                          </tr>
                        </table>
                    </td>
                  </tr>
                </table>
				
				</td>
              </tr>
			   <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
			   <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
			  <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
            </table>
</form>
</body>
</html>
