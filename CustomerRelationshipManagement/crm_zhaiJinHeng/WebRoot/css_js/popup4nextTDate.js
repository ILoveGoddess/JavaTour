// JavaScript Document

var popupStatus = 0;
function loadPopup4nextTDate(objname){
	if(window.ActiveXObject){
		$(window.parent.document).find(":div#backgroundPopup").html("<iframe style='width:100%;height:100%;filter:alpha(opacity=0);-moz-opacity:0'></iframe>");
		
	}
			$(window.parent.document).find(":div#dictionaryMsg").html("");
			$(window.parent.document).find(":div#contactArea").html("");
			centerPopup4nextTDate();
			if(popupStatus == 0){
				$(window.parent.document).find(":div#backgroundPopup").css({
					"opacity":"0.3"						  
				});
				$(window.parent.document).find(":div#popupContact").fadeIn("slow");
				$(window.parent.document).find(":div#backgroundPopup").fadeIn("slow");
				popupStatus = 1;
			}
			$(window.parent.document).find(":div#contactArea").html("<iframe style='width:100%;height:100%;' name='nextTDatePage' src='cal.jsp' frameborder='0'></iframe>");
			$(window.parent.document).find(":div#popupContact h1").html(objname);
}

function centerPopup4nextTDate(){
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

function disablePopup4nextTDate(){
	if(popupStatus == 1){
		$(window.parent.document).find(":div#popupContact").fadeOut("slow");
		$(window.parent.document).find(":div#backgroundPopup").fadeOut("slow");
		popupStatus = 0;
		getNextTDate();
	}
}

$(document).ready(function(){
		$(window.parent.document).find(":div#popupContactClose").click(function(){
			disablePopup4nextTDate();	
		});
		
		//$(window.parent.document).find(":div#backgroundPopup").click(function(){
		//	disablePopup4nextTDate();	
		//});
	
});