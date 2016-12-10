<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<link href="css_js/index.css" rel="stylesheet" type="text/css"></link>
<script src="css_js/cal.js" type="text/javascript"></script>
<link href="css_js/general.css" rel="stylesheet" type="text/css"></link>
<link href="css_js/calendar.css" rel="stylesheet" type="text/css"></link>
<script src="css_js/popup4Linkman.js" type="text/javascript"></script>
<title>联系人添加</title>
<script type="text/javascript">

jQuery(document).ready(function () {
	$('#birthday').simpleDatepicker({ startdate: 1960, enddate: 2060 });
	$('#time1').simpleDatepicker({ startdate: 1960, enddate: 2060 });
	$('#time2').simpleDatepicker({ startdate: 1960, enddate: 2060 });
 	//是否已经有了数据
	if('' != '${companyLinkman.birthday}'){
		$('#birthday').val('${companyLinkman.birthday}');
	}else{
		$('#birthday').val('点击显示时间列表');
	}
	if('' != '${companyLinkman.time1}'){
		$('#time1').val('${companyLinkman.time1}');
	}else{
		$('#time1').val('点击显示时间列表');
	}
	if('' != '${companyLinkman.time2}'){
		$('#time2').val('${companyLinkman.time2}');
	}else{
		$('#time2').val('点击显示时间列表');
	}
	//判断状态显示时间颜色
	if($('#birthday').val()!="点击显示时间列表"){
		$('#birthday').removeClass("addTimeInit");
		$('#birthday').addClass("addTimeClick");
	}
	if($('#time1').val()!="点击显示时间列表"){
		$('#time1').removeClass("addTimeInit");
		$('#time1').addClass("addTimeClick");
	}
	if($('#time2').val()!="点击显示时间列表"){
		$('#time2').removeClass("addTimeInit");
		$('#time2').addClass("addTimeClick");
	}

	if("" != "${companyLinkman.createTime}"){
		$('#createTime').val('${companyLinkman.createTime}');
	}
});
jQuery(document).ready(function () {
	if('${companyLinkman.creater}' != ""){
		$("#creater").val('${companyLinkman.creater}');
	}else{
		$("#creater").val('${user.name}');
	}

	if('${companyLinkman.user.name}' != ""){
		$("#ownerUsr").val('${companyLinkman.user.name}');
	}else{
		$("#ownerUsr").val('${user.name}');
	}

});
</script>

