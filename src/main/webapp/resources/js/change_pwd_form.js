
/**
 * @author PhungDinhHuy
 *
 */

// validate register form
var change_pwd_form=document.getElementById('change-pwd-form');
var new_psw=document.getElementById('new-psw');
var changepwd_err_msg=document.getElementById('changepwd-err-msg');



change_pwd_form.addEventListener('submit',(e) => {
// if(re_email.validity.typeMismatch){
// //re_email.setCustomValidity('Please enter correct email')
// }else{
// //re_email.setCustomValidity('');
// }	
	var messages= [];
	var valuePassword=new_psw.value;
	
	if(valuePassword.length < 6){
		messages.push("* Password must be more than 6");	
	}
	
	if( valuePassword.length >320){
		messages.push("* Username must be less than 320 characters");	
	}
	
	
	// phải có ít nhất 1 kí tự đặc biệt + 1 kí tự thường + 1 kí tự hoa + 1 số => mới đăng kí thành công
	var countSpecialChar=0;
	var countLowercaseChar=0;
	var countUppercaseChar=0;
	var countNumber=0;
	
	for(var i=0;i<valuePassword.length;i++){
		
		if(32<= valuePassword.charCodeAt(i) && valuePassword.charCodeAt(i)<=47 
				||58<= valuePassword.charCodeAt(i) && valuePassword.charCodeAt(i)<=64 ||
				91<= valuePassword.charCodeAt(i) && valuePassword.charCodeAt(i)<=96||
				123<= valuePassword.charCodeAt(i) && valuePassword.charCodeAt(i)<=127){
			
			countSpecialChar++;			
		}
		
		if(65<= valuePassword.charCodeAt(i) && valuePassword.charCodeAt(i)<=90 ){
			countUppercaseChar++;
		}
		
		if(97<= valuePassword.charCodeAt(i) && valuePassword.charCodeAt(i)<=122 ){
			countLowercaseChar++;
		}
		
		if(48<= valuePassword.charCodeAt(i) && valuePassword.charCodeAt(i)<=57 ){
			countNumber++;
		}	
	}
	
	if(countLowercaseChar<1 || countUppercaseChar<1 || countSpecialChar<1 || countNumber<1){
		messages.push("* Password must be have at least 1 lowercase character, 1 uppercase character," +
				" 1 special character and 1 number");
	}
	
	if(messages.length > 0){
		// stop submit do default action of form
		e.preventDefault();
		changepwd_err_msg.innerText=messages.join('\n');	
	}
	
})