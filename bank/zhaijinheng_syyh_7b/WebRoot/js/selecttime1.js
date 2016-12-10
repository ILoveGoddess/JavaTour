var gdCtrl = new Object();
var goSelectTag = new Array();
var gcGray   = "#cccccc";
var gcToggle = "#FB8664";
var gcBG = "#FFFFFF";
var previousObject = null;

var gdCurDate = new Date();
var giYear = gdCurDate.getFullYear();
var giMonth = gdCurDate.getMonth()+1;
var giDay = gdCurDate.getDate();
/*
*START为开始时间的TEXT对象 ，END为结束时间的TEXT对象
*/
function checkOutTime(start, end)
	{
		var startTime = start.value
		var endTime = end.value
		if(startTime>0 && endTime>0)
		{
			if(endTime-startTime>=0) return true;
			else
			{
				alert("结束时间应大于开始时间 !");
				return false;
			}
		}
		return true;
	}
/*
*校验时间合法性
*/
function check_date(dateObj)
{var year=dateObj.value.substring(0,4);
 var month=dateObj.value.substring(4,6);
 var day=dateObj.value.substring(6,8);
 var err=0;
 if(year>9999||year<0000)
 {alert("年份大小非法，请输入0000-9999范围内！");
  dateObj.value="";
  dateObj.focus();
  err++;
 }
 if(month>12||month<1)
 {alert("月份大小非法！");
  dateObj.value="";
  dateObj.focus();
  err++;
 }
 if(day>31||day<1)
 {alert("日大小非法！");
  dateObj.value="";
  dateObj.focus();
  err++;
 }
 if((year%4)==0&&((year%100)!=0||(year%400)==0))
 {if(month==2)
  {if(day>29)
   {
     alert("对不起，日超出29天");
     dateObj.value="";
     dateObj.focus();
     err++;
   }
  }
 }
 else
 {
  if(month==2)
  {if(day>28)
   {
     alert("对不起，日超出28天");
     dateObj.value="";
     dateObj.focus();
    err++;
   }
  }
 }
 if(err)
	 return false;
 else
	 return true;
}


function fSetDate(iYear, iMonth, iDay){
  VicPopCal.style.visibility = "hidden";
  if ((iYear == 0) && (iMonth == 0) && (iDay == 0)){
  	gdCtrl.value = "";
  }else{
  	iMonth = iMonth + 100 + "";
  	iMonth = iMonth.substring(1);
  	iDay   = iDay + 100 + "";
  	iDay   = iDay.substring(1);
  	if(gdCtrl.tagName == "INPUT"){
  	  	gdCtrl.value = iYear + "" + iMonth + "" + iDay;
  	}else{
  	  	gdCtrl.innerText = iYear + "" + iMonth + "" + iDay;
  	}
  }

  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;

  window.returnValue=gdCtrl.value;
  //window.close();

}

function HiddenDiv()
{
	var i;
  VicPopCal.style.visibility = "hidden";
  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;

}
function fSetSelected(aCell){
  var iOffset = 0;
  var iYear = parseInt(tbSelYear.value);
  var iMonth = parseInt(tbSelMonth.value);

  aCell.bgColor = gcBG;
  with (aCell.children["cellText"]){
  	var iDay = parseInt(innerText);
  	if (color==gcGray)
		iOffset = (Victor<10)?-1:1;
	iMonth += iOffset;
	if (iMonth<1) {
		iYear--;
		iMonth = 12;
	}else if (iMonth>12){
		iYear++;
		iMonth = 1;
	}
  }
  fSetDate(iYear, iMonth, iDay);
}

function Point(iX, iY){
	this.x = iX;
	this.y = iY;
}

function fBuildCal(iYear, iMonth) {
  var aMonth=new Array();
  for(i=1;i<7;i++)
  	aMonth[i]=new Array(i);

  var dCalDate=new Date(iYear, iMonth-1, 1);
  var iDayOfFirst=dCalDate.getDay();
  var iDaysInMonth=new Date(iYear, iMonth, 0).getDate();
  var iOffsetLast=new Date(iYear, iMonth-1, 0).getDate()-iDayOfFirst+1;
  var iDate = 1;
  var iNext = 1;

  for (d = 0; d < 7; d++)
	aMonth[1][d] = (d<iDayOfFirst)?-(iOffsetLast+d):iDate++;
  for (w = 2; w < 7; w++)
  	for (d = 0; d < 7; d++)
		aMonth[w][d] = (iDate<=iDaysInMonth)?iDate++:-(iNext++);
  return aMonth;
}

