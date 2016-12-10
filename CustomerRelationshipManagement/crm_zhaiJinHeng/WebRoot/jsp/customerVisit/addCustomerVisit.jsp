<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<title>添加用户</title>
<script type="text/javascript">

jQuery(document).ready(function () {
	$('#nextTouchDate').simpleDatepicker({ startdate: 1960, enddate: 2060 });
	$('#time1').simpleDatepicker({ startdate: 1960, enddate: 2060 });
	$('#time2').simpleDatepicker({ startdate: 1960, enddate: 2060 });
 	//是否已经有了数据
	if('' != '${company.nextTouchDate}'){
		$('#nextTouchDate').val('${company.nextTouchDate}');
	}else{
		$('#nextTouchDate').val('点击显示时间列表');
	}
	if('' != '${company.time1}'){
		$('#time1').val('${company.time1}');
	}else{
		$('#time1').val('点击显示时间列表');
	}
	if('' != '${company.time2}'){
		$('#time2').val('${company.time2}');
	}else{
		$('#time2').val('点击显示时间列表');
	}
	//判断状态显示时间颜色
	if($('#nextTouchDate').val()!="点击显示时间列表"){
		$('#nextTouchDate').removeClass("addTimeInit");
		$('#nextTouchDate').addClass("addTimeClick");
	}
	if($('#time1').val()!="点击显示时间列表"){
		$('#time1').removeClass("addTimeInit");
		$('#time1').addClass("addTimeClick");
	}
	if($('#time2').val()!="点击显示时间列表"){
		$('#time2').removeClass("addTimeInit");
		$('#time2').addClass("addTimeClick");
	}
	if('${company.createTime}' != ""){
		$("#createTime").val('${company.createTime}');
	}
});
jQuery(document).ready(function () {
	if('${company.creater}' != ""){
		$("#creater").val('${company.creater}');
	}else{
		$("#creater").val('${user.name}');
	}

	if('${company.user.name}' != ""){
		$("#ownerUsr").val('${company.user.name}');
	}else{
		$("#ownerUsr").val('${user.name}');
	}

	ownerUsr
});


</script>

<script type="text/javascript">

function checkEmpty(){
	if($("#code").val() == ""){
		$("#errorInfo").text("客户编码不能为空!");
		return false;
	}
	if($("#name").val() == ""){
		$("#errorInfo").text("客户名称不能为空!");
		return false;
	}
	return true;
}
function getCityList(){
	//取得省份
	var province_str = $("#province_id").val();
	//将省份进行escape
	var queryString = {name:province_str};
	//通过ajax方式传递数据
	$.ajax({
		type:"post",
		url:"getCities.action",
		data:queryString,
		dataType:"json",
		success: function(msg) {
            $("#city_id").html("");
            var str = "<option value=1>---</option>";
            for(var i = 0; i < msg.SCities.length;i++){
            	//alert(msg.SCities[i].name);
            	str+="<option value="+msg.SCities[i].name+">"+msg.SCities[i].name+"</option>"
            }
            $("#city_id").html(str);
        }
	});
}

function getPinyinCode(){
	var str = $("#name").val();
	
	if(str != ""){
		var queryString = {name:str};
		$.ajax({
			type:"post",
			url:"getPinyinCode.action",
			data:queryString,
			dataType:"json",
			success: function(msg) {
	            $("#pycode").val(msg.name);
	        }
		});
	}
}
/*$(function(){
	var selects = ["customer_grade","region","source","trade","company_size","company_size","quality","company_dealin","company_choice1","company_choice2","company_choice3","company_choice4"];
	for(var i = 0; i < selects.length; i++){
		if($("#edit_id").val() != ""){
			initSelect(selects[i]);
		}
	}
	if($("#edit_id").val() != ""){
		initProvince();
		initCity();
	}
});*/

