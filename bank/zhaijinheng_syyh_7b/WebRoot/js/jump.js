//跳转页面
function goto(u) {
	var url = u;
	var v = document.getElementById("pagebox").value;
	var v1 = document.getElementById("totalpage").value;
	if (v != "" && v1 != "") {
		if (parseInt(v) <= parseInt(v1)) {
			location.href = url + "curpage=" + document.getElementById("pagebox").value;
		}
	}
}

function hiddenDiv(){
          var status = document.all('sbxj.status');
          var div = document.getElementById("sbwxMsg");
          if(status.value=="1"){
             div.style.display="block";
          }else{
             div.style.display="none"
          }

       }
//校验电话
function checkTel(){   
         var re=/^(((\()?\d{2,4}(\))?[-(\s)*]){0,2})?(\d{7,8})$/;
         var re1=/^\s*\w{11,12}\s*$/;   
         if(re.test(document.getElementById("tel").value)){   
           alert("电话号码格式正确"); 
           return true;  
         }else if(re1.test(document.getElementById("tel").value)){
           alert("电话号码格式正确");
           return true; 
         }
         else{   
          alert("错误的电话号码");
          return false;   
       }   
    }
       
       
  function checkTel(tid){   
  		var id= document.getElementById(tid);
         var re=/^(((\()?\d{2,4}(\))?[-(\s)*]){0,2})?(\d{7,8})$/;
         var re1=/^\s*\d{11}\s*$/;   
         if(re.test(id.value)){   
           return true;  
         }else if(re1.test(id.value)){
           return true; 
         }
         else{  
         id.value="";
//         id.focus();
          alert("错误的电话号码");
          return false;   
       }   
    }       

      function  check() {
      	var sbzlId = document.all('sbxj.equipmenttype.equipmentId');
      	var sblsId = document.all('sbxj.bankEquipment.equipmenteachId');
      	var sbwtId = document.all('sbxj.faultRepairType.pitypeId');
      	var wxqk = document.all('sbxj.piEvaluation'); 
      	var sbzt = document.all('sbxj.status');
      	if(sbzt.value == "1"){
	      	if (sbzlId.value == "") {
	      		alert('请选择设备种类！');
	      		return false;
	      	}
	        if(sblsId.value == ""){
	      	   alert('请选择设备流水号！');
	      	   return false;
	      	} 
	      	if(sbwtId.value == ""){
	      	   alert('请选择设备问题！');
	      	   return false;
	      	}
	      	if(wxqk.value == ""){
	      	   alert('维修情况描述不能为空！');
	      	   return false;
	      	}
	     }
      }