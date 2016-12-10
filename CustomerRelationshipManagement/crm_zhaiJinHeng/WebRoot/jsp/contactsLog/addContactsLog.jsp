<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系记录添加</title>
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<link href="css_js/index.css" rel="stylesheet" type="text/css"></link>
<script src="css_js/cal.js" type="text/javascript"></script>
<link href="css_js/general.css" rel="stylesheet" type="text/css"></link>
<link href="css_js/calendar.css" rel="stylesheet" type="text/css"></link>
<script src="css_js/popup4Linkman.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function () {
	$('#linkTime').simpleDatepicker({ startdate: 1960, enddate: 2060 });
	$('#nextTouchDate').simpleDatepicker({ startdate: 1960, enddate: 2060 });
 	//是否已经有了数据
	if('' != '${c_time}'){
		
		$('#linkTime').val('<s:date name="#request.c_time" format="yyyy-MM-dd" nice="false" />');
	}else{
		$('#linkTime').val('');
	}
	
	//判断状态显示时间颜色
	if($('#linkTime').val()!="点击显示时间列表"){
		$('#linkTime').removeClass("addTimeInit");
		$('#linkTime').addClass("addTimeClick");
	}
	if($('#nextTouchDate').val()!="点击显示时间列表"){
		$('#nextTouchDate').removeClass("addTimeInit");
		$('#nextTouchDate').addClass("addTimeClick");
	}
	if("" != "${companyTouch.nextTouchDate}"){
		$('#nextTouchDate').val('${companyTouch.nextTouchDate}');
	}
	if("" != "${companyTouch.createTime}"){
		$('#createTime').val('${companyTouch.createTime}');
	}
});
jQuery(document).ready(function () {
	if('${companyTouch.creater}' != ""){
		$("#creater").val('${companyTouch.creater}');
	}else{
		$("#creater").val('${user.name}');
	}

	if('${companyTouch.user.name}' != ""){
		$("#ownerUsr").val('${companyTouch.user.name}');
	}else{
		$("#ownerUsr").val('${user.name}');
	}
});
</script>

<script type="text/javascript">

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
function openTouchOpenWindow(){
	window.open("loadTouchOpenWidow.action","_blank",
			"width=740,height=380,toolbar=no,menubar=no,resizable=no,status=no,scrollbars=yes");
}
function submitForm(){
	
	if($('#linkTime').val()=="点击显示时间列表"){
		$('#linkTime').val("");
	}
	if($('#nextTouchDate').val()=="点击显示时间列表"){
		$('#nextTouchDate').val("");
	}
	var edit_id = document.getElementById("edit_id").value;
	if(edit_id != ""){
		document.getElementById("touchform").action = "companyTouchEdit.action";
	}
	document.getElementById("ownerUsr").value="${user.id}";
	document.getElementById("touchform").submit();
}
</script>
</head>
<body>
<form action="contactsLog/addContactsLog" method="post" name="touchform" id="touchform">
<input type="hidden" name="edit_id" id="edit_id" value="" />
<input type="hidden" name="CId" id="CId" value="" />
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_content">
              <tr>
                <td height="12"></td>
              </tr>
              <tr>
                <td valign="middle" >
	                <img src="image/s10.gif" width="58" height="22" style="cursor: pointer;" onclick="submitForm();">
	                <img src="image/s8.gif" width="59" height="22" onclick="javascirpt:window.location.href='load4CompanyTouchMain.action?CId=${CId}'">
                </td>
              </tr>
              <tr>
               <td id="errorInfo" style="font-size:12px;color:red;">${mess }</td>
              </tr>
              <tr>
                <td valign="middle" ><table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">基本信息</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td>联系人:</td>
                            <td>
	                            <select name="linkMan" class="addCText">
		                            <option value="-1" selected="selected">---</option>
	                             	<c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.linkMan}">${newPageList.linkMan}</option>
									</c:forEach>
	                            </select>
                            </td>
                            <td align="left">联系方式:</td>
                            <td>
	                            <select name="linkFashion" class="addCText" id="link_fashion">
	                              	<option value="" selected="selected">---</option>
	                             	<c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.linkFashion}">${newPageList.linkFashion}</option>
									</c:forEach>
	                            </select>
	                            <img src="image/s11.gif" onclick="loadPopup4Linkman('link_fashion')">
                            </td>
                            <td>&nbsp;</td>
                          </tr>
						  <tr>
                            <td width="10%">联系时间:</td>
                            <td width="41%"><input type="text" name="linkTime2" id="linkTime" class="addCText" value="点击显示时间列表" readonly="readonly"></td>
                            <td width="7%" align="left">联系类别:</td>
                            <td width="42%">
	                            <select name="linkType" class="addCText" id="link_type">
	                              	<option value="" selected="selected">---</option>
	                             	<c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.linkType}">${newPageList.linkType}</option>
									</c:forEach>
	                            </select>
	                            <img src="image/s11.gif" onclick="loadPopup4Linkman('link_type')">
                            </td>
                            <td width="0%">&nbsp;</td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td colspan="3"><img src="image/xuanze.gif" width="62" height="22" onclick="openTouchOpenWindow();"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>联系记录:</td>
                            <td colspan="3"><textarea name="content" class="addCText2" id="content">${contactsLog.content}</textarea></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>下次联系时间:</td>
                            <td>
                            	<input name="nextTouchDate2" type="text" class="addCText" id="nextTouchDate" value="点击显示时间列表">
                            </td>
                            <td align="left">业务员:</td>
                            <td>
	                            <select name="select4" class="addCText">
		                            <option value="-1" selected="selected">---</option>
		                            <c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.salesman}">${newPageList.salesman}</option>
									</c:forEach>
	                            </select>
                            </td>
                            <td>&nbsp;</td>
                          </tr>
						  <tr>
                            <td>下次联系目标:</td>
                            <td colspan="3"><textarea name="nextTouchAim" class="addCText2" id="taboo">${contactsLog.nextTouchAim }</textarea></td>
                            <td>&nbsp;</td>
                            </tr>
							 <tr>
                            <td>备注:</td>
                            <td colspan="3"><textarea name="remark" class="addCText2" id="remark">${contactsLog.remark}</textarea></td>
                            <td>&nbsp;</td>
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
                    <form name="form1" method="post" action="contactsLog/addContactsLog" >
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td width="7%">创建人:</td>
                            <td width="42%"><input name="creater" type="text" class="addCText" id="creater" readOnly="readOnly">                            </td>
                            <td width="9%" align="left">创建日期:</td>
                            <td width="40%">
                            <input type="text" name="linkTime2" id="linkTime" class="addCText" value="" readonly="readonly">
                            </td>
                            <td width="2%">&nbsp;</td>
                            </tr>
                          <tr>
                            <td>修改人:</td>
                            <td><input name="updater" type="text" value="${user.name}" class="addCText" id="updater" readOnly="readOnly"></td>
                            <td align="left">修改日期:</td>
                            <td><input name="nextTouchDate2" type="text" class="addCText" id="nextTouchDate" value=""></td>
                            <td>&nbsp;</td>
                            </tr>
                          <tr>
                            <td>所属人:</td>
                            <td><input name="ownerUsr" type="text" class="addCText" id="ownerUsr"></td>
                            <td align="left">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            </tr>
                        </table>
                    </form></td>
                  </tr>
                </table>				</td>
              </tr>
			   <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
			   
			  <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
            </table>
            </form>
</body>
</html>