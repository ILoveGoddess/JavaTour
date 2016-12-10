// JavaScript Document

var popupStatus = 0;
function loadPopup4Linkman(objname){
	//判断浏览器类型
	if(window.ActiveXObject){
		//第一种解决方案：通过一个透明的iframe解决
		$(window.parent.parent.document).find(":div#backgroundPopup").html("<iframe style='width:100%;height:100%;filter:alpha(opacity=0);-moz-opacity:0'></iframe>");
		//第二种方案：直接隐藏所有的select
		//取得页面中所有的select对像，也就是一个数组
		//var selects = document.getElementsByTagName("select");
		//for(var i = 0; i < selects.length;i++){
		//	selects[i].style.display = "none";
		//}
	}
	var queryString = {code:objname};
	//通过ajax方式传递数据
	$.ajax({
		type:"post",
		url:"getDictinaryDetails.action",
		data:queryString,
		dataType:"json",
		success: function(msg) {
			$(window.parent.parent.document).find(":div#dictionaryMsg").html("");
			$(window.parent.parent.document).find(":div#contactArea").html("");
			var str = "<input type='button' value='保存' onclick=updateValue4Linkman('"+objname+"');>&nbsp;&nbsp;<br/><br/>";
			if(msg.SDictionaryDetails.length < 1){
				str += "<br/><input type='text' value='' class='newvalue'/>";
				$(window.parent.parent.document).find(":div#contactArea").html(str);
				$(window.parent.parent.document).find(":div#popupContact h1").html("编辑选项");
			}else{
				for(var i = 0; i < msg.SDictionaryDetails.length; i++){
					str += "<br/><input type='text' class='oldvalue' name='"+msg.SDictionaryDetails[i].id+"' value='"+msg.SDictionaryDetails[i].value+"'/><input type='button' value='向上' onclick=upsort4Linkman('"+msg.SDictionaryDetails[i].sort+"','"+objname+"')><input type='button' value='向下' onclick=downsort4Linkman('"+msg.SDictionaryDetails[i].sort+"','"+objname+"')><input type='button' value='删除' onclick=del4Linkman('"+msg.SDictionaryDetails[i].id+"','"+objname+"')>";
				}
			
				str += "<br/><input type='text' value='' class='newvalue'/>";
				$(window.parent.parent.document).find(":div#contactArea").html(str);
				$(window.parent.parent.document).find(":div#popupContact h1").html("编辑--"+msg.SDictionaryDetails[0].SDictionaryClass.name);
			}
			
			
			centerPopup4Linkman();
			if(popupStatus == 0){
				$(window.parent.parent.document).find(":div#backgroundPopup").css({
					"opacity":"0.3"						  
				});
				$(window.parent.parent.document).find(":div#popupContact").fadeIn("slow");
				$(window.parent.parent.document).find(":div#backgroundPopup").fadeIn("slow");
				popupStatus = 1;
			}
			//change selectoption value
			
        }
	});
	
}

function updateValue4Linkman(objname) {
	var objs = $(window.parent.parent.document).find(":div#contactArea .oldvalue");
	var addObj = $(window.parent.parent.document).find(":div#contactArea .newvalue").val();

	var objstr = "";
	for ( var i = 0; i < objs.length; i++) {
		objstr += objs[i].name + "@" + objs[i].value + ",";
	}
	var queryString = {
		value : objstr,
		newValue : addObj,
		objname : objname
	};
	$.ajax( {
		type : "post",
		url : "updateDictionaryDetails.action",
		data : queryString,
		dataType : "json",
		success : function(msg) {
			loadPopup4Linkman(objname);
			getNewVal4Linkman(objname);
			$(window.parent.parent.document).find(":div#dictionaryMsg").html("修改成功！");
		}
	});

}
function upsort4Linkman(sort,objname){
	var queryString = {sort : sort,code : objname};
	$.ajax({
		type:"post",
		url:"upsortDictionaryDetails.action",
		data:queryString,
		dataType:"json",
		success: function(msg) {
			loadPopup4Linkman(objname);
			getNewVal4Linkman(objname);
			$(window.parent.parent.document).find(":div#dictionaryMsg").html("向上移动成功！");
		}
	});
}
function downsort4Linkman(sort,objname){
	var queryString = {sort : sort,code : objname};
	$.ajax({
		type:"post",
		url:"downsortDictionaryDetails.action",
		data:queryString,
		dataType:"json",
		success: function(msg) {
			loadPopup4Linkman(objname);
			getNewVal4Linkman(objname);
			$(window.parent.parent.document).find(":div#dictionaryMsg").html("向下移动成功！");
		}
	});
}
function del4Linkman(_id,objname){
	var queryString = {id : _id};
	$.ajax({
		type:"post",
		url:"deleteDictionaryDetails.action",
		data:queryString,
		dataType:"json",
		success: function(msg) {
			loadPopup4Linkman(objname);
			getNewVal4Linkman(objname);
			$(window.parent.parent.document).find(":div#dictionaryMsg").html("删除成功！");
		}
	});
}
function centerPopup4Linkman(){
	var windowWidth = screen.width;
	var windowHeight = document.body.scrollTop+(screen.height/2-$(window.parent.parent.document).find(":div#popupContact").height()/2-110);
	
	var popupWidth = $(window.parent.parent.document).find(":div#popupContact").width();
	var popupHeight = $(window.parent.parent.document).find(":div#popupContact").height();
	
	$(window.parent.parent.document).find(":div#popupContact").css({
		"position":"absolute",
		"top": windowHeight,
		"left":windowWidth/2 - popupWidth/2,
		"width":384,
		"height":408
	});
	
	$(window.parent.parent.document).find(":div#contactArea").css({
		"width":390,
		"height":300
	});
	
}

function disablePopup4Linkman(){
	if(popupStatus == 1){
		
		$(window.parent.parent.document).find(":div#popupContact").fadeOut("slow");
		$(window.parent.parent.document).find(":div#backgroundPopup").fadeOut("slow");
		popupStatus = 0;
		
		//var selects = document.getElementsByTagName("select");
		//for(var i = 0; i < selects.length;i++){
		//	selects[i].style.display = "block";
		//}
	}
}

$(document).ready(function(){
		$(window.parent.parent.document).find(":div#popupContactClose").click(function(){
			disablePopup4Linkman();	
		});
		
		//$("#backgroundPopup").click(function(){
		//	disablePopup();	
		//});
	
});