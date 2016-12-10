<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link href="css_js/general.css" rel="stylesheet" type="text/css"></link>
<link href="css_js/calendar.css" rel="stylesheet" type="text/css"></link>
<script src="css_js/popup.js" type="text/javascript"></script>
<script src="css_js/jquery.form.js" type="text/javascript"></script>
<script src="css_js/cal.js" type="text/javascript"></script>
<title>销售收款单新建</title>
<style type="text/css">
table{
	border-collapse:collapse;
	
}
table td{
	border:1px solid #c3d6ec;
	font-size:12px;
	color:#444444;
}
.productInput1,.productInput2{
	width:79px;
	height:18px;
	background-color:#eef3f8;
	border:none;
	border-bottom:1px #ccc solid;
}
.productInput2{
	width:50px;
}
.productInput21 {	width:79px;
	height:18px;
	background-color:#eef3f8;
	border:none;
	border-bottom:1px #ccc solid;
}
.style_1{
	border:none;
	border-bottom:1px #999999 solid;
	background-color:#ffffff;
	width:95%;
	
}
</style>
<script type="text/javascript">

jQuery(document).ready(function () {
	$('#payDate').simpleDatepicker({ startdate: 1960, enddate: 2060 });
 	//是否已经有了数据
	
	if('' != '${gather.payDate}'){
		$('#payDate').val('${gather.payDate}');
	}
	else if('' != '${c_time}'){
		$('#payDate').val('${c_time}');
	}else{
		$('#payDate').val('点击显示时间列表');
	}

	if('' != '${gather.createTime}'){
		$('#createTime').val('<s:date name="#request.gather.createTime" format="yyyy-MM-dd HH:mm:ss" nice="false" />');
	}
	else if('' != '${c_time}'){
		$('#createTime').val('${c_time}');
	}else{
		$('#createTime').val('点击显示时间列表');
	}

	if('' != '${gather.updateTime}'){
		$('#updateTime').val('<s:date name="#request.gather.updateTime" format="yyyy-MM-dd HH:mm:ss" nice="false" />');
	}
	else if('' != '${c_time}'){
		$('#updateTime').val('${c_time}');
	}else{
		$('#updateTime').val('点击显示时间列表');
	}
	
	//判断状态显示时间颜色
	
	if($('#payDate').val()!="点击显示时间列表"){
		$('#payDate').removeClass("addTimeInit");
		$('#payDate').addClass("addTimeClick");
	}
	
	
});
jQuery(document).ready(function () {
	if('${gather.creater}' != ""){
		$("#creater").val('${gather.creater}');
	}else{
		$("#creater").val('${user.name}');
	}

});
</script>

<script type="text/javascript">
function submitForm(){
		var objs = document.getElementsByName("gatherChecked");
		var ids = "";
		var money = 0;
		for(var i = 0 ; i < objs.length; i++){
			if(objs[i].checked){
				ids += objs[i].value + ",";
				money += document.getElementById(objs[i].value).value * 1;
				alert("aaaaaaaaaaaaaaaaaaa");
			}
		}
		if(ids == ""){
			alert("至少选择一项应收款项!");
		}else if(money == 0){
			alert("所选择的应收款项中应收款为0!");
		}else{
			document.getElementById("total").value = money;
			document.getElementById("ids").value = ids;
			if($('#payDate').val()=="点击显示时间列表"){
				$('#payDate').val("");
			}
			document.getElementById("gatherForm").submit();
		}
		
	
}


