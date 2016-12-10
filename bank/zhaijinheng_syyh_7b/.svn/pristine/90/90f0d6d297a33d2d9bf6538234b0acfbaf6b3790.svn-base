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
				<td width="2%" align="center"></td>
				<td width="98%">
					<span class="sys_list_yh">系统管理</span>
					<span>&gt;&gt;</span>
					<span>银行网点管理</span>
					<span>&gt;&gt;</span>
					<span>修改银行网点</span>
				</td>
			</tr>
		</table>
		<form action="../bank/updateBank.do" method="post">
			<table align="center" border="1" width="60%">
				<tr>
           			<td bgcolor="#F2F2F2" align="center" width="30%">银行编号</td>
           			<td>
           				<input type="text" name="bank.bankId" value="${bank.bankId }" readonly="true">
           			</td>
          		</tr>
           		<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">银行名称</td>
             		<td>
             			<input type="text" name="bank.bankName" value="${bank.bankName }">
             		</td>
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">银行位置经度</td>
             		<td>
             			<input type="text" name="bank.bankLongitude" value="${bank.bankLongitude }">
             		</td>
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">银行位置纬度</td>
             		<td>
             			<input type="text" name="bank.bankLatitude" value="${bank.bankLatitude }">
             		</td>
           		</tr>
            	<tr>
             		<td bgcolor="#F2F2F2" align="center" width="30%">银行IP</td>
             		<td>
             			<input type="text" name="bank.bankIp" value="${bank.bankIp }">
             		</td>
           		</tr>
        	</table>
        	<p align="center">
           		<input type="submit" value="修改">
            	<input type="button" value="取消" onclick="history.back();">
        	</p>
		</form>
	</body>
</html>
