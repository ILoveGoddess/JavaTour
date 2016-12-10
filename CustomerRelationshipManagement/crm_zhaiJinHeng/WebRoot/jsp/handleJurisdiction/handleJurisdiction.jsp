<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>操作权限组新建</title>
<link href="css_js/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<script src="css_js/popup4exExcel.js" type="text/javascript"></script>
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
			document.forms[0].submit();
		}
	}
}
//判断列表复选框选中个数是否大于0，是：返回个数，否：返回0
function checkBoxNum(){
	if($("input[name='role_id']:checked").length > 0){
		return $("input[name='role_id']:checked").length;
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
	loadPopup_excel('导出Excel');
}
function openTreeWindow(role_id){
	window.open("getTreeStr.action?role_id="+role_id,"_blank",
	"width=740,height=680,toolbar=no,menubar=no,resizable=no,status=no,scrollbars=yes");
}

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
<form action="handleJurisdictionClass/HandleJurisdictionListOne" method="post" name="form1" id="form1">
	<input type="hidden" name="page" value="${pager.page}" id="hiddenPageNum" />
	<input type="hidden" name="pageSize" value="${pager.pageSize}" id="hiddenPageSize" /> 
	<input type="hidden" name="isDel" value="" id="isDel" /> 
	<input type="hidden" name="exportType" value="" id="exportType" />
<table width="99%" srole="0" cellspacing="0" cellpadding="0" id="index_content">
              <tr>
                <td valign="middle" >
					<table width="100%" srole="0" cellspacing="0" cellpadding="0" id="index_main_div1">
					  <tr>
						<td height="21" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">操作权限列表</span></td>
					  </tr>
					</table>
					
					<table width="100%" srole="0" cellspacing="0" cellpadding="0" id="index_main_div1">
					  <tr>
						<td height="21" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">操作权限组搜索</span></td>
					  </tr>
					  <tr>
					    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
					      <table width="100%" srole="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                            <tr>
                              <td width="11%" height="41">名称:</td>
                              <td width="17%"><input type="text" name="textfield" class="inputTextStyle"></td>
                              <td width="11%">&nbsp;</td>
                              <td width="17%">&nbsp;</td>
                              <td width="11%">&nbsp;</td>
                              <td width="17%">&nbsp;</td>
                              <td width="5%"><img src="image/s1.gif" width="59" height="22"></td>
                              <td width="10%" align="left"><img src="image/s2.gif" width="62" height="22"></td>
                              <td width="1%" align="left">&nbsp;</td>
                            </tr>
                          </table>
					    </td>
			          </tr>
					</table>		
					
					
					<table width="100%" srole="0" cellspacing="0" cellpadding="0" id="select_table">
					  <tr>
						<td height="10" bgcolor="#f7fbfc">&nbsp;</td>
					  </tr>
					  <tr>
					    <td height="11"><img src="image/t1.gif" align="absmiddle"> <span style="font-size:14; font-weight:bold;">操作权限列表</span></td>
				      </tr>
					  <tr>
					    <td height="16" valign="top"><br/>
					        <img src="image/s3.gif" width="62" style="cursor: pointer" height="22" alt="新建按钮" onclick="javascript:window.location.href='handleJurisdictionClass/toAddHandleJurisdiction'">
							<img src="image/s7.gif" width="59" height="22" alt="删除按钮" onclick="toDel();">
						</td>
			          </tr>
					  <tr>
					    <td height="5" valign="top"></td>
				      </tr>
					  <tr>
					    <td height="28" valign="top">
							<table width="100%" srole="0" cellspacing="0" cellpadding="0" id="selectTable_content">
							  <tr>
						<td width="40%" height="19" bgcolor="#f2faff" style="font-size: 12px;">&nbsp;<img src="image/t2.gif" align="absmiddle" width="15" height="16"> 
							<span onclick="exportExcel()" class="pager" style="cursor: pointer">导出</span>
							<span> | 选择条目:</span>
							<span id="select_num">0</span>
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
								<table width="100%" srole="0" cellspacing="0" cellpadding="0" id="select_row">
                                  <tr>
                                    <td width="4%" height="28" align="center" background="image/select_title_title.jpg">
                                    	<input type="checkbox" id="ids" name="checkbox" value="checkbox" onclick="toChange();">
                                    </td>
                                    <td width="39%" align="left" background="image/select_title_title.jpg"><strong>名称</strong></td>
                                    <td width="57%" align="center" background="image/select_title_title.jpg"><strong>可进行的操作</strong><strong>人员设置</strong></td>
                                  </tr>
                                  
                               <c:forEach items="${handleJurisdiction }" var="handleJurisdiction">  
                                 <tr class="select_content_bg">
									<td align="center">
										<input type="checkbox" name="role_id" value="${handleJurisdiction.id}" onclick="changeNum();">
									</td>
                                    <td>${handleJurisdiction.name}</td>
                                    <td align="center"><span onclick="openTreeWindow('${handleJurisdiction.id}')" style="cursor: pointer">设置</span></td>
                                  </tr>
                                </c:forEach> 
                                  <tr>
                                    <td colspan="3">&nbsp;</td>
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
					
				</td>
              </tr>
            </table>
            </form>
</body>
</html>
