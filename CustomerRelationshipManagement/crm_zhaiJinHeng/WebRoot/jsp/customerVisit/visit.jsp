<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html> 
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户拜访</title>
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<script src="css_js/jquery.tablesorter.min.js" type="text/javascript"></script>
<link href="css_js/index.css" rel="stylesheet" type="text/css">
<script src="css_js/popup4nextTDate.js" type="text/javascript"></script>
<script src="css_js/popup4exExcel.js" type="text/javascript"></script>
<link href="css_js/general.css" rel="stylesheet" type="text/css"></link>
<link href="css_js/calendar.css" rel="stylesheet" type="text/css"></link>
<script src="css_js/cal.js" type="text/javascript"></script>
<style type="text/css">
.nav{font-size:12px;color:#444444;}
.nav_checked{font-size:12px; color:#ff0000;}
</style>
<script type="text/javascript">
//表格排序
$(document).ready(function(){
	$("#select_row").tablesorter({headers:{0:{sorter:false}}})
});
	



function getNextTDate(){
	if($(window.parent.frames["nextTDatePage"].document).find(":input#nextTouchDate")){
		var tdate = $(window.parent.frames["nextTDatePage"].document).find(":input#nextTouchDate");
		$("#nextTouchDate").val(tdate.val());
		if($("#nextTouchDate").val()!="点击显示时间列表"){
			document.forms[0].action = "companyNextTDate.action";
			document.forms[0].submit();
		}
	}
}
function toChange(){
	var cball = $("#ids");
	var cbs = $("[name=company]");
	if(cball.attr("checked") != ""){
		cball.attr("checked","checked");
	}else{
		cball.attr("checked","");
	}
	for(var i = 0; i < cbs.length; i++){
			cbs[i].checked = cball.attr("checked");
	}
}
function toUrl(pageNumId,pageSizeId){
	var _pageNum,_pageSize;
	if(pageNumId != "_null"){
		_pageNum = document.getElementById(pageNumId);
	}else{
		_pageNum = document.getElementById("_pageNum_up");
	}
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		hiddenPageNum.value = _pageNum.options[_pageNum.selectedIndex].value;
	}
	if(pageSizeId != "_null"){
		_pageSize = document.getElementById(pageSizeId);
	}else{
		_pageSize = document.getElementById("_pageSize_up");
	}
	var hiddenPageSize = document.getElementById("hiddenPageSize");
	if("" != hiddenPageSize.value){
		hiddenPageSize.value = _pageSize.options[_pageSize.selectedIndex].value;
	}
	document.forms[0].submit();
}
function initPageSize(){
	var pageSizes = document.getElementsByName("_pageSize");
	for(var o = 0; o < pageSizes.length; o++){
		for(var i = 0; i < pageSizes[o].options.length; i++){
			if(pageSizes[o].options[i].value == '${pageSize}'){
				pageSizes[o].options[i].selected="selected";
			}
		}
	}
	
}
function nextPage(){
	var totalPage = "${pager.totalPage}" - 0;
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		if((hiddenPageNum.value - 0) < totalPage){
			hiddenPageNum.value = hiddenPageNum.value - 0 + 1;
			document.forms[0].submit();
		}
	}
}
function prePage(){
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		hiddenPageNum.value = hiddenPageNum.value - 0;
		if(hiddenPageNum.value > 1){
			hiddenPageNum.value -= 1;
		}
		document.forms[0].submit();
	}
}
function firstPage(){
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		hiddenPageNum.value = 1;
		document.forms[0].submit();
	}
}
function lastPage(){
	var hiddenPageNum = document.getElementById("hiddenPageNum");
	if("" != hiddenPageNum.value){
		hiddenPageNum.value = ${pager.totalPage};
		document.forms[0].submit();
	}
}
function submitForm(){
	document.forms[0].submit();
}
function resetForm(){
	document.forms[0].reset();
}

