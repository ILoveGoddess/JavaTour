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

								<span class="sys_list_yh">系统管理&gt;&gt;银行设备明细列表&gt;&gt;修改银行设备明细</span>
							</td>
						</tr>
  </table>
     
     <form action="../bank/updateEqu.do" method="post">
        <table align="center" border="1" width="60%">
           <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">设备流水ID</td><td><input type="text" name="bankEquipment.equipmenteachId" value="${bem.equipmentEachId }" readonly="true"></td>
     </tr>
           <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">所属种类名</td>
       <td>
        <!-- 设备种类准备数据 -->
         <input type="hidden" name="bankEquipment.equipmenttype.equipmentId" value="${bem.equipmentId}">
         <input type="text" name="bankEquipment.equipmenttype.equipmentName" value="${bem.equipmentName }" readonly="true">
       </td>
           </tr>
            <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">所在银行</td>
        <td>
        <!-- 银行网点准备数据 -->
         <input type="text" name="bankEquipment.bank.bankName" value="${bem.bankName}" readonly="true">
         <input type="hidden" name="bankEquipment.bank.bankId"  value="${bem.bankId}" >
        </td>
           </tr>
            <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">购入价值</td><td><input type="text" name="bankEquipment.equipmentValue" value="${bem.equipmentValue }" readonly="true"></td>
       </tr>
            <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">购入时间</td>
        <td>
      
         <input name="bankEquipment.equipmentBuydate"   value="${bem.equipmentBuyDate }"  readonly="true"  >
      
        </td></tr>
            <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">设备状态</td>
        <td>
        	<select name="status">      		
        		<option <c:if test="${bem.status == 0}">selected</c:if> value="0">设备正常</option>
        		<option  <c:if test="${bem.status == 1}">selected</c:if> value="1">报检设备</option>
        		<option <c:if test="${bem.status == 2}">selected</c:if> value="2">停用设备</option>	
        	</select>
        </td>
           </tr>
            <tr>
             <td bgcolor="#F2F2F2" align="center" width="30%">设备折旧残值</td><td><input type="text" name="bankEquipment.depreciationValue" value="${bem.depreciationValue}"></td>
       </tr>
        </table>
        <p align="center">
           <input type="submit" value="提交">
           <input type="button" value="取消" onclick="history.back();">
        </p>
     </form>
  </body>
</html>
