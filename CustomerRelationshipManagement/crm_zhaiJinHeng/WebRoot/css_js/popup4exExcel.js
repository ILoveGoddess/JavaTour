// JavaScript Document

var popupStatus = 0;
function loadPopup_excel(objname){
	if(window.ActiveXObject){
		$(window.parent.document).find(":div#backgroundPopup").html("<iframe style='width:100%;height:100%;filter:alpha(opacity=0);-moz-opacity:0'></iframe>");
		
	}
			$(window.parent.document).find(":div#dictionaryMsg").html("");
			$(window.parent.document).find(":div#contactArea").html("");
			centerPopup_excel();
			if(popupStatus == 0){
				$(window.parent.document).find(":div#backgroundPopup").css({
					"opacity":"0.3"						  
				});
				$(window.parent.document).find(":div#popupContact").fadeIn("slow");
				$(window.parent.document).find(":div#backgroundPopup").fadeIn("slow");
				popupStatus = 1;
			}
			var str = "";
			str += '<input type="radio" name="exportExcelOption" value="excel_all" checked="checked">导出所有记录<br/>' ;
			str += '<input type="radio" name="exportExcelOption" value="excel_page">导出当前页面记录<br/>' ;
			str += '<input type="radio" name="exportExcelOption" value="excel_selected">导出选中记录<br/>' ;
			str += '<input type="button" value="确定" onclick="exportExcelBySelect()">';
			$(window.parent.document).find(":div#contactArea").html(str);
			$(window.parent.document).find(":div#popupContact h1").html(objname);
}

function centerPopup_excel(){
	var windowWidth = screen.width;
	var windowHeight = document.body.scrollTop+(screen.height/2-$(window.parent.document).find(":div#popupContact").height()/2-110);
	
	var popupWidth = $(window.parent.document).find(":div#popupContact").width();
	var popupHeight = $(window.parent.document).find(":div#popupContact").height();
	
	$(window.parent.document).find(":div#popupContact").css({
		"position":"absolute",
		"top": windowHeight,
		"left":windowWidth/2 - popupWidth/2,
		"width":270,
		"height":310
	});
	$(window.parent.document).find(":div#contactArea").css({
		
		"width":240,
		"height":240
	});
	
}

function disablePopup_excel(){
	if(popupStatus == 1){
		$(window.parent.document).find(":div#popupContact").fadeOut("slow");
		$(window.parent.document).find(":div#backgroundPopup").fadeOut("slow");
		popupStatus = 0;
	}
}

$(document).ready(function(){
		$(window.parent.document).find(":div#popupContactClose").click(function(){
			disablePopup_excel();
		});
		
		//$(window.parent.document).find(":div#backgroundPopup").click(function(){
		//	disablePopup_excel();	
		//});
	
});

//导出全部的excel记录
function exportAll(exportType){
	
	var o = $(window.frames["right_window"].document).find(":input#exportType");
	o.val(exportType);
	window.frames["right_window"].document.forms[0].submit();
	o.val("");
	//javascript:window.location.href='exportCompanyExcel.action?exportType='+exportType;
	window.frames["right_window"].disablePopup_excel();
}

//导出当前页的excel记录
function exportPage(exportType){
	var o = $(window.frames["right_window"].document).find(":input#exportType");
	o.val(exportType);
	//var o = $(window.frames["right_window"].document).find(":input#hiddenPageNum");
	//javascript:window.location.href='exportCompanyExcel.action?pageNum='+o.val()+'&exportType='+exportType;
	window.frames["right_window"].document.forms[0].submit();
	o.val("");
	window.frames["right_window"].disablePopup_excel();
}

//导出当前所有选中项的excel记录
function exportSelected(exportType){
	var o = $(window.frames["right_window"].document).find(":input#exportType");
	o.val(exportType);
	window.frames["right_window"].document.forms[0].submit();
	//javascript:window.location.href='exportCompanyExcel.action?exportType='+exportType;
	o.val("");
	//清空复选框
	var company_ids = window.frames["right_window"].document.getElementsByName("company_id");
	
	for(var i = 0; i < company_ids.length; i++){
		company_ids[i].checked = "";
	}
	window.frames["right_window"].document.getElementById("ids").checked="";
	
	window.frames["right_window"].disablePopup_excel();
}




