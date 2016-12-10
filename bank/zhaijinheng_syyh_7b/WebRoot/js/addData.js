function Add(){
				var sel1=document.getElementById("sel1");
				var sel2=document.getElementById("sel2");
				if (sel1.selectedIndex<0) {
				  alert("请选择一个待选按钮！");
				  return;
				}
				sel2.options[sel2.length]=new Option(sel1.options[sel1.selectedIndex].innerHTML,sel1.options[sel1.selectedIndex].value);
				sel1.options.remove(sel1.selectedIndex);
			
				for(var i=0;i<sel2.options.length;i++){
				  sel2.options[i].selected=true;
				}
				}
				// 从已选中删除
function Del(){
				var sel1=document.getElementById("sel1");
				var sel2=document.getElementById("sel2");
				var nIndex = sel2.selectedIndex;
				var nLen = sel2.length;
				if (nLen<1) return;
				if (nIndex<0) {
				  alert("请选择一个已选按钮！");
				  return;
				}
				sel1.options[sel1.length]=new Option(sel2.options[sel2.selectedIndex].innerHTML,sel2.options[sel2.selectedIndex].value);
				sel2.options.remove(sel2.selectedIndex);
				for(var i=0;i<sel2.options.length;i++){
				  sel2.options[i].selected=true;
				}
				sel2.length=nLen-1;
               }
               
               
function getXMLHttpRequestObj(){
						var responseHttp;
					  if(window.XMLHttpRequest){//验证是否是mozilla
					      responseHttp=new XMLHttpRequest();
					  }else{
					    try{
					      responseHttp=new ActiveXObject("Msxml2.XMLHTTP");//是IE
					    }catch(e){
					      try{
					        responseHttp=new ActiveXObject("Microsoft.XMLHTTP");
					      }catch(e){
					      }
					    }
					  }
 					 return responseHttp;
				    } 
var xmlHttp=getXMLHttpRequestObj();



function getChild(sel_Val,sel){
	     	var selEle=document.all(sel);
	     	 selEle.length=0;
			 if(sel_Val!=""){	
				 if(xmlHttp.readyState==0||xmlHttp.readyState==4){
				     xmlHttp.open("POST","./findWokers.do?piwoker.piGroup.groupId="+sel_Val,true);
				     xmlHttp.onreadystatechange=function(){
				         if(xmlHttp.readyState==4){
				             var resText=xmlHttp.responseText;
				             if(resText.indexOf("no")!=-1){
				             	selEle.length=0
				             }else{
				                var workers= resText.split(";");
						             for(var i=0;i<workers.length;i++){
						                 var worker= workers[i].split(",");
						                 for(var j=0;j<worker.length;j++){
						                    var w_id=worker[0];
						                    var w_name=worker[1];
						                    selEle.options[i]=new Option(w_name,w_id);
						                    selEle.options[i].selected=true;
						                 }
						           }
				             }
				         }
				     }
				     xmlHttp.send();
				   }
			 }  
      }
              
              
              
              
              
              
              
              
              
              