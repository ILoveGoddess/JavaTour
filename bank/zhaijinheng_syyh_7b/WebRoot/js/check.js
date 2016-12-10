 //create client object 
function createAjaxObject(){
  var httprequest;
  if(window.XMLHttpRequest){   //Mozilla, Safari etc
     httprequest = new XMLHttpRequest();   
  }else if(window.ActiveXObject){   //IE
     try{
     httprequest = new ActiveXObject("Msxml2.XMLHTTP");  
    }catch(e){
        httprequest = new ActiveXObject("Microsoft.XMLHTTP");
    }
  }else{
       alert("Your Browser Sucks!\nIt's about time to upgrade don't you think?"); //其他浏览器
  }
    return httprequest;
}

var xmlHttpRequest = createAjaxObject();  //创建XMLHttpRequest对象，并赋给全局变量


//效验岗位新增页面数据
function checkJobName(name){
	 var id = document.getElementById("div1");
     var jobName = document.getElementById("jobName");
     if(jobName.value !=""){
    if(xmlHttpRequest.readyState ==0 || xmlHttpRequest.readyState ==4){
        xmlHttpRequest.open("POST","../../job/checkJobName.do", true);  //true异步访问
          xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");//处理ajax请求乱码
        xmlHttpRequest.onreadystatechange = function (){
           if(xmlHttpRequest.readyState ==4){
              var res = xmlHttpRequest.responseText;
              if(res == "0"){
                 id.innerHTML="<font color='red'>岗位名可以使用</font>";
              }else if(res == "1"){
                 id.innerHTML="<font color='red'>"+name+"</font>岗位名已经存在";
                 jobName.focus();
                 jobName.value="";
              }
           }
        };
     var tValue= jobName.value;
 	 var newValue="";
 	 for(var i=0;i<tValue.length;i++){
 	    if(tValue.charAt(i)!=" "){
 	      newValue+=tValue.charAt(i);
 	    }
 	 }
      xmlHttpRequest.send("job.name="+newValue);
    }
     }else{
       div1.innerHTML = "<font color='red'>岗位名称不能为空</font>";
       return false;
     }
}

function checkData() {
	var jobName = document.getElementById("jobName");
	if (jobName.value == "") {
		div1.innerHTML = "<font color='red'>岗位名称不能为空</font>";
		return false;
	}
		return true;
}

/**
 * 验证银行ID是否存在
 */
function checkBankId(name){
	var t= document.getElementById(name);
	 var tValue= t.value;
 	 var newValue="";
 	 for(var i=0;i<tValue.length;i++){
 	    if(tValue.charAt(i)!=" "){
 	      newValue+=tValue.charAt(i);
 	    }
 	 }
 	 t.value=newValue;
		          if(t.value!=""){
		           if(xmlHttpRequest.readyState ==0 || xmlHttpRequest.readyState ==4){
		        xmlHttpRequest.open("POST","./checkBankId.do", true);  //true异步访问
		         xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
		        xmlHttpRequest.onreadystatechange = function (){
		           if(xmlHttpRequest.readyState ==4){
		              var res = xmlHttpRequest.responseText;
		              var id = document.getElementById("show");
		              if(res == 0){
		                 id.innerHTML="<font color='green'>银行IP可以使用</font>";
		              }else if(res == 1){
		                 id.innerHTML="<font color='red'>"+name+"</font>已经存在";
		                 	 t.focus();
		                 t.value="";
		              }
		           }
		        };
		      xmlHttpRequest.send("id="+t.value.Trim());
		    }
		   }else{
		     alert("银行IP不能为空");
		     return false;
		   }
}
/**
 * 验证银行设备明细ID是否存在
 */
