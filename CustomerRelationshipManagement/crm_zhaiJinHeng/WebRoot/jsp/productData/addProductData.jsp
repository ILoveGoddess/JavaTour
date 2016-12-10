<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>添加商品</title>
<script type="text/javascript">

jQuery(document).ready(function () {
	$('#time1').simpleDatepicker({ startdate: 1960, enddate: 2060 });
	$('#time2').simpleDatepicker({ startdate: 1960, enddate: 2060 });
 	//是否已经有了数据
	
	if('' != '${product.time1}'){
		$('#time1').val('${product.time1}');
	}else{
		$('#time1').val('点击显示时间列表');
	}
	if('' != '${product.time2}'){
		$('#time2').val('${product.time2}');
	}else{
		$('#time2').val('点击显示时间列表');
	}
	//判断状态显示时间颜色
	
	if($('#time1').val()!="点击显示时间列表"){
		$('#time1').removeClass("addTimeInit");
		$('#time1').addClass("addTimeClick");
	}
	if($('#time2').val()!="点击显示时间列表"){
		$('#time2').removeClass("addTimeInit");
		$('#time2').addClass("addTimeClick");
	}
	if('' != '${product.createTime}'){
		$('#createTime').val('<s:date name="#request.product.createTime" format="yyyy-MM-dd HH:mm:ss" nice="false" />');
	}
	else if('' != '${c_time}'){
		$('#createTime').val('${c_time}');
	}else{
		$('#createTime').val('');
	}

	if('' != '${product.updateTime}'){
		$('#updateTime').val('<s:date name="#request.product.updateTime" format="yyyy-MM-dd HH:mm:ss" nice="false" />');
	}
	else if('' != '${c_time}'){
		$('#updateTime').val('${c_time}');
	}else{
		$('#updateTime').val('');
	}
});
jQuery(document).ready(function () {
	if('${product.creater}' != ""){
		$("#creater").val('${product.creater}');
	}else{
		$("#creater").val('${user.name}');
	}

});
</script>

