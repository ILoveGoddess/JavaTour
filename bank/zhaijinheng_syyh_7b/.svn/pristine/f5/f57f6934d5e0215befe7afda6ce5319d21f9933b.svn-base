<%@ page language="java" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style type="text/css">
		#logo{
			/*设置椭圆50%更灵活*/
			border-radius: 50%;
		}
		.animator_containter{
			margin: 0.5em auto; 
			background: transparent url(images/ani.gif) no-repeat scroll 0px 0px ; 
			width: 52px; 
			height: 37px; 
			cursor: pointer; 
		} 
		
	a:link {

color: #2c95ca;
text-decoration: none;
}

a:visited { 
color: #2c95ca;
text-decoration: none;
}

a:hover {
COLOR: green; TEXT-DECORATION: underline;position:relative;left:1px;top:1px;
}

a:active {
color: green;
text-decoration: underline;
}

	</style>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/timer.js"></script>
	
	

<table width="100%" height="100%" border="0" cellpadding="0" style="margin-top:-5px" cellspacing="0">
  <tr>
    <td width="21%"><div align="center"><img src="images/logo.jpg" id="logo" width="180" height="80"></div></td>
    <td width="79%" height="60"><table width="100%" border="0" bgcolor="#FFFFFF" style="">
      <tr>
          <%-- <s:iterator value="%{#session.mks}" id="mk">
          
             <s:if test="%{#mk.funcName == '系统管理'}">
	             <td width="10%">
			          <a href="./xtgl/userym.do?funcId=${mk.funcId }" target="msghtml">
			          <div id="divAni1" style="float:left;" class="animator_containter" onMouseOver="go1();return false;" onMouseOut="back1();return false;">					
					  </div><br><div id="newdiv1"  onmouseover="go1();return false;" onMouseOut="back1();return false;" style="font:12px Tahoma;font-weight:bold ;margin-right:0px;margin-top:55px;margin-left:0px;">系统管理</div></a>
				 </td>
			 </s:if>
             <s:if test="%{#mk.funcName == '报修管理'}">
	             <td width="10%">
			          <a href="./xtgl/userym.do?funcId=${mk.funcId }" target="msghtml">
			          <div id="divAni2" style="float:left;" class="animator_containter" onMouseOver="go2();return false;" onMouseOut="back2();return false;">					
					  </div><br><div id="newdiv2"  onmouseover="go2();return false;" onMouseOut="back2();return false;" style="font:12px Tahoma;font-weight:bold ;margin-right:0px;margin-top:55px;margin-left:0px;">报修管理</div></a>
				 </td>
			 </s:if>
             <s:if test="%{#mk.funcName == '巡检管理'}">
	             <td width="10%">
			          <a href="./xtgl/userym.do?funcId=${mk.funcId }" target="msghtml">
			          <div id="divAni3" style="float:left;" class="animator_containter" onMouseOver="go3();return false;" onMouseOut="back3();return false;">					
					  </div><br><div id="newdiv3"  onmouseover="go3();return false;" onMouseOut="back3();return false;" style="font:12px Tahoma;font-weight:bold ;margin-right:0px;margin-top:55px;margin-left:0px;">巡检管理</div></a>
				 </td>
			 </s:if>
		  </s:iterator> --%>
		  
		  <c:forEach items="${functions }" var="function">
		  	<c:if test="${function.funcName == '系统管理' }">
	             <td width="10%">
			          <a href="./user/leftList.do?funcId=${function.funcId }" target="msghtml" >
			          <div id="divAni1" style="float:left;" class="animator_containter" onMouseOver="go1();return false;" onMouseOut="back1();return false;">					
					  </div><br><div id="newdiv1"  onmouseover="go1();return false;" onMouseOut="back1();return false;" style="font:12px Tahoma;font-weight:bold ;margin-right:0px;margin-top:55px;margin-left:0px;">系统管理</div></a>
				 </td>
			</c:if>
			<c:if test="${function.funcName == '报修管理' }">
            
	             <td width="10%">
			          <a href="./user/leftList.do?funcId=${function.funcId }" target="msghtml" >
			          <div id="divAni2" style="float:left;" class="animator_containter" onMouseOver="go2();return false;" onMouseOut="back2();return false;">					
					  </div><br><div id="newdiv2"  onmouseover="go2();return false;" onMouseOut="back2();return false;" style="font:12px Tahoma;font-weight:bold ;margin-right:0px;margin-top:55px;margin-left:0px;">报修管理</div></a>
				 </td>
			</c:if>
			<c:if test="${function.funcName == '巡检管理' }">
	             <td width="10%">
			          <a href="./user/leftList.do?funcId=${function.funcId }" target="msghtml" >
			          <div id="divAni3" style="float:left;" class="animator_containter" onMouseOver="go3();return false;" onMouseOut="back3();return false;">					
					  </div><br><div id="newdiv3"  onmouseover="go3();return false;" onMouseOut="back3();return false;" style="font:12px Tahoma;font-weight:bold ;margin-right:0px;margin-top:55px;margin-left:0px;">巡检管理</div></a>
				 </td>
			</c:if>
		  </c:forEach>
		  <td align="right">
		  	<%--<input type="button" valign="top" align="right" value="注销" onclick="window.top.location.href='./xtgl/userlogout.do';">
		  	<input type="button" value="退出" onclick="window.top.close();">--%>
		  	<a href="${pageContext.request.contextPath }/user/logout.do" target="_top">退出</a>
		  </td>
		  	
        <td width="25%"></td>
      </tr>
    </table></td>
  </tr>
