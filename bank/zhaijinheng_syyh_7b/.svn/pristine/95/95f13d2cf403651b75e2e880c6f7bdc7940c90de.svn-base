<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>银行设备明细展现</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
		<script type="text/javascript" src="../js/selecttime1.js"> </script>
		<script type="text/javascript" src="../js/jump.js"></script>
		<script type="text/javascript">
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
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="2%" align="center"></td>
							<td width="98%">
								<span class="sys_list_yh">系统管理</span>
								<span>&gt;&gt;</span>
								<span>银行设备明细列表</span>
							</td>
						</tr>
					</table>
					<span><br/></span>
					<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="5%"></td>
							<td>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td>
										<input name="button" type="image" src="../images/add.gif" class="input_button9" value="新增" onclick="window.location.href='../bank/toAddEqu.do?bankId=${pageinfo.pagedata}'" />
											<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#E4E4E4">
												<tr>
													<td bgcolor="#F2F2F2" align="center" width="10%">设备流水ID</td>
													<td bgcolor="#F2F2F2" align="center" width="10%">银行编号ID</td>
													<td bgcolor="#F2F2F2" align="center" width="15%">设备各类ID</td>
													<td bgcolor="#F2F2F2" align="center" width="15%">购入价格</td>
													<td bgcolor="#F2F2F2" align="center" width="15%">购入时间</td>
													<td bgcolor="#F2F2F2" align="center" width="10%">设备状态</td>
													<td bgcolor="#F2F2F2" align="center" width="10%">设备折旧残值</td>
													<td bgcolor="#F2F2F2" align="center" width="20%">操作</td>
												</tr>
												<c:forEach items="${pageinfo.pagedata}" var="bankEqu">
													<tr align="center">
														<td bgcolor="#FFFFFF">${bankEqu.equipmentEachId }</td>
														<td bgcolor="#FFFFFF">${bankEqu.bankName}</td>
														<td bgcolor="#FFFFFF">${bankEqu.equipmentName}</td>
														<td bgcolor="#FFFFFF">${bankEqu.equipmentValue }</td>
														<td bgcolor="#FFFFFF">${bankEqu.equipmentBuyDateStr }</td>
														<td bgcolor="#FFFFFF">
															<c:if test="${bankEqu.status == 0}">设备正常</c:if> 
															<c:if test="${bankEqu.status == 1}">报检设备</c:if>
															<c:if test="${bankEqu.status != 1 && bankEqu.status != 0}">停用设备</c:if>
														</td>
														<td bgcolor="#FFFFFF">${bankEqu.depreciationValue}</td>
														<td bgcolor="#FFFFFF">
															<a href="../bank/toUpdateEqu.do?equipmentEachId=${bankEqu.equipmentEachId }">
																<img src="../images/fix.gif" title="编辑" border="0">
															</a>
															<span>&nbsp;&nbsp;</span>
															<a href="../bank/deleteEqu.do?equipmenteachId=${bankEqu.equipmentEachId }">
																<img src="../images/del.gif" title="删除" onClick="return confirm('确定删除此信息吗？')" border="0">
															</a>
														</td>
													</tr>
												</c:forEach>
											</table>
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table0">
									<tr>
										<td width="35%"></td>
										<td width="62%">
											<p align="right">
												<font color="black">共</font>
												<font color="black">${pageinfo.totalRecord}</font>
												<font color="black">项&nbsp;</font>
												<font color="black">每页</font>
												<font color="black"> ${pageinfo.pageSize}</font>
												<font color="black">项&nbsp;</font>
												<font color="black">当前第</font>
												<font color="black">${pageinfo.curpage}</font>
												<font color="black">页&nbsp;</font>
												<font color="black">共</font>
												<font color="black">${pageinfo.totalPage}</font>
												<font color="black">页&nbsp;</font>
												<%--<font color="black">共</font>
												<font color="black">${pageinfo.allpage}</font>
												<font color="black"> 页  --%>
												<c:if test="${pageinfo.curpage != 1}">
													<a href="../bank/checkEqu.do?curpage=1">首 页</a>
													<a href="../bank/checkEqu.do?curpage=${pageinfo.curpage-1}">上一页</a>
												</c:if>
												<c:if test="${pageinfo.curpage != pageinfo.totalPage}">
													<a href="../bank/checkEqu.do?curpage=${pageinfo.curpage+1}">下一页</a>
													<a href="../bank/checkEqu.do?curpage=${pageinfo.totalPage}">尾页</a>
												</c:if>
												<input id="pagebox" size="1" name="pagebox" />
												<span>&nbsp;</span>
												<a onclick="goto('./listbankEquipment.do?m=list&');" href="#">跳转</a>
												<span>&nbsp;</span>
												<input id="totalpage" type="hidden" size="1" value="${pageinfo.totalPage }" name="totalpage"/>
											</p>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>