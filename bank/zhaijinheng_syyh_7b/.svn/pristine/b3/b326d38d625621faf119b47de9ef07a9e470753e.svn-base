<%@ page language="java" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>

<HTML>
<HEAD>
<TITLE>西安市商业银行设备巡检系统</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.navPoint {
	COLOR: white; CURSOR: hand; FONT-FAMILY: Webdings; FONT-SIZE: 9pt
}
</style>
<SCRIPT>


function switchSysBar(){
	if (switchPoint.innerText==3){
		switchPoint.innerText=4
		document.all("frmTitle").style.display="none"
	}
	else{
		switchPoint.innerText=3
		document.all("frmTitle").style.display=""
	}
}
function movstar(a,time){
	movx=setInterval("mov("+a+")",time)
	}
function movover(){
	clearInterval(movx)
	}
function mov(a){
	scrollx=msghtml.document.body.scrollLeft
	scrolly=msghtml.document.body.scrollTop
	scrolly=scrolly+a
	msghtml.window.scroll(scrollx,scrolly)
	}
</SCRIPT>

</HEAD>
<BODY bgColor=#F2F2F2 scroll=no style="MARGIN: 0px">
<TABLE border=1 cellPadding=0 cellSpacing=0 height="100%" width="100%">
  <TBODY>
  <tr>
    <td height="60" colspan="3"><iframe frameborder="0" width="100%" height="100" src="../top.jsp"></iframe></td>
  </tr>
    <TR> 
	  <TD align=middle id=frmTitle noWrap vAlign=center name="fmTitle" width="120">
		<table border=0 height=100% border=0 cellPadding=0 cellSpacing=0>
				<tr  >
					  <td align=right><IMG alt=使劲按使劲向上滚 height=13 
					  onmousedown=movover();movstar(-3,2) onmouseout=movover(); 
					  onmouseover=movstar(-1,20); onmouseup=movover();movstar(-1,20) 
					  src="../images/lookup.png" style="CURSOR: hand" width=13> &nbsp; 
					  </td>
				 </tr>
				<tr>
					<td height=100%>
						<IFRAME border=0 frameBorder=0 frameSpacing=0  height=268   name=msghtml   scrolling=no vspale="0"  src="../left.jsp" 
						  style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 140px; Z-INDEX: 2"></IFRAME>

					  </td>
				</tr>
				<tr >
					  <td align=right> <IMG 
						  alt=使劲按使劲向下滚~ height=13 onmousedown=movover();movstar(3,2) 
						  onmouseout=movover(); onmouseover=movstar(1,20); 
						  onmouseup=movover();movstar(1,20) src="../images/lookdown.png" 
						  style="CURSOR: hand" width=13> &nbsp;
					  </td>
				 </tr>
		 </table>
	  </td>
      <TD bgColor=#F2F2F2 style="WIDTH: 10pt"> <TABLE border=0 cellPadding=0 cellSpacing=0 height="100%">
          <TBODY>
            <TR> 
              <TD onclick=switchSysBar() style="HEIGHT: 100%"><SPAN class=navPoint 
            id=switchPoint title=关闭/打开左栏>3</SPAN></TD>
            </TR>
          </TBODY>
        </TABLE></TD>
      <TD style="WIDTH: 100%"><IFRAME frameBorder=0 id=frmright name=mainFrame 
      scrolling=no  src="${url }" 
      style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1"> </IFRAME></TD>
    </TR>
  
  </TBODY>
</TABLE>
</BODY>
</HTML>