</table>
 <script type="text/javascript">
		//***************************Class _geekees.Animator********************************
		
		//initialize
		if (typeof(_geekees.Animator) == "undefined")
			_geekees.Animator = {};
		else
			alert("Animator is already set!");
	
		//constructor
		_geekees.Animator = function( containerId
										, width
										, height
										, initialPosX
										, initialPosY
										, motionTime
										, stepX
										, stepY ){
					
			this.container = $( containerId );
			this.container.style.width = width + "px";
			this.container.style.height = height + "px";
			this.container.style.backgroundPosition = initialPosX + "px " + initialPosY + "px";
			this.startPosX = 0;
			this.startPosY = 0;
			this.endPosX = 0;
			this.endPosY = 0;
			this.isForwardX = true;
			this.isForwardY = true;
			this.motionTime = motionTime;
			this.timer = new Timer( this );//initial the Timer class
			this.stepX = stepX;//each time moving step
			this.stepY = stepY;
		}
		
		//move method
		_geekees.Animator.prototype.move = function(){
			
			if (this.isForwardX) {
				if (this.startPosX < this.endPosX) {
					this.timer.setTimeout('move', this.motionTime);
					this.startPosX += this.stepX;
				}
			}
			else {
				if (this.startPosX > this.endPosX) {
					this.timer.setTimeout('move', this.motionTime);
					this.startPosX -= this.stepX;
				}
			}
			
			if (this.isForwardY) {
				if (this.startPosY < this.endPosY) {
					this.timer.setTimeout('move', this.motionTime);
					this.startPosY += this.stepY;
				}
			}
			else {
				if (this.startPosY > this.endPosY) {
					this.timer.setTimeout('move', this.motionTime);
					this.startPosY -= this.stepY;
				}
			}
			
			//set the container status
			this.container.style.backgroundPosition = this.startPosX + "px " + this.startPosY + "px";
			
		}
		
		//the method which to be called
		_geekees.Animator.prototype.animate = function( startX, endX, startY, endY ){
			this.startPosX = startX;
			this.endPosX = endX;
			this.startPosY = startY;
			this.endPosY = endY;
			
			this.isForwardX = startX <= endX;//determine whether start position is larger than end position
			this.isForwardY = startY <= endY;
						
			this.move();
		}
		//***************************End of Class _geekees.Animator********************************
		
		
		
		
		/******************test*******************/
		function go1(){
			ani1.animate( 0, -208, 0,  0 );
		}
		
		function back1(){
			ani1.animate( -208, 0,  0,  0 );
		}
		function go2(){
			ani2.animate( 0, -208, -37,  -37 );
		}
		
		function back2(){
			ani2.animate( -208, 0,  -37,  -37 );
		}
		function go3(){
			ani3.animate( 0, -208, -74,  -74 );
		}
		
		function back3(){
			ani3.animate( -208, 0,  -74,  -74 );
		}
		function go4(){
			ani4.animate( 0, -208, -111,  -111 );
		}
		
		function back4(){
			ani4.animate( -208, 0,  -111,  -111 );
		}
		function go5(){
			ani5.animate( 0, -208, -148,  -148 );
		}
		
		function back5(){
			ani5.animate( -208, 0,  -148,  -148 );
		}
		function go6(){
			ani6.animate( 0, -208, -185,  -185 );
		}
		
		function back6(){
			ani6.animate( -208, 0,  -185,  -185 );
		}
		function go7(){
			ani7.animate( 0, -208, -222,  -222 );
		}
		
		function back7(){
			ani7.animate( -208, 0,  -222,  -222 );
		}
		
		var ani1 = new _geekees.Animator( 'divAni1', 52, 37, 0, 0,  100 ,52, 0);
		var ani2 = new _geekees.Animator( 'divAni2', 52, 37, 0, -37,  100 ,52, 0);
		var ani3 = new _geekees.Animator( 'divAni3', 52, 37, 0, -74,  100 ,52, 0);
		var ani4 = new _geekees.Animator( 'divAni4', 52, 37, 0, -111,  100 ,52, 0);
		var ani5 = new _geekees.Animator( 'divAni5', 52, 37, 0, -148,  100 ,52, 0);
		var ani6 = new _geekees.Animator( 'divAni6', 52, 37, 0, -185,  100 ,52, 0);
		var ani7 = new _geekees.Animator( 'divAni7', 52, 37, 0, -222,  100 ,52, 0);

	</script>
</html>