function fDrawCal(iYear, iMonth, iCellHeight, sDateTextSize) {
  var WeekDay = new Array("日","一","二","三","四","五","六");
  var styleTD = " bgcolor='"+gcBG+"' bordercolor='"+gcBG+"' valign='middle' align='center' height='"+iCellHeight+"' style='font:bold arial;font-size:12px; "+sDateTextSize+";";            //Coded by Liming Weng(Victor Won) email:victorwon@sina.com
  var styleTD2 = " bgcolor='#ECF1F7' style='font-size:12px' bordercolor='"+gcBG+"' valign='middle' align='center' height='"+iCellHeight+"' style='font:bold arial "+sDateTextSize+";";            //Coded by Liming Weng(Victor Won) email:victorwon@sina.com

  with (document) {
	write("<tr>");
	for(i=0; i<7; i++){
		write("<td "+styleTD2+"color:#990099' >"+ WeekDay[i] + "</td>");
	}
	write("</tr>");

  	for (w = 1; w < 7; w++) {
		write("<tr>");
		for (d = 0; d < 7; d++) {
			write("<td id=calCell "+styleTD+"cursor:hand;' onMouseOver='this.bgColor=gcToggle' onMouseOut='this.bgColor=gcBG' onclick='fSetSelected(this)'>");
			write("<font id=cellText Victor='Liming Weng'> </font>");
			write("</td>")
		}
		write("</tr>");
	}
  }
}

function fUpdateCal(iYear, iMonth) {
  myMonth = fBuildCal(iYear, iMonth);
  var i = 0;
  for (w = 0; w < 6; w++)
	for (d = 0; d < 7; d++)
		with (cellText[(7*w)+d]) {
			Victor = i++;
			if (myMonth[w+1][d]<0) {
				color = gcGray;
				innerText = -myMonth[w+1][d];
			}else{
				color = ((d==0)||(d==6))?"red":"black";
				innerText = myMonth[w+1][d];
			}
		}
}

function fSetYearMon(iYear, iMon){
  tbSelMonth.options[iMon-1].selected = true;
  for (i = 0; i < tbSelYear.length; i++)
	if (tbSelYear.options[i].value == iYear)
		tbSelYear.options[i].selected = true;
  fUpdateCal(iYear, iMon);
}

function fPrevMonth(){
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;

  if (--iMon<1) {
	  iMon = 12;
	  iYear--;
  }

  fSetYearMon(iYear, iMon);
}

function fNextMonth(){
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;

  if (++iMon>12) {
	  iMon = 1;
	  iYear++;
  }

  fSetYearMon(iYear, iMon);
}

function fToggleTags(){
 with (document.all.tags("SELECT")){
 	for (i=0; i<length; i++)
 		if ((item(i).Victor!="Won")&&fTagInBound(item(i))){
 			item(i).style.visibility = "hidden";
 			goSelectTag[goSelectTag.length] = item(i);
 		}
  }
}

function fTagInBound(aTag){
  with (VicPopCal.style){
  	var l = parseInt(left);
  	var t = parseInt(top);
  	var r = l+parseInt(width);
  	var b = t+parseInt(height);
	var ptLT = fGetXY(aTag);
	return !((ptLT.x>r)||(ptLT.x+aTag.offsetWidth<l)||(ptLT.y>b)||(ptLT.y+aTag.offsetHeight<t));
  }
}

function fGetXY(aTag){
  var oTmp = aTag;
  var pt = new Point(0,0);
  do {
  	pt.x += oTmp.offsetLeft;
  	pt.y += oTmp.offsetTop;
  	oTmp = oTmp.offsetParent;
  } while(oTmp.tagName!="BODY");
  return pt;
}

// Main: popCtrl is the widget beyond which you want this calendar to appear;
//       dateCtrl is the widget into which you want to put the selected date.
// i.e.: <input type="text" name="dc" style="text-align:center" readonly><INPUT type="button" value="V" onclick="fPopCalendar(dc,dc);return false">
function fPopCalendar(popCtrl, dateCtrl,strDate){
  if (popCtrl == previousObject){
	  	if (VicPopCal.style.visibility == "visible"){
  		HiddenDiv();
  		return true;
  	}

  }
  previousObject = popCtrl;
  gdCtrl = dateCtrl;
  fInitialDate(strDate);
  fSetYearMon(giYear, giMonth);
  var point = fGetXY(popCtrl);

  with (VicPopCal.style) {
  	left = point.x;
	top  = point.y+popCtrl.offsetHeight;
	width = VicPopCal.offsetWidth;
	height = VicPopCal.offsetHeight;
        if(parseInt(left)>(window.screen.width-200)){
          left=10;
        }
        if(parseInt(top)>(window.screen.height-400)){
          top=10;
        }
	fToggleTags(point);
	visibility = 'visible';
  }
}

