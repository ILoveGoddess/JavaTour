
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

var inputid=null;
var divid=null;

//Called from keyup on the search textbox.
//Starts the AJAX request.

function searchSuggest(v1,v2)
{
	inputid=v1;
	divid=v2;
	if(searchReq.readyState == 0||searchReq.readyState == 4)
	{
		var str =document.getElementById(inputid).value;
	
		
		searchReq.open("POST", '../sbbx/sbbx!getwtlx.do', true);
		searchReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
		searchReq.onreadystatechange = handleSearchSuggest; 
		searchReq.send('wtlx='+str);
	}		
	
}
//Called when the AJAX response is returned.
function handleSearchSuggest()
{
	
	if(searchReq.readyState == 4)
	{
		var ss = document.getElementById(divid)
		ss.innerHTML = '';
		var str = searchReq.responseText.split("\n");//ͨ��responseText����ݣ�������ݣ�
		for(i=0;i< str.length - 1;i++)
		{
			//Build our element string.  This is cleaner using the DOM, but
			//IE doesn't support dynamically added attributes.
			var suggest = '<div onmouseover="javascript:suggestOver(this);" ';
			suggest += 'onmouseout="javascript:suggestOut(this);" ';
			suggest += 'onclick="javascript:setSearch(this.innerHTML);" ';
			suggest += 'class="suggest_link">' + str[i] + '</div>';
			ss.innerHTML += suggest;
		}
	}
}

//Mouse over function
function suggestOver(div_value) {
	div_value.className = 'suggest_link_over';
}
//Mouse out function
function suggestOut(div_value) {
	div_value.className = 'suggest_link';
}
//Click function
function setSearch(value) {
	document.getElementById(inputid).value = value;
	document.getElementById(divid).innerHTML = '';
}