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
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="2%" align="center"></td>
				<td width="98%">
					<span class="sys_list_yh">系统管理</span>
					<span>&gt;&gt;</sapn>
					<sapn>银行设备明细列表</sapn>
					<sapn>&gt;&gt;</span>
					<span>新增银行设备明细</span>
				</td>
			</tr>
		</table>
     	<form action="../bank/addEqu.do" method="post" onsubmit="return checkBankEquId('bankEquId');">
        	<table align="center" border="1" width="60%">
           		<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">设备流水ID</td>
             		<td>
	             		<input type="text" name="bankEquipment.equipmenteachId" onblur="checkBankEquId('bankEquId');"id="bankEquId">(不能使用汉字且长度小于10位)
	             		<span id="show"></span>
             		</td>
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">所属种类名</td>
             		<td> 
						<select name="equipmentId">
	          				<c:forEach items="${equipmentTypes}" var="equ">
	          					<option value="${equ.equipmentId }">${equ.equipmentName }</option>
	          				</c:forEach>
          				</select>
             		</td>
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">所在银行</td>
        			<td>
	        			<!-- 银行网点准备数据 -->
	             		<input type="hidden" name="bankEquipment.bank.bankId" value="${bankId }">
	             		<input type="text" name="bankEquipment.bank.bankName" value="${bankName }" readonly="true">
        			</td>
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">购入价值</td>
             		<td>
             			<input type="text" name="bankEquipment.equipmentValue">
             		</td>
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">购入时间</td>
		     		<td>
		        		<input type="date" name="equipmentBuyDate"/>
		     		</td>      
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">设备状态</td>
			        <td>
			        	<select name="status">       		
			        		<option value="0">设备正常</option>
			        		<option value="1">报检设备</option>
			        		<option value="2">停用设备</option>     		
			        	</select>
			        </td>
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">设备折旧残值</td>
             		<td>
             			<input type="text" name="bankEquipment.depreciationValue">
             		</td>
           		</tr>
        	</table>
        	<p align="center">
	        	<input type="submit" value="保存"> 
	        	<input type="button" value="取消" onclick="history.back();">
        	</p>
     	</form>
	</body>
</html>