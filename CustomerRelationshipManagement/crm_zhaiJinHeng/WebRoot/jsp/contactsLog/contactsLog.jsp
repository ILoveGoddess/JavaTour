<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css_js/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<script src="css_js/popup4exExcel_sub.js" type="text/javascript"></script>
<style type="text/css">
.select_content_bg_new td{
	background-color:#fff;
	border:none;
	border-bottom:1px #ccc solid;
}
</style>
<link href="css_js/general.css" rel="stylesheet" type="text/css"></link>

<script type="text/javascript">
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
function toDel(){
	var cbNum = checkBoxNum();
	if(cbNum > 0){
		if(window.confirm("确定删除？")){

			document.getElementById("isDel").value="del";
			document.forms[0].action="contactsLog/ContactsLogListOne";
			document.forms[0].submit();

		}
	}
}
//判断列表复选框选中个数是否大于0，是：返回个数，否：返回0
function checkBoxNum(){
	if($("input[name='companyTouch_id']:checked").length > 0){
		return $("input[name='companyTouch_id']:checked").length;
	}else{
		return 0;
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
function exportExcel(){
	loadPopup_excel_sub('导出Excel');
}

function setLinkTimeScope(o){
	var _val = o.options[o.selectedIndex].text;
	var d = new Date();
	var year = d.getYear();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var day = d.getDay();
	if(_val == "今天"){
		var ltsFrom = year+"-"+month+"-"+date+" 00:00:00";
		var ltsTo = year+"-"+month+"-"+date+" 23:59:59";
	}else if(_val == "本周"){
		
		var ltsFrom = year+"-"+month+"-"+(date-(day-1))+" 00:00:00";
		var ltsTo = year+"-"+month+"-"+(date+(7-day))+" 00:00:00";
		alert(ltsFrom);
		alert(ltsTo);
	}
	
}

function changeNum(){
	var totalNum=$(".select_content_bg_new input").length;
	var num=$(".select_content_bg_new input:checked").length;
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
		$(".select_content_bg_new input").attr("checked",true);
	}else{
		$(".select_content_bg_new input").attr("checked",false);
	}
	changeNum();
}
</script>
</head>
<body onload="initPageSize()">
<s:fielderror></s:fielderror>
<form name="form1" method="post" action="contactsLog/ContactsLogListOne">
	<input type="hidden" name="CId" value="${CId}" id="CId" />
	<input type="hidden" name="linkTimeScope" value="${linkTimeScope}" id="linkTimeScope" />
	<input type="hidden" name="exportType" value="" id="exportType" />
	<input type="hidden" name="page" value="${pager.page}" id="hiddenPageNum" /> 
	<input type="hidden" name="pageSize" value="${pager.pageSize}" id="hiddenPageSize" />
	<input type="hidden" name="isDel" value="" id="isDel" />
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_content">
              <tr>
                <td valign="middle" ><table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
					  <tr>
						<td height="21" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">联系记录搜索</span></td>
					  </tr>
					  <tr>
					    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
					      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                            <tr>
                              <td width="13%">联系人:</td>
                              <td width="17%"><input type="text" name="linkMan" class="inputTextStyle"></td>
                              <td width="11%">联系方式:</td>
                              <td width="17%"><input type="text" name="linkFashion" class="inputTextStyle"></td>
                              <td width="11%">联系类别:</td>
                              <td width="14%"><input type="text" name="linkType" class="inputTextStyle"></td>
                              <td width="8%"><img src="image/s1.gif" width="59"
									height="22" onclick="submitForm()" alt="搜索按钮"></td>
						<td width="7%" align="left"><img src="image/s2.gif"
									width="62" height="22" onclick="resetForm()"></td>
                              <td width="1%" align="left">&nbsp;</td>
                            </tr>
                            <tr>
                              <td>业务员:</td>
                              <td><input type="text" name="userName" class="inputTextStyle"></td>
                              <td>下次联系目标:</td>
                              <td><input type="text" name="nextTouchAim" class="inputTextStyle"></td>
                              <td>联系记录: </td>
                              <td><input type="text" name="content" class="inputTextStyle"></td>
                              <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                              <td>业务员部门:</td>
                              <td><select name="custom1" class="selectOptionStyle">
                                <option value="-1" selected="selected"="selected="selected"">---</option>
                                <option value="1">今天</option>
                                <option value="2">本周</option>
                                <option value="3">本月</option>
                                <option value="4">本季度</option>
                                <option value="5">本年</option>
                                <option value="6">上周</option>
                                <option value="7">上月</option>
                                <option value="8">上季度</option>
                                <option value="9">去年</option>
                                <option value="10">自定义</option>
                              </select></td>
                              <td>联系时间:</td>
                              <td><select name="linkTimeScope_option" class="selectOptionStyle" onchange="setLinkTimeScope(this);">
                                <option value="-1" selected="selected">---</option>
                                <option value="1">今天</option>
                                <option value="2">本周</option>
                                <option value="3">本月</option>
                                <option value="4">本季度</option>
                                <option value="5">本年</option>
                                <option value="6">上周</option>
                                <option value="7">上月</option>
                                <option value="8">上季度</option>
                                <option value="9">去年</option>
                                <option value="10">自定义</option>
                              </select></td>
                             <!--   <td colspan="5">从：
                                <input type="text" name="textfield422" class="inputTextStyle">
                                到：
                                <input type="text" name="textfield4222" class="inputTextStyle" /></td>
                            --></tr>
                          </table>
                                                
					    </td>
			          </tr>
					</table>		
					
					
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="select_table">
					  <tr>
						<td height="10" bgcolor="#f7fbfc">&nbsp;</td>
					  </tr>
					  <tr>
					    <td height="11"><img src="image/t1.gif" align="absmiddle"> <span style="font-size:14; font-weight:bold;">联系人列表</span></td>
				      </tr>
					  <tr>
					    <td height="16" valign="top"><br/>
					        <img src="image/s3.gif" width="62" style="cursor: pointer" height="22" alt="新建按钮" onclick="javascript:window.location.href='contactsLog/toAddContactsLog'">
							<img src="image/s7.gif" width="59" height="22" onclick="toDel();">
						</td>
			          </tr>
					  <tr>
					    <td height="5" valign="top"></td>
				      </tr>
					  <tr>
					    <td height="28" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" id="selectTable_content">
							  <tr>
						<td width="40%" height="19" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;<img src="image/t2.gif" align="absmiddle" width="15" height="16"> 
							<span onClick="exportExcel()" class="pager" style="cursor: pointer">导出 </span>
							<span>| 选择条目:</span>
							<span id="select_num">0</span>
						</td>
						<td width="3%" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;</td>
						<td width="57%" bgcolor="#f2faff" align="right" style="font-size: 12px;">
							共${pager.totalRecord}条 
							<span class="pager" onClick="firstPage();" style="cursor: pointer">首页</span>
							<span class="pager" onClick="prePage();" style="cursor: pointer">上一页</span>
							${pager.page}/${pager.totalPage} 
							<span onClick="nextPage()" class="pager" style="cursor: pointer">下一页</span> 
							<span onclick="lastPage()" class="pager" style="cursor: pointer">末页</span>
							<select name="_pageNum" onChange="toUrl('_pageNum_up','_null');" id="_pageNum_up">
								<c:forEach begin="1" end="${pager.totalPage }" varStatus="start">
									<option value="${start.count }" <c:if test="${pager.page == start.count }">selected="selected"</c:if> >第${start.count }页</option>
								</c:forEach>
							</select> 
							<select name="_pageSize" onChange="toUrl('_null','_pageSize_up')" id="_pageSize_up">
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
							    <td colspan="3" bgcolor="#f2faff"><table width="100%" border="0" cellspacing="0" cellpadding="0" id="select_row">
                                  <tr>
                                    <td width="4%" height="28" align="center" background="image/select_title_title.jpg">
                                    	<input type="checkbox" name="ids" id="ids" onclick="toChange();">
                                    </td>
                                    <td width="30%" align="left" background="image/select_title_title.jpg"><strong>联系记录</strong></td>
                                    <td width="13%" align="center" background="image/select_title_title.jpg"><strong>联系时间</strong></td>
                                    <td width="12%" align="center" background="image/select_title_title.jpg"><strong>联系人</strong></td>
                                    <td width="14%" align="center" background="image/select_title_title.jpg"><strong>联系方式</strong></td>
                                    <td width="14%" align="center" background="image/select_title_title.jpg"><strong>业务员</strong></td>
                                    <td width="13%" align="center" background="image/select_title_title.jpg"><strong>下次联系时间</strong></td>
                                  </tr>
                                  <c:forEach items="${contactsLog }" var="contactsLog">
                                    <tr class="select_content_bg_new">
                                      <td align="center">
                                      	<input type="checkbox" name="companyTouch_id" value="${contactsLog.id}" onclick="changeNum();">
                                      </td>
                                      <td><a href="load4EditCompanyTouch.action?edit_id=${contactsLog.id}" class="normal">${contactsLog.content}&nbsp;</a></td>
                                      <td align="center"><fmt:formatDate  value="${contactsLog.linkTime}" pattern="yyyy年MM月dd日hh:mm:ss" />&nbsp;</td>
                                      <td align="center">${contactsLog.linkMan}&nbsp;</td>
                                      <td align="center">${contactsLog.linkFashion}&nbsp;</td>
                                      <td align="center">${contactsLog.salesman}</td>
                                      <td align="center"><fmt:formatDate  value="${contactsLog.nextTouchDate}" pattern="yyyy年MM月dd日hh:mm:ss" />&nbsp;</td>
                                    </tr>
                                  </c:forEach>
                                  <tr>
                                    <td colspan="7">&nbsp;</td>
                                  </tr>
                                </table></td>
						      </tr>
							  <tr>
						<td width="40%" height="19" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;<img src="image/t2.gif" align="absmiddle" width="15" height="16">
							<span> 导出 | 选择条目:</span>
							<span id="select_num_two">0</span>
						</td>
						<td width="3%" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;</td>
						<td width="57%" bgcolor="#f2faff" align="right" style="font-size: 12px;">
							共${pager.totalRecord}条 
							<span class="pager" onClick="firstPage();" style="cursor: pointer">首页</span>
							<span class="pager" onClick="prePage();" style="cursor: pointer">上一页</span>
							${pager.page}/${pager.totalPage} 
							<span onClick="nextPage()" class="pager" style="cursor: pointer">下一页</span> 
							<span onclick="lastPage()" class="pager" style="cursor: pointer">末页</span>
							<select name="_pageNum" onChange="toUrl('_pageNum_down','_null');" id="_pageNum_down">
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
					
					</td>
              </tr>
            </table>
</form>
</body>
</html>