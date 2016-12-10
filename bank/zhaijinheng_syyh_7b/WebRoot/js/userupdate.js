function checkdata(){
	var loginPassword = document.all('users.loginPassword');
	var checkpwd = document.all("checkpwd");//得到确认密码
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
}