function conrAdvanceSelect(){
	var ff = !(document.all);
	var con = document.getElementById("_conradvanceSelect");
	var tab = document.getElementById("advanceSelect");
	if(tab.style.display=="none"){
		if(ff){
			tab.style.display="table-row";
		}else{
			tab.style.display="block";
		}
		
		con.innerHTML="(高级搜索↑)";
	}else{
		tab.style.display="none";
		con.innerHTML="(高级搜索↓)";
	}
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
function toDel(){
	var cbNum = checkBoxNum();
	if(cbNum > 0){
		if(window.confirm("确定删除？")){
			document.getElementById("isDel").value="del";
			document.forms[0].action="customerVisit/customerVisitListOne";
			document.forms[0].submit();
		}
	}
}
//判断列表复选框选中个数是否大于0，是：返回个数，否：返回0
function checkBoxNum(){
	if($("input[name='company']:checked").length > 0){
		return $("input[name='company']:checked").length;
	}else{
		return 0;
	}
}
function showPopUp(){
	var cbNum = checkBoxNum();
	if(cbNum > 0){
		loadPopup4nextTDate("批量设置下次联系时间");
	}
}

function exportExcel(){
	loadPopup_excel('导出Excel');
}

function todayTouchCompanyFun(){
	document.getElementById("touchType").value = "todayTouchCompany"; 
	document.forms[0].submit();
}

function overDueCompanyFun(){
	document.getElementById("touchType").value = "overDueCompany"; 
	document.forms[0].submit();
}

function allCompanyFun(){
	document.getElementById("touchType").value = "allCompany";
	document.forms[0].submit();
}

$(document).ready(function(){
	document.getElementById("todayTouchCompany").className="nav";
	document.getElementById("overDueCompany").className="nav";
	document.getElementById("allCompany").className="nav";
	if('${touchType}' != ""){
		document.getElementById("touchType").value = '${touchType}';
	}
	var _id = document.getElementById("touchType").value;
	document.getElementById(_id).className = "nav_checked";
	
});

function changeNum(){
	var totalNum=$(".select_content_bg input").length;
	var num=$(".select_content_bg input:checked").length;
	$("#select_num").html(num);
	$("#select_num_two").html(num);
	if(totalNum==num){
		$("#ids").attr("checked",true);
	}
	if(num==0){
		$("#ids").attr("checked",false);
	}
}

function toChange(){
	var flag=$("#ids").attr("checked");
	if(flag){
		$(".select_content_bg input").attr("checked",true);
	}else{
		$(".select_content_bg input").attr("checked",false);
	}
	changeNum();
}
</script>
</head>
<body onload="initPageSize()">
<form name="form1" id="load4Visit" method="post" action="customerVisit/customerVisitListOne">
<table width="99%" border="0" cellspacing="0" cellpadding="0"
	id="index_content">
	<tr>
		<td valign="middle">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="index_main_div1">
			<tr>
				<td height="21" background="image/index_main_div_titleBg.gif"><img
					style="margin-left: 5px;" src="img/index_main_div_left.gif"
					width="6" height="2" align="absmiddle">&nbsp;<span
					style="font-weight: bold; font-size: 12px;">客户拜访</span></td>
			</tr>
			<tr>
				<td height="46" align="left" valign="middle" bgcolor="#f7fbfc"
					style="font-size: 12px; color: #424446;">
					<span onclick="todayTouchCompanyFun();" class="nav_checked" id="todayTouchCompany">今天需要联系的客户</span>
					<span onclick="overDueCompanyFun();" class="nav" id="overDueCompany">已过期未联系的客户 </span>
					<span onclick="allCompanyFun();" class="nav" id="allCompany">全部</span>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="index_main_div1">
			<tr>
				<td height="21" background="image/index_main_div_titleBg.gif"><img
					style="margin-left: 5px;" src="img/index_main_div_left.gif"
					width="6" height="2" align="absmiddle">&nbsp;<span
					style="font-weight: bold; font-size: 12px;">客户搜索</span> <span
					style="font-weight: bold; font-size: 11px; cursor: pointer;"
					onclick="conrAdvanceSelect();" id="_conradvanceSelect">(高级搜索↓)</span></td>
			</tr>
			<tr>
				<td height="56" align="left" valign="top" bgcolor="#f7fbfc">
				<table width="100%">
					<tr>
						<td width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
							<tr>
								<td width="11%">客户编码:</td>
								<td width="17%"><input type="text" name="code"
									class="inputTextStyle" value="${visDetail.code}"></td>
								<td width="11%">客户名称:</td>
								<td width="17%"><input type="text" name="name"
									class="inputTextStyle" value="${visDetail.name}"></td>
								<td width="11%">拼音码:</td>
								<td width="17%"><input type="text" name="pycode"
									class="inputTextStyle" value="${visDetail.pycode}"></td>
								<td width="8%"><img src="image/s1.gif" width="59"
									height="22" onclick="submitForm()" alt="搜索按钮"></td>
								<td width="7%" align="left"><img src="image/s2.gif"
									width="62" height="22" onclick="resetForm()"></td>
								<td width="1%" align="left">&nbsp;</td>
							</tr>
							<tr>
								<td>电话1:</td>
								<td><input type="text" name="tel1" class="addCText"
									value="${ccompany.tel1}"></td>
								<td>所属人部门:</td>
								<td><select name="select2" class="selectOptionStyle">
									<option value="-1" selected="selected">---</option>
									<option value="1">重要客户</option>
									<option value="2">潜在客户</option>
								</select></td>
								<td>所属人:</td>
								<td><select name="select4" class="selectOptionStyle">
									<option value="-1" selected="selected">---</option>
									<option value="1">重要客户</option>
									<option value="2">潜在客户</option>
								</select></td>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td>客户等级:</td>
								<td>
								<select name="grade" id="customer_grade"
									class="addCText">
									<option value="">---</option>
									<c:forEach items="${visit }" var="visDetail">
												<option value="${visDetail.grade}">${visDetail.grade}</option>
									</c:forEach>
								</select></td>
								<td>客户来源:</td>
								<td><select name="source" id="source" class="addCText">
									<option value="">---</option>
									<c:forEach items="${visit }" var="visDetail">
												<option value="${visDetail.regionName}">${visDetail.regionName}</option>
									</c:forEach>
								</select></td>
								<td>客户性质:</td>
								<td><select name="quality" class="addCText" id="quality">
									<option value="">---</option>
									<c:forEach items="${visit }" var="visDetail">
												<option value="${visDetail.quality}">${visDetail.quality}</option>
									</c:forEach>
								</select></td>
								<td colspan="3">&nbsp;</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr style="display: none" id="advanceSelect">
						<td width="100%">
						<table width="100%" border="0" id="selectTable" cellspacing="0"
							cellpadding="0" height="100%">
							<tr>
								<td width="12%">区域名称:</td>
								<td width="39%"><select name="region" class="addCText"
									id="region">
									<option value="">---</option>
									<c:forEach items="${visit }" var="visDetail">
										<s:if test="#sdDetail.SDictionaryClass.id == 56">
											<s:if test="#sdDetail.value == #request.company.regionName">
												<option value="${sdDetail.name}" selected='selected'>${sdDetail.name}</option>
											</s:if>
											<s:else>
												<option value="${sdDetail.name}">${sdDetail.name}</option>
											</s:else>
										</s:if>
									</c:forEach>
								</select></td>
								<td width="12%">手机:</td>
								<td width="34%"><input type="text" name="mobile"
									class="addCText" value="${company.mobile}" /></td>
								<td width="3%">&nbsp;</td>
							</tr>
							<tr>
								<td>所属行业:</td>
								<td><select name="trade" class="addCText" id="trade">
									<option value="">---</option>
									<c:forEach items="${visit }" var="visDetail">
										<s:if test="#sdDetail.SDictionaryClass.id == 5">
											<s:if test="#sdDetail.value == #request.company.trade">
												<option value="${sdDetail.name}" selected='selected'>${sdDetail.name}</option>
											</s:if>
											<s:else>
												<option value="${sdDetail.name}">${sdDetail.name}</option>
											</s:else>
										</s:if>
									</c:forEach>
								</select></td>
								<td align="left">公司规模:</td>
								<td><select name="scale" class="addCText" id="company_size">
									<option value="">---</option>
									<c:forEach items="${visit }" var="visDetail">
										<s:if test="#sdDetail.SDictionaryClass.id == 61">
											<s:if test="#sdDetail.value == #request.company.scale">
												<option value="${sdDetail.name}" selected='selected'>${sdDetail.name}</option>
											</s:if>
											<s:else>
												<option value="${sdDetail.name}">${sdDetail.name}</option>
											</s:else>
										</s:if>
									</c:forEach>
								</select></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>传真:</td>
								<td><input type="text" name="fax" class="addCText"
									value="${company.fax}"></td>
								<td align="left">邮政编码:</td>
								<td><input type="text" name="postcode" class="addCText"
									value="${company.postcode}"></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>省份:</td>
								<td><select name="province" class="addCText"
									onchange="getCityList();" id="province_id">
									<option value="">---</option>
									<c:forEach items="${visit }" var="visDetail">
										<s:if test="#sprovice.name == #request.company.province">
											<option value="${sprovice.name}" selected='selected'>${sprovice.name}</option>
										</s:if>
										<s:else>
											<option value="${sprovice.name}">${sprovice.name}</option>
										</s:else>
									</c:forEach>
								</select></td>
								<td align="left">城市:</td>
								<td><select name="city" class="addCText" id="city_id">

									<c:forEach items="${visit }" var="visDetail">
										<s:if test="#city.name == #request.company.city">
											<option value="${city.name}" selected='selected'>${city.name}</option>
										</s:if>
										<s:else>
											<option value="${city.name}">${city.name}</option>
										</s:else>
									</c:forEach>
								</select></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>电子邮件:</td>
								<td><input type="text" name="email" class="addCText"
									value="${company.email}"></td>
								<td align="left">公司网址:</td>
								<td><input type="text" name="web" class="addCText"
									value="${company.web}"></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="left">电话二:</td>
								<td><input type="text" name="tel2" class="addCText"
									value="${company.tel2}" /></td>
								<td align="left">事实客户:</td>
								<td><s:if test="#request.company.buyFlag=='1'">
									<input type="radio" name="buyFlag" value="1" checked="checked" />
										    是 </s:if> <s:else>
									<input type="radio" name="buyFlag" value="1" />
					                            是 </s:else> <s:if
									test="#request.company.buyFlag=='0'">
									<input type="radio" name="buyFlag" value="0" checked="checked" />
					                            否 </s:if> <s:else>
									<input type="radio" name="buyFlag" value="0" />
					                            否 </s:else></td>
								<td>&nbsp;</td>
							</tr>

						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="select_table">
			<tr>
				<td height="10" bgcolor="#f7fbfc">&nbsp;</td>
			</tr>
			<tr>
				<td height="11"><img src="image/t1.gif" align="absmiddle">
				<span style="font-size: 14; font-weight: bold;">客户列表</span></td>
			</tr>
			<tr>
				<td height="16" valign="top"><br />
					<img src="image/s3.gif" width="62" style="cursor: pointer" height="22" alt="新建按钮" onclick="javascript:window.location.href='customerVisit/toAddCustomerVisit'">
					<img src="image/s4.gif" width="134" height="22" onclick="showPopUp();">
					<img src="image/s5.gif" width="62" height="22">
					<img src="image/s6.gif" width="112" height="22">
					<img src="image/s7.gif" width="59" height="22" alt="删除按钮" onclick="toDel();">
				</td>
			</tr>
			<tr>
				<td height="5" valign="top"></td>
			</tr>
			<tr>
				<td height="28" valign="top">
					<input type="hidden" name="page" value="${pager.page}" id="hiddenPageNum" /> 
					<input type="hidden" name="pageSize" value="${pager.pageSize}" id="hiddenPageSize" />
					<input type="hidden" name="nextTouchDate_tmp" value="" id="nextTouchDate" />
					<input type="hidden" name="isDel" value="" id="isDel" />
					<input type="hidden" name="exportType" value="" id="exportType" />
					<input type="hidden" name="touchType" value="allCompany" id="touchType" />
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					id="selectTable_content">
					<tr>
						<td width="40%" height="19" bgcolor="#f2faff"
							style="font-size: 12px;">&nbsp;<img src="image/t2.gif"
							align="absmiddle" width="15" height="16"> 
							
							<span onclick="exportExcel()" 
							class="pager" style="cursor: pointer">导出 </span>
							
							| 选择条目:<span id="select_num">0</span>
							
							</td>
						<td width="3%" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;</td>
						<td width="57%" bgcolor="#f2faff" align="right" style="font-size: 12px;">
							共${pager.totalRecord}条 
							<span class="pager" onclick="firstPage();" style="cursor: pointer">首页</span>
							<span class="pager" onclick="prePage();" style="cursor: pointer">上一页</span>
							${pager.page}/${pager.totalPage} 
							<span onclick="nextPage()" class="pager" style="cursor: pointer">下一页</span> 
							<span onclick="lastPage()" class="pager" style="cursor: pointer">末页</span>
							<select name="_pageNum" onchange="toUrl('_pageNum_up','_null');" id="_pageNum_up">
								<c:forEach begin="1" end="${pager.totalPage }" varStatus="start">
									<option value="${start.count }" <c:if test="${pager.page == start.count }">selected="selected"</c:if> >第${start.count }页</option>
								</c:forEach>
							</select> 
							<select name="_pageSize" onchange="toUrl('_null','_pageSize_up')" id="_pageSize_up">
								<option value="5" <c:if test="${pager.pageSize == 5 }">selected="selected"</c:if> >5条</option>
								<option value="6" <c:if test="${pager.pageSize == 6 }">selected="selected"</c:if> >6条</option>
								<option value="7" <c:if test="${pager.pageSize == 7 }">selected="selected"</c:if> >7条</option>
								<option value="8" <c:if test="${pager.pageSize == 8 }">selected="selected"</c:if> >8条</option>
								<option value="9" <c:if test="${pager.pageSize == 9 }">selected="selected"</c:if> >9条</option>
								<option value="10" <c:if test="${pager.pageSize == 10 }">selected="selected"</c:if> >10条</option>
								<option value="15" <c:if test="${pager.pageSize == 15 }">selected="selected"</c:if> >15条</option>
								<option value="20" <c:if test="${pager.pageSize == 20 }">selected="selected"</c:if> >20条</option>
								<option value="25" <c:if test="${pager.pageSize == 25 }">selected="selected"</c:if> >25条</option>
								<option value="30" <c:if test="${pager.pageSize == 30 }">selected="selected"</c:if> >30条</option>
								<option value="50" <c:if test="${pager.pageSize == 50 }">selected="selected"</c:if> >50条</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="3" bgcolor="#f2faff">
						
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							id="select_row">
							<thead>
							<tr>
								<th width="4%" height="28" align="center" background="image/select_title_title.jpg">
									<input type="checkbox" name="ids" id="ids" onclick="toChange();">
								</th>
								<th width="26%" align="left"
									background="image/select_title_title.jpg">客户名称</th>
								<th width="7%" align="center"
									background="image/select_title_title.jpg"><strong>客户性质</strong></th>
								<th width="9%" align="center"
									background="image/select_title_title.jpg"><strong>客户等级</strong></th>
								<th width="12%" align="center"
									background="image/select_title_title.jpg"><strong>电话一</strong></th>
								<th width="18%" align="center"
									background="image/select_title_title.jpg"><strong>电子邮件</strong></th>
								<th width="10%" align="center"
									background="image/select_title_title.jpg"><strong>最后联系时间</strong></th>
								<th width="7%" align="center"
									background="image/select_title_title.jpg"><strong>联系人</strong></th>
								<th width="7%" align="center"
									background="image/select_title_title.jpg"><strong>联系记录</strong></th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${visit }" var="company">
								<tr class="select_content_bg">
									<td align="center">
										<input type="checkbox" name="company" value="${company.id}" onclick="changeNum();">
									</td>
									<td>
										${company.name}
										<a class="normal" style="text-decoration:none;" href="productType/toUpdateProductType?productTypeId=${company.id}"><span style="color:red;font:30px; font-weight:bold;">修改${company.name}</span></a>
									</td>
									<td align="center">${company.quality}</td>
									<td align="center">${company.grade}</td>
									<td align="center">${company.tel1}</td>
									<td align="center">${company.email}</td>
									<td align="center"><fmt:formatDate  value="${company.lastTouchDate}" pattern="yyyy年MM月dd日" /></td>
									<td align="center">查看</td>
									<td align="center">查看</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						</td>
					</tr>
					<tr>
						<td width="40%" height="19" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;<img src="image/t2.gif" align="absmiddle" width="15" height="16">
						 	导出 | 选择条目:<span id="select_num_two">0</span>
						</td>
						<td width="3%" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;</td>
						<td width="57%" bgcolor="#f2faff" align="right" style="font-size: 12px;">
							共${pager.totalRecord}条 
							<span class="pager" onclick="firstPage();" style="cursor: pointer">首页</span>
							<span class="pager" onclick="prePage();" style="cursor: pointer">上一页</span>
							${pager.page}/${pager.totalPage} 
							<span onclick="nextPage()" class="pager" style="cursor: pointer">下一页</span> 
							<span onclick="lastPage()" class="pager" style="cursor: pointer">末页</span>
							<select name="_pageNum" onchange="toUrl('_pageNum_down','_null');" id="_pageNum_down">
								<c:forEach begin="1" end="${pager.totalPage }" varStatus="start">
									<option value="${start.count }" <c:if test="${pager.page == start.count }">selected="selected"</c:if> >第${start.count }页</option>
								</c:forEach>
							</select> 
							<select name="_pageSize" onchange="toUrl('_null','_pageSize_down')" id="_pageSize_down">
								<option value="5" <c:if test="${pager.pageSize == 5 }">selected="selected"</c:if> >5条</option>
								<option value="6" <c:if test="${pager.pageSize == 6 }">selected="selected"</c:if> >6条</option>
								<option value="7" <c:if test="${pager.pageSize == 7 }">selected="selected"</c:if> >7条</option>
								<option value="8" <c:if test="${pager.pageSize == 8 }">selected="selected"</c:if> >8条</option>
								<option value="9" <c:if test="${pager.pageSize == 9 }">selected="selected"</c:if> >9条</option>
								<option value="10" <c:if test="${pager.pageSize == 10 }">selected="selected"</c:if> >10条</option>
								<option value="15" <c:if test="${pager.pageSize == 15 }">selected="selected"</c:if> >15条</option>
								<option value="20" <c:if test="${pager.pageSize == 20 }">selected="selected"</c:if> >20条</option>
								<option value="25" <c:if test="${pager.pageSize == 25 }">selected="selected"</c:if> >25条</option>
								<option value="30" <c:if test="${pager.pageSize == 30 }">selected="selected"</c:if> >30条</option>
								<option value="50" <c:if test="${pager.pageSize == 50 }">selected="selected"</c:if> >50条</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<input type="hidden" id="nextTouchDate" value="" name="nextTouchDate"/>
		</td>
	</tr>
</table>
</form>
<div id="popupContact"><a id="popupContactClose">x</a>
<h1>标题</h1>
<div id="dictionaryMsg"></div>
<p id="contactArea">这里是正文</p>
</div>
<div id="backgroundPopup"></div>
</body>

</html>