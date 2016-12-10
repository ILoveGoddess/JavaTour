
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
	if(searchReq.readyState == 0 || searchReq.readyState == 4)
	{
		var str = document.getElementById(inputid).value;
		
		searchReq.open("POST", '../xtgl/checkUserName.do', true);
		searchReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
		searchReq.onreadystatechange = handleSearchSuggest; 
		
		searchReq.send('users.loginId='+str);
	}		
}

var repText = null;
//Called when the AJAX response is returned.
function handleSearchSuggest()
{
	//alert(searchReq.readyState);
	//alert(searchReq.status);
	if(searchReq.readyState == 4)
	{
		var msg = document.getElementById(divid)
		var str = searchReq.responseText;//ͨ��responseText���������ݣ�������ݣ�
		repText = str;
		if (parseInt(str) > 0) {
			msg.innerHTML = "<font color=red>用户ID已经存在了，请重新输入！</font>";
		}else {
			msg.innerHTML="";
		}
		
	}
}

function checkdata(){
	var loginId = document.all('users.loginId');
	var loginPassword = document.all('users.loginPassword');
	var checkpwd = document.all("checkpwd");//得到确认密码
	
	var Exp = /^\w+$/;
	if (loginId.value.length < 1 ||loginId.value.length > 10 || !Exp.test(loginId.value)) {
		alert('用户登陆ID不能为空且只能是字母和数字,且长度不能大于10！');
		loginId.focus();
		return false;
	}
	if (loginPassword.value.length < 1) {
		alert('用户登陆密码不能为空！');
		loginPassword.focus();
		return false;
	}
	
	
	if (checkpwd.value.length < 1) {
		alert("确认密码不能为空！");
		checkpwd.focus();
		return false;
	}
	
	if (checkpwd.value != loginPassword.value){
		alert("你两次输入的密码不一致，请重新输入！");
		checkpwd.focus();
		return false;
	}
	
	if (parseInt(repText) > 0) {
		alert('用户ID已经存在了，请重新输入！');
		return false;
	}
}
