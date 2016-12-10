<%@ page language="java" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>
<%
	String checkdata = "return checkdata();";
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<title>QQ练习</title>
<link href="${pageContext.request.contextPath }/css/QQloginpanel.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath }/js/QQloginpanel.js" type="text/javascript"></script>
</head>
<body>
<form name="form1" method="post" action="${pageContext.request.contextPath }/user/login.do"
		onsubmit=<%=checkdata %>>
<div class="loginpanel" id="loginpanel">
    <div class="top">
        <div class="ui_boxyClose" id="ui_boxyClose"></div>
    </div>
    <div class="webQQ" id="webQQ"></div>
    <div class="main">
        <div class="sign_input">
		    <span>账&nbsp&nbsp&nbsp号:</span>
		    <span>&nbsp&nbsp</span><input autocomplete="on" name="loginId"
			type="text" style="ime-mode: disabled" class="input01" tabindent="1"
			value="QQ号码或Email账号" onFocus="if(value=='QQ号码或Email账号'){value=''}"
			onBlur="if(value==''){value='QQ号码或Email账号';}"/></span>
		</div>
		<div class="sign_input">
		    <span>密&nbsp&nbsp&nbsp码:</span>&nbsp&nbsp<span><input name="loginPassword" id="p" maxlength="16"
			type="password" class="input01" tabindent="2"/></span>
		</div>
	</div>
	<div class="bottom">
	    <div class="btn">
	    	<input type="image" src="${pageContext.request.contextPath }/images/imag.jpg.jpg" name="Image8"
	    	 	style="-webkit-border-radius:30px;width:90px;height:36px;border:0;text-align:center;
				line-height:20px;color:#0C4E7C;cursor:pointer;margin-left:-10px;float:left;outline: none" />
	    </div>
		<div class="state">
		    <div id="loginState" class="login-state-trigger login-state-trigger2 login-state"
                title="选择在线状态" onmousedown="clickIcon()" onmouseup="hidden()">
                <div id="loginStateShow" class="login-state-show online">状态</div>
                <div class="login-state-down">下</div>
                <div class="login-state-txt" id="login2qq_state_txt">在线</div>
            <ul id="loginStatePanel" class="statePanel login-state" style="display:none">
               <li id="online" class="statePanel_li">
                  <div class="stateSelect_icon online"></div>
                  <div class="stateSelect_text">我在线</div>
               </li>
               <li id="callMe" class="statePanel_li">
                  <div class="stateSelect_icon callMe"></div>
                  <div class="stateSelect_text">Q我吧</div>
               </li>				  
		       <li id="off" class="statePanel_li">
			      <div class="stateSelect_icon away"></div>
				  <div class="stateSelect_text">离开</div>
			   </li>
			   <li id="busy" class="statePanel_li">
			      <div class="stateSelect_icon busy"></div>
				  <div class="stateSelect_text">忙碌</div>
			   </li>
			   <li id="silent" class="statePanel_li">
			      <div class="stateSelect_icon silent"></div>
				  <div class="stateSelect_text">请勿打扰</div>
			   </li>
			   <li id="hidden" class="statePanel_li">
			      <div class="stateSelect_icon hidden"></div>
				  <div class="stateSelect_text">隐身</div>
			   </li>
			</ul>
		</div>
		</div>
	</div>
</div>
</form>
</body>
</html>