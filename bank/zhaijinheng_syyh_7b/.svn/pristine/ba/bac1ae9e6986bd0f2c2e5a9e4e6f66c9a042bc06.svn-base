<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'workgroup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
     <script type="text/javascript" src="../../js/addData.js"></script>
		
		<script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript">
		$.ajax({
			url:"<%=basePath %>PiGroup/resetWorker.do",
			type:"get",
			data:"flag=group",
			dataType:"json",
			success:function(data){
				for(var i in data){
					$("#group").append($("<option value='"+data[i].groupId+"'>"+data[i].groupName+"</option>"));
				}
			}
		});
		$(function(){
		$("#group").change(function(){
			$("#sel2")[0].length = 0;
			var groupId = $("#group").val();
			
			$.ajax({
				url:"<%=basePath %>PiGroup/resetWorker.do",
				type:"get",
				data:"flag=worker&groupId="+groupId,
				dataType:"json",
				success:function(data){				
					for(var i in data){
						$("#sel2").append($("<option value='"+data[i].workerId+"'>"+data[i].workerName+"</option>"));
					}
				}
			});
		});
		
		
		});
		</script>
		
  </head> 
  <body>  
   <table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="2%" align="center">
							</td>
							<td width="98%">
								<span class="sys_list_yh">系统管理&gt;&gt;巡检组列表&gt;&gt;重新分配巡检工</span>
							</td>
						</tr>
					</table>
     
       
       <form action="<%=basePath %>inspectionGroup/changeWorkerGroup.do" method="post">
       <table width="500" height="400" align="center">
         <tr height="100">
           <td colspan="2">
               选择巡检组：
             <select   id="group"  name="group" style="width:120pt">
             		<option value="">请选择</option>
                    <c:forEach items="${groups }" var="group">
                       <option  value="${group.groupId }"   <c:if test="${group.groupId == groupId }">selected="selected"</c:if>  >${group.groupName}</option>
                    </c:forEach>
             </select>
           </td>
         </tr>
           <tr valign="top" height="300">
 			  <td width="40%" height="50%">
 			     <table>
 			       <select style="width:120pt" size="10" id="sel2" name="sel2"　  > 
 			       		  
 			      </select>
 			      
 			     </table>
 			  </td>	          
 			  <td valign="top">
 			     <input type="button" value="<<" onclick="Add();"><br>
 			     <input type="button" value=">>" onclick="Del();"><br>
 			  </td>
 			  <td width="40%" height="50%">
 			      <select style="width:120pt" size="10" id="sel1" name="sel1"　 multiple="true" > 	
 			      	
 			      </select>
 			  </td>
           </tr>                         
        </table> 
         <p align="center">
           <input type="submit" value="提交">
         
           <input type="button" value="返回" onclick="history.back();">
         </p>      
      </form>
      
 			    
 			      
 	 
  </body>
</html>