function initSelect(objname){
	var queryString = {code:objname};
	//通过ajax方式传递数据
	$.ajax({
		type:"post",
		url:"getDictinaryDetails.action",
		data:queryString,
		dataType:"json",
		success: function(msg) {
			$("#"+objname).html("");
			var str1 = "<option value=''>---</option>";
			for(var i = 0; i < msg.SDictionaryDetails.length; i++){
				if(msg.SDictionaryDetails[i].value == '<s:property value="region"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="grade"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="source"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="dealing"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="trade"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="scale"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="quality"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="choice1"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="choice2"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="choice3"/>'
					|| msg.SDictionaryDetails[i].value == '<s:property value="choice4"/>'
				){
					str1 += "<option value='"+msg.SDictionaryDetails[i].value+"' selected='selected'>"+msg.SDictionaryDetails[i].value+"</option>";
				}else{
					str1 += "<option value='"+msg.SDictionaryDetails[i].value+"'>"+msg.SDictionaryDetails[i].value+"</option>";
				}
				
			}
			$("#"+objname).html(str1);
		}
	
	});
}

function initProvince(){
	$.ajax({
		type:"post",
		url:"getProvinceList.action",
		dataType:"json",
		success: function(msg) {
			$("#province_id").html("");
			var str1 = "<option value=''>---</option>";
			for(var i = 0; i < msg.SProvinceList.length; i++){
				if(msg.SProvinceList[i].name == '<s:property value="province"/>'){
					str1 += "<option value='"+msg.SProvinceList[i].name+"' selected='selected'>"+msg.SProvinceList[i].name+"</option>";
				}else{
					str1 += "<option value='"+msg.SProvinceList[i].name+"'>"+msg.SProvinceList[i].name+"</option>";
				}
			}
			$("#province_id").html(str1);
			initCity();
		}
	});
}