<script type="text/javascript">
function submitForm(){
	
		if($('#time1').val()=="点击显示时间列表"){
			$('#time1').val("");
		}
		if($('#time2').val()=="点击显示时间列表"){
			$('#time2').val("");
		
		document.getElementById("productForm").submit();
		
		
	}
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

function checkFormat(filePath){
	var i = filePath.lastIndexOf(".");
	var len = filePath.length;
	var str = filePath.substring(len,i+1);
	var extName = "JPG,GIF,PNG,BMP";

	if(extName.indexOf(str.toUpperCase()) < 0){
		alert("图片格式不正确");
		return false;
	}
	return true;
	
}
function fileChange(o){
	if(checkFormat(o.value)){
		if(window.ActiveXObject){
			document.getElementById("uploadImg").width = 100;
			document.getElementById("uploadImg").height = 100;
			document.getElementById("uploadImg").src = o.value;
		}else{
			document.getElementById("uploadImg").width = 100;
			document.getElementById("uploadImg").height = 100;
			document.getElementById("uploadImg").src = o.files[0].getAsDataURL();
		}
		
	}
}
function initPic(){
	if('${product.picture}' != ""){
		document.getElementById("uploadImg").width = 100;
		document.getElementById("uploadImg").height = 100;
		document.getElementById("uploadImg").src = "uploadImages/${product.picture}";
	}
}

</script>
</head>
<body onload="initPic();">
<form name="form1" method="post" action="productDataClass/addProductData" id="productForm" enctype="multipart/form-data">
<s:fielderror></s:fielderror>
<input type="hidden" name="edit_id" id="edit_id" value="" />
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_main_table">
              <tr>
                <td height="26" width="100%"> <span style="color:#002450; font-size:13px; font-weight:bold;">　新建商品</span></td>
              </tr>
            </table>
			
			<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_content">
              <tr>
                <td height="12"></td>
              </tr>
              <tr>
                <td valign="middle" >
	                <img src="image/s10.gif" width="58" height="22" onclick="submitForm();">
	                <img src="image/s9.gif" width="116" height="22">
	                <img src="image/s8.gif" width="59" height="22">
                </td>
              </tr>
              <tr>
		<td id="errorInfo" style="font-size: 12; color: ff0000;">
			${mess }
		</td>
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
                            <td width="10%"><span class="STYLE1">商品名称</span>:</td>
                            <td width="41%"><input type="text" value="${productData.name}" id="name" name="name" class="addCText" onkeyup="getPinyinCode();"></td>
                            <td width="7%" align="left">商品类别:</td>
                            <td width="42%">
                            <select name="ptypeId" class="addCText">
                              <option value="0">/</option>
                             	 <span>${str }</span>
                            </select>
                            </td>
                            <td width="0%">&nbsp;</td>
                          </tr>
                          <tr>
                            <td>商品编码:</td>
                            <td><input type="text" value="${todayStr}${productData.code}" name="code" class="addCText" id="code"></td>
                            <td align="left">拼音码:</td>
                            <td><input type="text" value="${productData.pycode}" name="pycode" class="addCText" id="pycode"></td>
                            <td>&nbsp;</td>
                            </tr>
                          <tr>
                            <td>型号:</td>
                            <td><input type="text" value="${productData.model}" name="model" class="addCText"></td>
                            <td align="left">规格:</td>
                            <td><input type="text" value="${productData.spec}" name="spec" class="addCText"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>单位:</td>
                            <td><input type="text" value="${productData.unit}" name="unit" class="addCText"></td>
                            <td align="left">颜色:</td>
                            <td><input type="text" value="${productData.color}" name="color" class="addCText"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>尺寸:</td>
                            <td><input type="text" value="${productData.productSize}" name="productSize" class="addCText"></td>
                            <td align="left">条形码:</td>
                            <td><input type="text" value="${productData.barCode}" name="barCode" class="addCText"></td>
                            <td>&nbsp;</td>
                            </tr>
                          <tr>
                            <td>供应商:</td>
                            <td><input type="text" value="${productData.provider}" name="provider" class="addCText">                            </td>
                            <td align="left">商品库存:</td>
                            <td><input type="text" value="${productData.stock}" name="stock" class="addCText"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>单价:</td>
                            <td><input type="text" value="${productData.stock}" name="price" class="addCText"></td>
                            <td align="left">采购价:</td>
                            <td><input type="text" value="${productData.buyPrice}" name="buy_price" class="addCText"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>商品图片:</td>
                            <td colspan="4"><input type="file" value="${productData.picture}" name="myFile" onchange="javascript:fileChange(this)" style="width:90%"/>
							</td>
                            </tr>
                          <tr>
                            <td>图片预览:</td>
                            <td colspan="3"><img src="image/nonepicture.gif" width="0" height="0" id="uploadImg"/></td>
                            <td>&nbsp;</td>
                            </tr>
                          <tr>
                            <td>备注:</td>
                            <td colspan="3"><textarea name="remark" class="addCText2">${productData.remark}</textarea></td>
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
                            <td><input name="custom1" value="${productData.custom1}" type="text" class="addCText" id="custom1"></td>
                            <td width="66" align="left">自定义2:</td>
                            <td width="40%"><input name="custom2" value="${productData.custom2}" type="text" class="addCText" id="custom2"></td>
                            <td width="1">&nbsp;</td>
                          </tr>
                          <tr>
                            <td>自定义3:</td>
                            <td><input name="custom3" value="${productData.custom3}" type="text" class="addCText" id="custom3"></td>
                            <td align="left">自定义4:</td>
                            <td><input name="custom4" value="${productData.custom4}" type="text" class="addCText" id="custom4"></td>
                             <td width="1"></td>
                          </tr>
                          <tr>
                            <td>自定选项1:</td>
                            <td>
	                            <select name="choice1" class="addCText" id="product_choice1">
	                              <option value="1">---</option>
	                             	<c:forEach items="${newPageList }" var="newPageList">
											<option value="${newPageList.choice1}">${newPageList.choice1}</option>
									</c:forEach>
								</select> 
							<img src="image/s11.gif" onclick="loadPopup('product_choice1')">
                            </td>
                            <td align="left">自定选项2:</td>
                            <td>
	                            <select name="choice2" class="addCText" id="product_choice2">
	                            <option value="1">---</option>
	                            <c:forEach items="${newPageList }" var="newPageList">
									<option value="${newPageList.choice1}">${newPageList.choice2}</option>
								</c:forEach>
	                            </select>
	                            <img src="image/s11.gif" onclick="loadPopup('product_choice2')">
                            </td>
                             <td width="1"></td>
                            </tr>
                          <tr>
                            <td>自定选项3:</td>
                            <td>
	                            <select name="choice3" class="addCText" id="product_choice3">
	                                <option value="1">---</option>
	                                <c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.choice3}">${newPageList.choice3}</option>
									</c:forEach>
	                            </select>
	                            <img src="image/s11.gif" onclick="loadPopup('product_choice3')">
                            </td>
                            <td align="left">自定选项4</td>
                            <td>
	                            <select name="choice4" class="addCText" id="product_choice4">
	                                <option value="1">---</option>
	                                 <c:forEach items="${newPageList }" var="newPageList">
										<option value="${newPageList.choice4}">${newPageList.choice4}</option>
									</c:forEach>
	                            </select>
	                            <img src="image/s11.gif" onclick="loadPopup('product_choice4')">
                            </td>
                           <td width="1"></td>
                          </tr>
                          <tr>
                            <td>自定时间1:</td>
                           	<td>
                           		<input type="text" name="time11"  id="time1" class="addTimeInit" value="" readonly="readonly">
							</td>
                            <td align="left">自定时间2:</td>
                            <td>
                            	<input type="text" name="time22"  id="time2" class="addTimeInit" value="" readonly="readonly">
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
                            <td width="40%"><input name="createTime2" id="createTime" value="" type="text" class="addCText" id="createTime" readOnly="readOnly"></td>
                            <td width="2%">&nbsp;</td>
                            </tr>
                          <tr>
                            <td>修改人:</td>
                            <td><input name="updater" type="text" class="addCText" id="updater" value="" readOnly="readOnly"></td>
                            <td align="left">修改日期:</td>
                            <td><input name="updateTime2" type="text" value='' class="addCText" id="updateTime" readOnly="readOnly"></td>
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