<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String checkEmpty = "return checkEmpty()";
 %>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>浪曦crm系统---系统登录</title>
<link href="css_js/_main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="css_js/md5.js"></script>
<script language="javascript">
function init(){
	var o = document.getElementById("Layer1");
	o.style.left = (screen.width/2 - o.offsetLeft/2) + "px";
}
function checkEmpty(){
	/*if($("#login_username").val() == ""){
		$("#errorInfo").text("用户名不能为空");
		$("#login_username").removeClass("login_input_style");
		$("#login_username").addClass("login_input_style1");
		return false;
	}
	if($("#login_password").val() == ""){
		$("#errorInfo").text("密码不能为空");
		return false;
	}
	if(getTextLength($("#login_username").val()) < 5 || getTextLength($("#login_username").val()) > 16){
		$("#errorInfo").text("用户名长度在6与16之间");
		return false;
	}
	if(getTextLength($("#login_password").val()) < 5 || getTextLength($("#login_password").val()) > 16){
		$("#errorInfo").text("密码长度在6与16之间");
		return false;
	}*/
	var pwd = document.getElementById("password").value;//hex_md5(document.getElementById("password").value);
	document.getElementById("password").value = pwd;
}

function getTextLength(str){
	var bytesCount = 0;
	for(var i = 0; i < str.length; i++){

		var c = str.charAt(i);
		if(/^[\u0000-\u00ff]$/.test(c)){
			bytesCount += 1;
		}else{
			bytesCount += 2;
		}
	}
	//alert(bytesCount);
	return bytesCount;
}
function changeImg(){
	var imgSrc = $("#verifyCodeImg");
	var src = imgSrc.attr("src");
	imgSrc.attr("src",chgUrl(src));
}
function chgUrl(url){
	var timestamp = (new Date()).valueOf();
	url = url.substring(0,17);
	if(url.indexOf("&") >= 0){
		url = url + "tamp=" + timestamp;
	}else{
		url = url + "?timestamp=" + timestamp;
	}
	return url;
}
</script>
<style type="text/css">
body{
	background-image:url(image/loginbg.gif);
	background-repeat:repeat-x;
	background-color:#dff0f8;
	font-size:12px;
}
#Layer1 {
	position:absolute;
	left:500px;
	top:187px;
	width:496px;
	height:292px;
	background-image:url(image/login_mainBg.jpg);
	background-repeat:no-repeat;
	z-index:1;
}
#Layer2 {
	position:absolute;
	left:37px;
	top:87px;
	width:76px;
	height:67px;
	z-index:2;
}
#Layer3 {
	position:absolute;
	left:150px;
	top:93px;
	width:164px;
	height:115px;
	font-size:12px;
	z-index:2;
}
.login_input_style{
	width:103px;
	height:21px;
	border:1px solid #9bc8e9;

}
.login_input_style1{
	width:103px;
	height:21px;
	border:1px solid #9bc8e9;
	background-image:url(image/errorbg.jpg);

}
.login_checknum_style{
	width:50px;
	height:21px;
	border:1px solid #9bc8e9;
}
.input_button_style{
	width:50px;
	height:20px;
	border:1px solid #a3bfd4;
	background-image:url(image/login_button_bg.gif);
	background-repeat:no-repeat;
	font-size:12px;
	color:#3f7eef;
}
#Layer4 {
	position:absolute;
	left:24px;
	top:66px;
	width:354px;
	height:61px;
	font-size:24px;
	color:#FFFFFF;
	z-index:5;
}
#Layer5 {
	position:absolute;
	left:26px;
	top:67px;
	width:354px;
	height:61px;
	font-size:24px;
	color:#000000;
	z-index:1;
}
#imgLayer{
	position:absolute;
	left:240px;
	top:155px;
	z-index:10;
}
#errLayer{
	position:absolute;
	left:160px;
	top:60px;
}
.tdLabel{
	font-size:12px;
}
.errorMessage{
	font-size:12px;
	color:#ff0000;
}
</style>
</head>

<body onLoad="init();">

<div id="Layer1">

	<div id="Layer2"><img src="image/login_left.jpg" width="91" height="97"></div>
	<div id="Layer3">
		<span id="errorInfo" style="font-size:12px;color:#ff0000;">${err }</span><br/>
		<!-- <s:form action="login.action" method="post" theme="simple" >
			用户名:<s:textfield label="用户名" name="name" cssClass="login_input_style"/><br/>
			密　码:<s:password label="密　码" name="password" id="password" cssClass="login_input_style"/><br/>
			验证码:<s:textfield theme="simple" value="" label="验证码" name="verifyCode" cssClass="login_checknum_style"/>
			<br/><s:submit value="提交" onclick="return checkEmpty()"/>
		</s:form> -->
		<form action="user/login" method="post">
			用户名:<input type="text" label="用户名" name="name" cssClass="login_input_style"><br/>
			密　码:<input type="password"label="密　码" name="password" id="password" cssClass="login_input_style"/><br/>
			验证码:<input type="text" value="" label="验证码" name="verifyCode" cssClass="login_checknum_style"/>
			<a href="javascript:changeImg();"><img src="verifyCodeServlet" border="0" id="verifyCodeImg"></a><br/>
			<input type="submit" value="提交" onclick="<%=checkEmpty %>">
		</form>
		
	</div>
	<!-- <div id="imgLayer"><a href="javascript:changeImg();"><img src="verifyCodeServlet" border="0" id="verifyCodeImg"></a></div> -->
	<div id="errLayer">
		<!-- <s:fielderror cssStyle="color: red"></s:fielderror> -->
	</div>

</div>


<div id="Layer4">浪曦CRM（客户关系管理系统）</div>
<div id="Layer5">浪曦CRM（客户关系管理系统）</div>
</body>
</html>