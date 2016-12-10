<%@ page language="java" pageEncoding="utf-8"%>
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
					<span class="sys_list_yh">系统管理&gt;&gt;银行网点列表&gt;&gt;新增银行网点</span>
				</td>
			</tr>
		</table>
		<form action="../bank/addBank.do" method="post" onsubmit="return  checkBankId('bankId');">
        	<table align="center" border="1" width="60%">
				<tr>
					<td bgcolor="#F2F2F2" align="center" width="30%">银行编号</td><td><input type="text" name="bank.bankId" onblur="checkBankId('bankId');"  id="bankId">(不能使用汉字且长度小于10位)
						<span id="show"></span>
					</td>
				</tr>
				<tr>
					<td bgcolor="#F2F2F2" align="center" width="30%">银行名称</td><td><input type="text" name="bank.bankName"></td>
				</tr>
				<tr>
					<td bgcolor="#F2F2F2" align="center" width="30%">银行位置经度</td><td><input type="text" name="bank.bankLongitude"></td>
				</tr>
				<tr>
					<td bgcolor="#F2F2F2" align="center" width="30%">银行位置纬度</td><td><input type="text" name="bank.bankLatitude"></td>
				</tr>
				<tr>
					<td bgcolor="#F2F2F2" align="center" width="30%">银行IP</td><td><input type="text" name="bank.bankIp">(Ip格式:xxx.xxx.xxx.xxx)</td>
				</tr>
			</table>
			<p align="center">
				<input type="submit" value="保存"> 
				<input type="button" value="取消" onclick="history.back();">
			</p>
		</form>
	</body>
</html>