function initCity(){
	var queryString = {name:'<s:property value="province"/>'};
	$.ajax({
		type:"post",
		url:"getCities.action",
		dataType:"json",
		data:queryString,
		success: function(msg) {
			$("#city_id").html("");
			var str1 = "<option value=''>---</option>";
			for(var i = 0; i < msg.SCities.length; i++){
				if(msg.SCities[i].name == '<s:property value="city"/>'){
					str1 += "<option value='"+msg.SCities[i].name+"' selected='selected'>"+msg.SCities[i].name+"</option>";
				}else{
					str1 += "<option value='"+msg.SCities[i].name+"'>"+msg.SCities[i].name+"</option>";
				}
			}
			$("#city_id").html(str1);
		}
	});
}
function submitForm(){
	if(checkEmpty()){
		if($('#nextTouchDate').val()=="点击显示时间列表"){
			$('#nextTouchDate').val("");
		}
		if($('#time1').val()=="点击显示时间列表"){
			$('#time1').val("");
		}
		if($('#time2').val()=="点击显示时间列表"){
			$('#time2').val("");
		}
		document.getElementById("ownerUsr").value="${user.id}";
		
		var edit_id = document.getElementById("edit_id").value;
		if(edit_id != ""){
			document.getElementById("addCompanyForm").action = "editCompany.action";
		}
		document.getElementById("addCompanyForm").submit();
		
		/*var queryString = $('#addCompanyForm').formSerialize();
		
		$.ajax({
			type:"post",
			url:"addCompany.action",
			data:queryString,
			dataType:"json",
			success: function(msg) {
				$("#errorInfo").html(msg.msg);
				$("#edit_id").val(msg.edit_id);
				alert($("#edit_id").val());
	        }
		});*/
	}
}
</script>
</head>
<body STYLE='OVERFLOW: SCROLL; OVERFLOW-X: HIDDEN'>
<s:fielderror></s:fielderror>
<form name="form1" method="post" id="addCompanyForm" action="customerVisit/addCustomerVisit">
<input type="hidden" name="edit_id" id="edit_id" value="" />
<table width="99%" border="0" cellspacing="0" cellpadding="0"
	id="index_main_table">
	<tr>
		<td height="26" width="100%"><span
			style="color: #002450; font-size: 13px; font-weight: bold;">
		客户--新建</span></td>
	</tr>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0"
	id="index_content">
	<tr>
		<td height="12"></td>
	</tr>
	<tr>
		<td valign="middle">
			<img src="image/s10.gif" width="58" height="22" style="cursor: pointer;" onclick="submitForm();">
			<img src="image/s9.gif" width="116" height="22">
			<img src="image/s8.gif" width="59" height="22">
		</td>
	</tr>
	<tr>
		<td id="errorInfo" style="font-size: 12; color: ff0000;">
			<span>${mess }</span>
		</td>
	</tr>
	<tr>
		<td valign="middle">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="index_main_div1">
			<tr>
				<td height="21" valign="top"
					background="image/index_main_div_titleBg.gif"><img
					style="margin-left: 5px;" src="image/index_main_div_left.gif"
					width="6" height="2" align="absmiddle">&nbsp;<span
					style="font-weight: bold; font-size: 12px;">基本信息</span></td>
			</tr>
			<tr>
				<td height="56" align="left" valign="top" bgcolor="#f7fbfc">

				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					height="100%" id="selectTable">
					<tr>
						<td width="10%">客户编码:</td>
						<td width="41%"><input type="text" name="code"
							class="addCText" value="${todayStr}${customerVisit.code}" id="code"></td>
						<td width="10%" align="left">客户名称:</td>
						<td width="42%"><input type="text" name="name"
							value="${customerVisit.name}" class="addCText" id="name"
							onkeyup="getPinyinCode();"></td>
						<td width="0%">&nbsp;</td>
					</tr>
					<tr>
						<td>拼音码:</td>
						<td><input type="text" name="pycode" class="addCText"
							value="${customerVisit.pycode}" id="pycode"></td>
						<td align="left">客户等级:</td>
						<td>
						<select name="grade" id="customer_grade" class="addCText">
							<option value="">---</option>
							<c:forEach items="${newPageList }" var="newPageList">
								<option value="${newPageList.grade }">${newPageList.grade }</option>
							</c:forEach>
						</select> <img src="image/s11.gif" onclick="loadPopup('customer_grade')"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>区域名称:</td>
						<td><select name="region" class="addCText" id="region">
							<option value="">---</option>
							<c:forEach items="${newPageList }" var="newPageList">
								<option value="${newPageList.regionName}">${newPageList.regionName}</option>
							</c:forEach>
						</select> <img src="image/s11.gif" onclick="loadPopup('region')"></td>
						<td align="left">客户来源:</td>
						<td><select name="source" id="source" class="addCText">
							<option value="">---</option>
							<c:forEach items="${newPageList }" var="newPageList">
								<option value="${newPageList.source}">${newPageList.source}</option>
							</c:forEach>

						</select> <img src="image/s11.gif" onclick="loadPopup('source')"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>所属行业:</td>
						<td><select name="trade" class="addCText" id="trade">
							<option value="">---</option>
							<c:forEach items="${newPageList }" var="newPageList">
								<option value="${newPageList.trade}">${newPageList.trade}</option>
							</c:forEach>
						</select> <img src="image/s11.gif" onclick="loadPopup('trade')"></td>
						<td align="left">公司规模:</td>
						<td><select name="scale" class="addCText" id="company_size">
							<option value="">---</option>
							<c:forEach items="${newPageList }" var="newPageList">
								<option value="${newPageList.scale}">${newPageList.scale}</option>
							</c:forEach>
						</select> <img src="image/s11.gif" onclick="loadPopup('company_size')"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>传真:</td>
						<td><input type="text" name="fax" class="addCText"
							value="${customerVisit.fax}"></td>
						<td align="left">邮政编码:</td>
						<td><input type="text" name="postcode" class="addCText"
							value="${customerVisit.postcode}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>省份:</td>
						<td>
							<select name="province" class="addCText" onchange="getCityList();" id="province_id">
								<option value="">---</option>
								<c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.province}">${newPageList.province}</option>
								</c:forEach>
							</select>
						</td>
						<td align="left">城市:</td>
						<td>
							<select name="city" class="addCText" id="city_id">
								<option value="">---</option>
								<c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.city}">${newPageList.city}</option>
								</c:forEach>
							</select>
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>联系地址:</td>
						<td colspan="4"><input type="text" name="address"
							class="addCText1" value="${customerVisit.address}"></td>
					</tr>
					<tr>
						<td>电子邮件:</td>
						<td><input type="text" name="email" class="addCText"
							value="${customerVisit.email}"></td>
						<td align="left">公司网址:</td>
						<td><input type="text" name="web" class="addCText"
							value="${customerVisit.web}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>电话一:</td>
						<td><input type="text" name="tel11" class="addCText"
							value="${customerVisit.tel1}"></td>
						<td align="left">电话二:</td>
						<td><input type="text" name="tel22" class="addCText"
							value="${customerVisit.tel2}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>手机:</td>
						<td><input type="text" name="mobile" class="addCText" value="${customerVisit.mobile}"></td>
						<td align="left">事实客户:</td>
						<td>
							<input type="radio" name="buyFlag" value="1" checked="checked"> 是
							<input type="radio" name="buyFlag" value="0"> 否 
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>下次联系时间:</td>
						<td><input type="text" name="nextTouchDate2"
							class="addTimeInit" value="点击显示时间列表" id="nextTouchDate"
							readonly="readonly"></td>
						<td align="left">客户性质:</td>
						<td>
							<select name="quality" class="addCText" id="quality">
								<option value="">---</option>
								<c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.kind}">${newPageList.kind}</option>
								</c:forEach>
							</select> 
							<img src="image/s11.gif" onclick="loadPopup('quality')">
							</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="3"><textarea name="remark" class="addCText2">${customerVisit.remark}</textarea></td>
						<td>&nbsp;</td>
					</tr>
				</table>

				</td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="index_main_div1">
			<tr>
				<td height="21" valign="top"
					background="image/index_main_div_titleBg.gif"><img
					style="margin-left: 5px;" src="image/index_main_div_left.gif"
					width="6" height="2" align="absmiddle">&nbsp;<span
					style="font-weight: bold; font-size: 12px;">企业信息</span></td>
			</tr>
			<tr>
				<td height="56" align="left" valign="top" bgcolor="#f7fbfc">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					height="100%" id="selectTable">
					<tr>
						<td width="7%">经营范围:</td>
						<td width="42%">
							<select name="dealing" class="addCText" id="company_dealin">
								<option value="">---</option>
								<c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.dealing}">${newPageList.dealing}</option>
								</c:forEach>
							</select> 
							<img src="image/s11.gif" onclick="loadPopup('company_dealin')">
						</td>
						<td width="9%" align="left">企业性质:</td>
						<td width="40%"><input type="text" name="kind"
							class="addCText" value="${customerVisit.kind}"></td>
						<td width="2%">&nbsp;</td>
					</tr>
					<tr>
						<td>法人代表:</td>
						<td><input type="text" name="legalPerson"
							value="${customerVisit.legalPerson}" class="addCText"></td>
						<td align="left">注册资金:</td>
						<td><input type="text" name="registerMoney" class="addCText"
							value="${customerVisit.registerMoney}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>开户银行:</td>
						<td><input type="text" name="bank" class="addCText"
							value="${customerVisit.bank}"></td>
						<td align="left">银行账户:</td>
						<td><input type="text" name="account" class="addCText"
							value="${customerVisit.account}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>公司税号:</td>
						<td><input type="text" name="taxCode" class="addCText"
							value="${customerVisit.taxCode}"></td>
						<td align="left"></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="index_main_div1">
			<tr>
				<td height="21" valign="top"
					background="image/index_main_div_titleBg.gif"><img
					style="margin-left: 5px;" src="image/index_main_div_left.gif"
					width="6" height="2" align="absmiddle">&nbsp;<span
					style="font-weight: bold; font-size: 12px;">自定义信息</span></td>
			</tr>
			<tr>
				<td height="56" align="left" valign="top" bgcolor="#f7fbfc">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					height="100%" id="selectTable">
					<tr>
						<td width="66">客户需求1:</td>
						<td><input type="text" name="custom1" class="addCText"
							value="${customerVisit.custom1}"></td>
						<td width="66" align="left">客户需求2:</td>
						<td width="40%"><input type="text" name="custom2"
							value="${customerVisit.custom2}" class="addCText"></td>
						<td width="1">&nbsp;</td>
					</tr>
					<tr>
						<td>客户需求3:</td>
						<td><input type="text" name="custom3" class="addCText"
							value="${customerVisit.custom3}"></td>
						<td align="left">客户需求4:</td>
						<td><input type="text" name="custom4" class="addCText"
							value="${customerVisit.custom4}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>自定选项1:</td>
						<td>
							<select name="choice1" class="addCText" id="company_choice1">
								<option value="">---</option>
								<c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.choice1}">${newPageList.choice1}</option>
								</c:forEach>
							</select> 
							<img src="image/s11.gif" onclick="loadPopup('company_choice1')">
						</td>
						<td align="left">自定选项2:</td>
						<td>
							<select name="choice2" class="addCText" id="company_choice2">
								<option value="">---</option>
								<c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.choice2}">${newPageList.choice2}</option>
								</c:forEach>
							</select> 
							<img src="image/s11.gif" onclick="loadPopup('company_choice2')">
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>自定选项3:</td>
						<td>
							<select name="choice3" class="addCText" id="company_choice3">
								<option value="">---</option>
								<c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.choice3}">${newPageList.choice3}</option>
								</c:forEach>
							</select> 
							<img src="image/s11.gif" onclick="loadPopup('company_choice3')">
						</td>
						<td align="left">自定选项4</td>
						<td>
							<select name="choice4" class="addCText" id="company_choice4">
								<option value="">---</option>
								<c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.choice4}">${newPageList.choice4}</option>
								</c:forEach>
							</select> 
							<img src="image/s11.gif" onclick="loadPopup('company_choice4')">
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>自定时间1:</td>
						<td><input type="text" name="time11" id="time1"
							class="addTimeInit" value="点击显示时间列表" readonly="readonly">
						</td>
						<td align="left">自定时间2:</td>
						<td><input type="text" name="time22" id="time2"
							class="addTimeInit" value="点击显示时间列表" readonly="readonly">
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>


		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="index_main_div1">
			<tr>
				<td height="21" valign="top"
					background="image/index_main_div_titleBg.gif"><img
					style="margin-left: 5px;" src="image/index_main_div_left.gif"
					width="6" height="2" align="absmiddle">&nbsp;<span
					style="font-weight: bold; font-size: 12px;">其他信息</span></td>
			</tr>
			<tr>
				<td height="56" align="left" valign="top" bgcolor="#f7fbfc">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					height="100%" id="selectTable">
					<tr>
						<td width="7%">创建人:</td>
						<td width="42%"><input type="text" name="creater"
							class="addCText" readOnly="readOnly" value="${user.name}" id="creater">
						</td>
						<td width="9%" align="left">创建日期:</td>
						<td width="40%"><input type="text" name="createTime2" id="createTime"
							class="addCText" readOnly="readOnly" value="${c_time}"></td>
						<td width="2%">&nbsp;</td>
					</tr>
					<tr>
						<td>修改人:</td>
						<td><input type="text" name="updater" class="addCText"
							readOnly="readonly" value="${user.name}"></td>
						<td align="left">修改日期:</td>
						<td><input type="text" name="updateTime2" class="addCText"
							readOnly="readonly" value="${c_time}"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>所属人:</td>
						<td><input type="text" name="ownerUsr" id="ownerUsr" class="addCText"
							readonly="readonly" value="${user.name}"></td>
						<td align="left">&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td valign="middle">&nbsp;</td>
	</tr>
	<tr>
		<td valign="middle"><img src="image/s10.gif" width="58"
			height="22"><img src="image/s9.gif" width="116" height="22"><img
			src="image/s8.gif" width="59" height="22"></td>
	</tr>
	<tr>
		<td valign="middle">&nbsp;</td>
	</tr>
</table>
</form>


</body>
</html>