function fPopUpCalendar(popCtrl, dateCtrl,strDate){
  if (popCtrl == previousObject){
	  	if (VicPopCal.style.visibility == "visible"){
  		HiddenDiv();
  		return true;
  	}

  }
  previousObject = popCtrl;
  gdCtrl = dateCtrl;
  fInitialDate(strDate);
  fSetYearMon(giYear, giMonth);
  var point = fGetXY(popCtrl);
  with (VicPopCal.style) {
  	left = point.x;
	top  = point.y-VicPopCal.offsetHeight;
	width = VicPopCal.offsetWidth;
	height = VicPopCal.offsetHeight;
	fToggleTags(point);
	visibility = 'visible';
  }
}

// Added by Danian Zhang/SUI
function fInitialDate(strDate){
	if( strDate == null || strDate.length != 10 )
		return false;

	var sYear  = strDate.substring(0,4);
	var sMonth = strDate.substring(5,7);
	var sDay   = strDate.substring(8,10);

	if( sMonth.charAt(0) == '0' ) { sMonth = sMonth.substring(1,2); }
	if( sDay.charAt(0)   == '0' ) { sDay   = sDay.substring(1,2);   }

	var nYear  = parseInt(sYear );
	var nMonth = parseInt(sMonth);
	var nDay   = parseInt(sDay  );

	if ( isNaN(nYear ) )	return false;
	if ( isNaN(nMonth) )	return false;
	if ( isNaN(nDay  ) )	return false;

	var arrMon = new Array(12);
	arrMon[ 0] = 31;	arrMon[ 1] = nYear % 4 == 0 ? 29:28;
	arrMon[ 2] = 31;	arrMon[ 3] = 30;
	arrMon[ 4] = 31;	arrMon[ 5] = 30;
	arrMon[ 6] = 31;	arrMon[ 7] = 31;
	arrMon[ 8] = 30;	arrMon[ 9] = 31;
	arrMon[10] = 30;	arrMon[11] = 31;

	if ( nYear  < 1900 || nYear > 2100 )			return false;
	if ( nMonth < 1 || nMonth > 12 )				return false;
	if ( nDay < 1 || nDay > arrMon[nMonth - 1] )	return false;

	giYear  = nYear;
	giMonth = nMonth;
	giDay   = nDay;
	return true;
}

var gMonths = new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");

with (document) {
write("<Div id='VicPopCal' style='OVERFLOW:hidden;POSITION:absolute;VISIBILITY:hidden;border:2px ridge;z-index:100;font-size:12px;'>");
write("<table border='0' bgcolor='#ECF1F7' style='font-size:12px;'>");
write("<TR>");
write("<td valign='middle' align='center' style='font-size:12px;'><input type='button' name='PrevMonth' value='<' style='height:20;width:20;FONT:bold;font-size:12px' onClick='fPrevMonth()'>");
write("&nbsp;<SELECT style='font-size:12px;' name='tbSelYear' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won' class=small>");
for(i=1900;i<2015;i++)
	write("<OPTION value='"+i+"'>"+i+" 年</OPTION>");
write("</SELECT>");
write("&nbsp;<select style='font-size:12px;' name='tbSelMonth' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'' class=small>");
for (i=0; i<12; i++)
	write("<option value='"+(i+1)+"'>"+gMonths[i]+"</option>");
write("</SELECT>");
write("&nbsp;<input type='button' name='PrevMonth' value='>' style='height:20;width:20;FONT:bold;font-size:12px' onclick='fNextMonth()'>");
write("</td>");
write("</TR><TR>");
write("<td align='center' style='font-size:12px;'>");
write("<DIV style='background-color:#98A4CC' style='font-size:12px;'><table width='100%' border='0' cellpadding='0' cellspacing='1' >");
fDrawCal(giYear, giMonth, 20, '12');
write("</table></DIV>");
write("</td>");
write("</TR><TR><TD align='center' style='font-size:12px;'>");
write("<TABLE width='100%'><TR><TD align='center'>");
write("<B style='cursor:hand;font-size:12px' onclick='fSetDate(0,0,0)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>清空</B>");
write("</td><td algin='center'>");
write("<B style='cursor:hand;font-size:12px' onclick='fSetDate(giYear,giMonth,giDay)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>今天: "+giYear+"-"+giMonth+"-"+giDay+"</B>");
write("</td><td algin='center'>");
write("<B style='cursor:hand;font-size:12px' onclick='HiddenDiv()' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>关闭</B>");
write("</td></tr></table>");
write("</TD></TR>");
write("</TABLE></Div>");
}