function checkBankEquId(name){
	var t= document.getElementById(name);
 	 var tValue= t.value;
 	 var newValue="";
 	 for(var i=0;i<tValue.length;i++){
 	    if(tValue.charAt(i)!=" "){
 	      newValue+=tValue.charAt(i);
 	    }
 	 }
 	 t.value=newValue;
          if(t.value!=""){
	           if(xmlHttpRequest.readyState ==0 || xmlHttpRequest.readyState ==4){
	        xmlHttpRequest.open("POST","./checkBankEquId.do", true);  //true异步访问
	        xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
	        xmlHttpRequest.onreadystatechange = function (){
           if(xmlHttpRequest.readyState ==4){
              var res = xmlHttpRequest.responseText;
              var id = document.getElementById("show");
              if(res == 0){
                 id.innerHTML="<font color='green'>设备明细编号可以使用</font>";
              }else if(res == 1){
                 id.innerHTML="<font color='red'>"+name+"</font>已经存在";
                 	 t.focus();
                 t.value="";
              }
           }
        };
      xmlHttpRequest.send("id="+newValue);
    }
   }else{
     alert("设备明细ID不能为空");
     return false;
   }
  }    

    function checkDeptname(name){
	var t= document.getElementById(name);
       if(t.value!=""){
           if(xmlHttpRequest.readyState ==0 || xmlHttpRequest.readyState ==4){
        xmlHttpRequest.open("POST","../../dept/checkDeptname.do", true);  //true异步访问
        xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
        xmlHttpRequest.onreadystatechange = function (){
           if(xmlHttpRequest.readyState ==4){
              var res = xmlHttpRequest.responseText;
              var id = document.getElementById("show");
              if(res == 0){
                 id.innerHTML="<font color='green'>部门名称可以使用</font>";
                 return true;
              }else if(res == 1){
                 id.innerHTML="<font color='red'>"+name+"</font>已经存在";
                 	 t.focus();
                 t.value="";
                 return false;
              }
           }
        };
      xmlHttpRequest.send('name='+t.value);
    }
   }else{
     alert("部门名称ID不能为空");
     return false;
   }
}
  
  

 function checkall()   //选中或不选当前页面的所有信息
  {
     var ids = document.getElementsByName("ymbhs"); 
           var selState = document.getElementsByName("allbox")[0];
           //alert(selState.checked);全选、撤销的脚本
           for(var i = 1 ; i <= ids.length ; ){
               var id = ids[i-1];
               id.checked = selState.checked;
               i = i+1;
           }
  }
  

 /**
  *去除2边的空格
  */
String.prototype.Trim = function() {
	return this.replace(/\s*/g, "");// 此方法为去除全部的空格！
};
  
  
/**
 * 银行设备种类ID是否存在
 */
  function checkEquipmentId(name){
     var t= document.getElementById(name);
   t.value=t.value.Trim();
       if(t.value!=""){
           if(xmlHttpRequest.readyState ==0 || xmlHttpRequest.readyState ==4){
        xmlHttpRequest.open("POST","./checkEquipmentId.do", true);  //true异步访问
        xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
        xmlHttpRequest.onreadystatechange = function (){
           if(xmlHttpRequest.readyState ==4){
              var res = xmlHttpRequest.responseText;
              var id = document.getElementById("show");
              if(res == 0){
                 id.innerHTML="<font color='green'>设备种类ID可以使用</font>";
              }else if(res == 1){
                 id.innerHTML="<font color='red'>设备种类ID已经存在</font>";
                 t.focus();
                 t.value="";
              }
           }
        };
       xmlHttpRequest.send("id="+t.value);
    }
   }
}
/**
 * 银行设备种类名称是否存在
 */
function checkEquipmentName(name){
	var t = document.getElementById(name);
	var id = document.getElementById("show1");
	t.value = t.value.Trim();
	if(t.value!=""){
		if(xmlHttpRequest.readyState == 0 || xmlHttpRequest.readyState == 4){
			xmlHttpRequest.open("POST","./checkEquipmentName.do?",true);
			xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
			xmlHttpRequest.onreadystatechange = function(){
				if(xmlHttpRequest.readyState == 4){
					var res = xmlHttpRequest.responseText;
					if(res == 0){
						id.innerHTML="<font color='green'>设备种类名称可以使用</font>";
					}else if(res == 1){
                     id.innerHTML="<font color='red'>设备种类名称已经存在</font>";
                     t.focus();
                     t.value="";
              }
           }
        };
       xmlHttpRequest.send("name="+t.value);
    }
   }
}
/**
*问题类型名称是否存在
*/
function checkFaultRepaitTypeName(name){
      var t = document.getElementById(name);
      var id = document.getElementById("show");
      t.value = t.value.Trim();
      if(t.value!=""){
        if(xmlHttpRequest.readyState == 0 || xmlHttpRequest.readyState == 4){
             xmlHttpRequest.open("POST","./checkFaultRepaitTypeName.do?",true);
            xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
			xmlHttpRequest.onreadystatechange = function(){
                if(xmlHttpRequest.readyState == 4){
                  var res = xmlHttpRequest.responseText;
                  if(res == 0){
                    id.innerHTML="<font color='green'>问题类型名称可以使用</font>";
                  }else if(res == 1){
                     id.innerHTML="<font color='red'>问题类型名称已经存在</font>";
                     t.focus();
                     t.value="";
              }
           }
        };
       xmlHttpRequest.send("name="+t.value);
    }
   }
}

function checkdata(){
  var eId = document.getElementById("EqumentId");
  var  eName = document.getElementById("EqumentName");
   var id = document.getElementById("show");
   var id1 = document.getElementById("show1");
  
  if(eId.value == ""){
      id.innerHTML="<font color='red'>ID不能为空！</font>";
      return false;
  }
  if(eName.value == ""){
    id1.innerHTML="<font color='red'>名称不能为空</font>";
    return false;
  }
  return true;
}
function checkdataRepairType(){
  var eId = document.getElementById("PitypeValue");
   var id = document.getElementById("show");
  
  if(eId.value == ""){
      id.innerHTML="<font color='red'>问题类型名称ID不能为空</font>";
      return false;
  }
  return true;
}
