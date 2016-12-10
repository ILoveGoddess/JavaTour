

//Gets the browser specific XmlHttpRequest Object
function getXmlHttpRequestObject()
{
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		alert("Your Browser Sucks!\nIt's about time to upgrade don't you think?");
	}
}
function createAjaxObj()
{
  var httprequest=null;
  if(window.XMLHttpRequest)
  { // if Mozilla, Safari etc
    httprequest=new XMLHttpRequest()
  }else if(window.ActiveXObject){ // if IE
     try{
       httprequest=new ActiveXObject("Msxml2.XMLHTTP");
     }catch(e){
       try{
          httprequest=new ActiveXObject("Microsoft.XMLHTTP");
       }catch(e){
       	
       }
     }
   }
   return httprequest
}
//Our XmlHttpRequest object to get the auto suggest
var searchReq = createAjaxObj();//readState=4



//Called from keyup on the search textbox.
//Starts the AJAX request.

function checksbmx()
{
	
	if(searchReq.readyState == 0||searchReq.readyState == 4)
	{
		var str1 = escape(document.getElementById("wdxx").value);
		var str2 = escape(document.getElementById("sbzl").value);
		searchReq.open("POST", '../sbbx/sbbx!getsbmx.do?po.bank.bankId='+str1+'&po.equipmenttype.equipmentId='+str2, true);
		searchReq.onreadystatechange = handleSearchSuggest; 
		searchReq.send();
	}		
}
//Called when the AJAX response is returned.
function handleSearchSuggest()
{
	if(searchReq.readyState == 4 )
	{
		var sss = document.getElementById("sbmx");
	    sss.length=0;
		var str =searchReq.responseText//通过responseText获得响应的数据（接受数据）
	  
	    var arr=str.split(";");
	    
	    for(var i=0; i<arr.length-1;i++ ){
			  
			  var option = new Option(arr[i],arr[i]);
			  sss.options[i]=option;
		}
  }

}


String.prototype.Trim = function() {
	return this.replace(/\s*/g, "");// 此方法为去除全部的空格！
};

   function getSblshs(sbzlId ,sbls){
      	var key;
      	var value ;
      	var option 
      	var sb=document.getElementById(sbls);
      	sb.innerHTML='';
        option = new Option('请选择');
        option.value='';
      	sb.options[0]=option;
      	if(searchReq.readyState==4||searchReq.readyState==0){
      		searchReq.open("POST","../sbxj/getSblsmxes.do?sbxj.equipmenttype.equipmentId="+sbzlId, true)
      		searchReq.onreadystatechange=function(){
      			if(searchReq.readyState==4){
      				if(searchReq.status==200){
      					var msg=searchReq.responseText;
      					var sblses=msg.split(",");
      				   if(sblses.toString()!=""){
      				   		for(var i=0;i<sblses.length;i++){
      						key=((sblses[i]).split("="))[0].Trim();
      						value=((sblses[i]).split("="))[1].Trim();
      						option = new Option(value);
      						option.value=key;
      						sb.options[i+1]=option;
      					}
      				   }
      				}
      			}
      		}
      		searchReq.send(null);
      	}
      }