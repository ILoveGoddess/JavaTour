<%@ page language="java" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<style type="text/css">
a:link {
color: #2c95ca;
text-decoration: none;
}

a:visited {
color: black;
text-decoration: none;
}

a:hover {
COLOR: green; TEXT-DECORATION: underline;position:relative;left:1px;top:1px;
}

a:active {
color: green;
text-decoration: underline;
}
a{
text-decoration:none;
color:#2c95ca;
}
img{border:0}

</style>

<body align="center" background="images/left_bg.gif" style="BACKGROUND-REPEAT: repeat-y;background-repeat:no-repeat;" bgproperties="fixed"><br>
 	<%-- <s:iterator value="%{#session.yms}" id="ym">
 	    <s:url id="url" value="%{#request.ym.url}"></s:url>
 		<a href="/SYYH/SYYH/${url }" style="font:12px" style="margin-left:30px;font:12px；margin-top:40px" target="mainFrame"><img src="/SYYH/./images/1_2.gif" /><br><div style="margin-left:15px">${ym.ymmc }</div></a><br>
 	</s:iterator> --%>
 	<c:forEach items="${leftList }" var="x">
 		<a href="${pageContext.request.contextPath }/${x.url }" style="font:12px" style="margin-left:30px;font:12px；margin-top:40px" target="mainFrame"><img src="${pageContext.request.contextPath }/images/1_2.gif" /><br><div style="margin-left:15px">${x.ymmc }</div></a><br>
 	</c:forEach>
 	
 </body>
</html>