function openWindow4ToDraft(){
	window.open("auditReason.jsp","_blank",
	"width=740,height=380,toolbar=no,menubar=no,resizable=no,status=no,scrollbars=yes");
}
</script>
</head>
<body>
<s:fielderror></s:fielderror>
<form name="gatherForm" method="post" id="gatherForm" action="receivablesClass/addReceivables">
<input type="hidden" name="pageFlag" value="gather" id="pageFlag"/>
<input type="hidden" name="total" id="total" value="${receivables.total}"/>
<input type="hidden" name="ids" id="ids" value="${receivables.ids}"/>
<input type="hidden" name="CId"  value="${receivables.id}"/>
<input type="hidden" name="CType"  value="${receivables.CType}"/>
<input type="hidden" name="edit_id"  value="${receivables.edit_id}"/>
<input type="hidden" name="auditIdea" value="${receivables.auditIdea}" id="auditReason"/>
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_main_table">
	<tr>
    	<td height="26" width="100%"> <span style="color:#002450; font-size:13px; font-weight:bold;">　销售收款单--新建</span></td>
	</tr>
</table>
			<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_content">
              <tr>
                <td height="12"></td>
              </tr>
              <tr>
                <td valign="middle" >
                <s:if test="#request.needGatherSize==null">
                	<img src="image/s10.gif" width="58" height="22" onclick="submitForm();"><img src="image/s8.gif" width="59" height="22">
                </s:if>
                <s:elseif test="#request.needGatherSize==0">
                	<img src="image/s10.gif" width="58" height="22" onclick="submitForm();"><img src="image/s8.gif" width="59" height="22">
                </s:elseif>
                <s:elseif test="#request.gather.status=='草稿'">
                	<img src="image/s10.gif" width="58" height="22" onclick="submitForm();"><img src="image/tijiao.gif" onclick="javascript:window.location.href='gatherSubmit.action?edit_id=${edit_id}&CId=${cId }'"><img src="image/s8.gif" width="59" height="22">
                </s:elseif>
                <s:elseif test="#request.gather.status=='待审核'">
                	<img src="image/shenhe.gif" onclick="javascript:window.location.href='gatherAuditingPass.action?edit_id=${edit_id}&CId=${cId }'"><img src="image/bohui.gif" onclick="openWindow4ToDraft();"><img src="image/s8.gif" width="59" height="22">
                </s:elseif>
                <s:else>
                	<img src="image/s8.gif" width="59" height="22">
                </s:else>
                <span style="font-size:12px;color:#009900;"></span></td>
              </tr>
              <tr>
               <td id="errorInfo" style="font-size:12px;color:red;">${mess }</td>
              </tr>
              <tr>
                <td valign="middle" ><table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">客户基本信息</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td width="10%">客户编码:</td>
                            <td width="41%" style="background-color:#FFFFFF;">${receivables.clientCode }</td>
                            <td width="7%" align="left"><span style="color:#FF0000">客户名称:</span></td>
                            <td style="background-color:#FFFFFF;"><input type="text" name="cName" value="${clientCode.name}" class="addCText" readonly="readonly">
                            <img src="image/dakaichuangkou.gif" width="21" height="19"></td>
                          </tr>
                          <tr>
                            <td>客户等级:</td>
                            <td  style="background-color:#FFFFFF;">${clientCode.grade}</td>
                            <td align="left">区域名称:</td>
                            <td  style="background-color:#FFFFFF;">${clientCode.regionName}</td>
                            </tr>
                          <tr>
                            <td>省份:</td>
                            <td  style="background-color:#FFFFFF;">${clientCode.province}</td>
                            <td align="left">城市:</td>
                            <td  style="background-color:#FFFFFF;">${clientCode.city}</td>
                          </tr>
                          <tr>
                            <td>联系地址:</td>
                            <td  style="background-color:#FFFFFF;">${clientCode.address}</td>
                            <td align="left">电子邮件:</td>
                            <td  style="background-color:#FFFFFF;">${clientCode.email}</td>
                          </tr>
                          <tr>
                            <td>电话一:</td>
                            <td  style="background-color:#FFFFFF;">${clientCode.tel1}</td>
                            <td align="left">电话二:</td>
                            <td  style="background-color:#FFFFFF;">${clientCode.tel2}</td>
                          </tr>
                        </table>
        </td>
                  </tr>
                </table>
				
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">收款单信息</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td width="134">收款单号:</td>
                            <td width="562"  style="background-color:#FFFFFF;"><input type="text" name="code" class="style_1" value="${todayStr}${clientCode.code}"></td>
                            <td width="93" align="left">收款时间:</td>
                            <td width="580"  style="background-color:#FFFFFF;"><input type="text" name="payDate" class="style_1" value="" id="payDate"></td>
                            </tr>
                          <tr>
                            <td>付款人:</td>
                            <td  style="background-color:#FFFFFF;"><input type="text" name="payer" class="style_1" value="${clientCode.payer }"></td>
                            <td align="left">经手人:</td>
                            <td  style="background-color:#FFFFFF;"><input type="text" name="handler" class="style_1" value="${clientCode.handler }"></td>
                          </tr>
                          <tr>
                            <td>付款方式:</td>
                            <td  style="background-color:#FFFFFF;">
                            <select name="payType" class="addCText">
                              <option value="支付宝">支付宝</option>
                              <option value="支票">支票</option>
                              <option value="现金支付">现金支付</option>
                              <option value="银行转账">银行转账</option>
                            </select>
                           </td>
                            <td align="left">单据号:</td>
                            <td  style="background-color:#FFFFFF;"><input type="text" name="billCode" class="style_1" value="${clientCode.billCode }"></td>
                          </tr>
                          <tr>
                            <td>备注:</td>
                            <td colspan="3"><textarea name="remark" class="addCText2">${clientCode.remark }</textarea></td>
                            </tr>
                        </table>
     </td>
                  </tr>
                </table>
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">应收款项列表</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td width="63">选择:</td>
                            <td width="220">销售单号:</td>
                            <td width="230" align="left">应收金额:</td>
                            <td width="259">已收金额:</td>
                            <td width="316">应收余额:</td>
                            <td width="281">收款金额:</td>
                          </tr>
	                          <c:forEach items="${newPageList }" var="newPageList">
		                          <tr>
		                            <td align="center">
		                           		<input type="checkbox" name="gatherChecked" value="${newPageList.id}">
		                            </td>
		                            <td>${clientCode.saleCode } </td>
		                            <td align="left">${newPageList.total}</td>
		                            <td>${clientCode.payed}</td>
		                            <td>${clientCode.balance}</td>
		                            <td>
			                            <span style="background-color:#FFFFFF;">
			                            	<input type="text" name="money" id="${clientCode.id}" class="style_1" value="${clientCode.total - clientCode.payed}" readonly="readonly">
			                            </span>
		                            </td>
		                          </tr>
	                          </c:forEach>
                        </table>
          </td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">驳回原因</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          
                           <tr>
                            <td width="66">驳回原因:</td>
                            <td colspan="4"><textarea name="remark" class="addCText2" readonly="readonly">${clientCode.auditIdea}</textarea></td>
                            </tr>
                        </table>
              </td>
                  </tr>
                </table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">其他信息</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td width="7%">创建人:</td>
                            <td width="42%"><input name="creater" type="text" class="addCText" id="creater" readOnly="readOnly">
                            </td>
                            <td width="9%" align="left">创建日期:</td>
                            <td width="40%"><input name="createTime" id="createTime" value="${c_time}${clientCode.createTime}" type="text" class="addCText" id="createTime" readOnly="readOnly"></td>
                            <td width="2%">&nbsp;</td>
                            </tr>
                          <tr>
                            <td>修改人:</td>
                            <td><input name="updater" type="text" class="addCText" value="${user.name}" id="updater" readOnly="readOnly"></td>
                            <td align="left">修改日期:</td>
                            <td><input name="updateTime" type="text" value='${c_time}' class="addCText" id="updateTime" readOnly="readOnly"></td>
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
                <td valign="middle" ></td>
              </tr>
			  <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
            </table>
</form>
</body>
</html>