<script type="text/javascript">
function submitForm(){
	
		if($('#birthday').val()=="点击显示时间列表"){
			$('#birthday').val("");
		}
		if($('#time1').val()=="点击显示时间列表"){
			$('#time1').val("");
		}
		if($('#time2').val()=="点击显示时间列表"){
			$('#time2').val("");
		}
		var edit_id = document.getElementById("edit_id").value;
		if(edit_id != ""){
			document.getElementById("linkManform").action = "editCompanyLinkMan.action";
		}
		document.getElementById("ownerUsr").value="${user.id}";
		document.getElementById("linkManform").submit();
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
</script>
</head>
<body STYLE='OVERFLOW:SCROLL;OVERFLOW-X:HIDDEN'>


<form action="contacts/addContacts" method="post" name="linkManform" id="linkManform">
<input type="hidden" name="edit_id" id="edit_id" value="" />
<input type="hidden" name="CId" id="CId" value="" />
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_content">
              <tr>
                <td height="12"></td>
              </tr>
              <tr>
                <td valign="middle" >
	                <img src="image/s10.gif" width="58" height="22" style="cursor: pointer;" onclick="submitForm();">
	                <img src="image/s8.gif" width="59" height="22">
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
                            <td>姓名:</td>
                            <td><input type="text" name="name" id="name" class="addCText" value="${companyLinkman.name}" onkeyup="getPinyinCode();"/></td>
                            <td align="left">性别:${contacts.sex}</td>
                            <td>
	                            <select name="sex" class="addCText">
	                            	<option>---</option>
	                               	<option value="男">男</option>
	                               	<option value="女">女</option>
	                            </select>
                            </td>
                            <td>&nbsp;</td>
                          </tr>
						  <tr>
                            <td width="10%">编码:</td>
                            <td width="41%"><input type="text" name="code"  value="${todayStr}${contacts.code}" class="addCText" value="${todayStr}"></td>
                            <td width="7%" align="left">拼音码</td>
                            <td width="42%"><input type="text" name="pycode" value="${contacts.pycode}" id="pycode" class="addCText"></td>
                            <td width="0%">&nbsp;</td>
                          </tr>
                         
                          <tr>
                            <td>出生日期:</td>
                            <td><input type="text" name="birthday2" id="birthday"
							class="addTimeInit" value="点击显示时间列表" readonly="readonly">
						</td>
                            <td align="left">传真:</td>
                            <td><input name="fax" value="${contacts.fax}" type="text" class="addCText" id="fax"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>部门:</td>
                            <td><input name="department" value="${contacts.department}" type="text" class="addCText" id="department"></td>
                            <td align="left">职务:</td>
                            <td><input name="duty" value="${contacts.duty}" type="text" class="addCText" id="duty"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>办公电话:</td>
                            <td><input name="officeTel"  value="${contacts.officeTel}" type="text" class="addCText" id="officeTel"></td>
                            <td align="left">家庭电话:</td>
                            <td><input name="homeTel"  value="${contacts.homeTel}" type="text" class="addCText" id="homeTel"></td>
                            <td>&nbsp;</td>
                            </tr>
                          <tr>
                            <td>手机:</td>
                            <td><input name="mobile" value="${contacts.mobile}" type="text" class="addCText" id="mobile"></td>
                            <td align="left">主联系人:</td>
                            <td>
                            	<input type="radio" name="mainFlag" value="1">是
                            	<input name="mainFlag" type="radio" value="0" checked="checked">否
							</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>电子邮件:</td>
                            <td><input name="email" value="${contacts.email}" type="text" class="addCText" id="email"></td>
                            <td align="left">邮政编码:</td>
                            <td><input name="postcode" value="${contacts.postcode}" type="text" class="addCText" id="postcode"></td>
                            <td>&nbsp;</td>
                            </tr>
                          <tr>
                            <td>QQ号:</td>
                            <td><input name="qqNum" value="${contacts.qqNum}" type="text" class="addCText" id="qqNum"></td>
                            <td align="left">QQ昵称:</td>
                            <td><input name="qqName" value="${contacts.qqName}" type="text" class="addCText" id="qqName"></td>
                            <td>&nbsp;</td>
                            </tr>
                          <tr>
                            <td>联系地址:</td>
                            <td colspan="3"><input name="address" value="${contacts.address}" type="text" class="addCText" id="address"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>其他联系:</td>
                            <td colspan="3"><input name="otherLink" value="${contacts.otherLink}" type="text" class="addCText" id="otherLink"></td>
                            <td>&nbsp;</td>
                            </tr>
                          <tr>
                            <td>爱好</td>
                            <td colspan="3"><textarea name="hobby" class="addCText2" id="hobby">${contacts.hobby}</textarea></td>
                            <td>&nbsp;</td>
                            </tr>
							 <tr>
                            <td>忌讳</td>
                            <td colspan="3"><textarea name="taboo" class="addCText2" id="taboo">${contacts.taboo}</textarea></td>
                            <td>&nbsp;</td>
                            </tr>
							 <tr>
                            <td>备注</td>
                            <td colspan="3"><textarea name="remark" class="addCText2" id="remark">${contacts.remark}</textarea></td>
                            <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                  </tr>
                </table>
				
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
                  <tr>
                    <td height="21" valign="top" background="image/index_main_div_titleBg.gif"><img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;<span style="font-weight:bold;font-size:12px;">自定义信息</span></td>
                  </tr>
                  <tr>
                    <td height="56" align="left" valign="top" bgcolor="#f7fbfc">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
                          <tr>
                            <td width="66">自定义1:</td>
                            <td><input name="custom1" value="${contacts.custom1}" type="text" class="addCText" id="custom1"></td>
                            <td width="66" align="left">自定义2:</td>
                            <td width="40%"><input name="custom2" value="${contacts.custom2}" type="text" class="addCText" id="custom2"></td>
                            <td width="1">&nbsp;</td>
                          </tr>
                          <tr>
                            <td>自定义3:</td>
                            <td><input name="custom3" value="${contacts.custom3}" type="text" class="addCText" id="custom3"></td>
                            <td align="left">自定义4:</td>
                            <td><input name="custom4" value="${contacts.custom4}" type="text" class="addCText" id="custom4"></td>
                             <td width="1"></td>
                          </tr>
                          <tr>
                            <td>自定选项1:</td>
                            <td>
	                            <select name="choice1" class="addCText" id="ComLinkMan_choice1">
	                            <option value="1">---</option>
	                             	<c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.choice1}">${newPageList.choice1}</option>
									</c:forEach>
								</select> 
								<img src="image/s11.gif" onclick="loadPopup4Linkman('ComLinkMan_choice1')">
                        	</td>
                            <td align="left">自定选项2:</td>
                            <td>
	                            <select name="choice2" class="addCText" id="ComLinkMan_choice2">
		                            <option value="1">---</option>
			                        <c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.choice2}">${newPageList.choice2}</option>
									</c:forEach>
								</select>
	                            <img src="image/s11.gif" onclick="loadPopup4Linkman('ComLinkMan_choice2')">
                            </td>
                             <td width="1"></td>
                            </tr>
                          <tr>
                            <td>自定选项3:</td>
                            <td>
	                            <select name="choice3" class="addCText" id="ComLinkMan_choice3">
	                                <option value="1">---</option>
	                                <c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.choice3}">${newPageList.choice3}</option>
									</c:forEach>
	                            </select>
	                            <img src="image/s11.gif" onclick="loadPopup4Linkman('ComLinkMan_choice3')">
	                        </td>
                            <td align="left">自定选项4</td>
                            <td>
	                            <select name="choice4" class="addCText" id="choice4">
	                                <option value="1">---</option>
	                                <c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.choice4}">${newPageList.choice4}</option>
									</c:forEach>
	                            </select>
	                            <img src="image/s11.gif" onclick="loadPopup4Linkman('ComLinkMan_choice4')">
                            </td>
                            <td width="1"></td>
                          </tr>
                          <tr>
                            <td>自定时间1:</td>
                           <td><input type="text" name="time11"  id="time1"
							class="addTimeInit" value="点击显示时间列表" readonly="readonly">
						</td>
                            <td align="left">自定时间2:</td>
                            <td><input type="text" name="time22"  id="time2"
							class="addTimeInit" value="点击显示时间列表" readonly="readonly">
						</td>
                             <td width="1"></td>
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
                            <td width="40%"><input name="createTime2" id="createTime" value="${c_time}${contacts.createTime}" type="text" class="addCText" id="createTime" readOnly="readOnly"></td>
                            <td width="2%">&nbsp;</td>
                            </tr>
                          <tr>
                            <td>修改人:</td>
                            <td><input name="updater" type="text" value="${user.name}" class="addCText" id="updater" readOnly="readOnly"></td>
                            <td align="left">修改日期:</td>
                            <td><input name="updateTime2" type="text" value="${c_time}" class="addCText" id="updateTime" readOnly="readOnly"></td>
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
                    </td>
                  </tr>
                </table>
				
				</td>
              </tr>
			   <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
			   <tr>
                <td valign="middle" ><img src="image/s10.gif" width="58" height="22"><img src="image/s8.gif" width="59" height="22"></td>
              </tr>
			  <tr>
                <td valign="middle" >&nbsp;</td>
              </tr>
            </table>
</form>
</body>
</html>