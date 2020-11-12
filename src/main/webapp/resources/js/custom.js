/**
 * @author PhungDinhHuy
 *
 */

//==============================     LOGIN     ========================================
// Block special character
function blockSpecialChacter(e) {
	var chr = e.keyCode;

	if (chr >= 32 && chr <= 45 || chr == 47 || chr >= 58 && chr < 64
			|| chr >= 91 && chr <= 96 || chr >= 123 && chr <= 127) {
		return false;
	}

	return true;

}

// cancel button login
function cancelForm() {
	var arr = document.getElementsByClassName('cancelForm');
	for (var i = 0; i < arr.length; i++) {
		arr[i].value = '';
	}

}

// cancel button register
function cancelFormRegister() {
	var arr = document.getElementsByClassName('cancelFormRe');
	for (var i = 0; i < arr.length; i++) {
		arr[i].value = '';
	}
}

// disable copy/and pass
var arr = document.getElementsByClassName('disableCopyPaste');

for (var i = 0; i < arr.length; i++) {
	arr[i].oncopy = function() {
		return false;
	};

	arr[i].onpaste = function() {
		return false;
	};
}

// show message error
function displayError(e) {
	var chr = e.keyCode;

	if (chr <= 48 && chr >= 57 || chr <= 65 && chr >= 90 || chr <= 97
			&& chr >= 122) {
		return true;

	}
}

// check checkbox change value
function changeValue(){
	var checkbox=document.getElementById("rb-checkbox");
	
	if(checkbox.checked){
		checkbox.value="1";
	
	}else{
		checkbox.value="2";
	}
	
	//sendStateCheckbox(checkbox.value);
}

//function sendStateCheckbox(checkboxstate){
//	
//    var xhr= new XMLHttpRequest();
//    var url='sendStateCheckbox';
//    //var output=document.getElementById('checkbox-msg');
//                 
//    xhr.onreadystatechange = function(){
//        
//        if (xhr.readyState == 4 && xhr.status == 200){
//           // output.innerHTML = xhr.responseText;
//        }
//    };
//     
//    xhr.open('POST', url);  
//    xhr.send(checkboxstate);  
//       
//}

// default checkbox when load page Ref
//window.onload = function() {
//	let value_checkbox=document.getElementById("rb-checkbox").value;
//	if(value_checkbox=='1'){
//		document.getElementById("rb-checkbox").checked = true;
//	}else{
//		document.getElementById("rb-checkbox").checked = false;
//	}
//
//	if(value_checkbox=='1'){
//		document.getElementById("rb-checkbox").click();
//		document.getElementById("rb-checkbox").click();
//	}else{
//		document.getElementById("rb-checkbox").click();
//		document.getElementById("rb-checkbox").click();
//	}

	
//}


// Ajax check username and email exist
// khi click chuột ra khỏi ô thì gửi request lên server (gửi email) => server sẽ
// xử lý (kiểm tra xem email có tồn tại trong database hay không) rồi gửi trả lại
// và dc hiển thị bằng Javascript DOM lên 1 đối tượng html
function checkEmailExisted(email){    
	 			
                var xhr= new XMLHttpRequest(); // Dùng cho IE7+, Firefox,
												// Chrome, Opera, Safari
                var url='email-existed';
                var output=document.getElementById('error-email');       
                             
                // Khởi tạo một hàm gửi ajax
                xhr.onreadystatechange = function(){
                    // Nếu đối tượng XML HTTP trả về với hai thông số bên dưới
					// thì mọi chuyện coi như thành công
                    if (xhr.readyState == 4 && xhr.status == 200){
                        // Sau khi thành công tiến hành thay đổi nội dung của
						// thẻ div, nội dung ở đây chính là
                        output.innerHTML = xhr.responseText;         
                    }
                };
           
                xhr.open('POST', url);
              
                // Cuối cùng là Gửi ajax, sau khi gọi hàm send thì function vừa
				// tạo ở trên (onreadystatechange) sẽ được chạy
                xhr.send(email);              
               
 }

function checkUserExisted(username){
		
    var xhr= new XMLHttpRequest();
    var url='username-existed';
    var output=document.getElementById('error-uname');
                 
    xhr.onreadystatechange = function(){
        
        if (xhr.readyState == 4 && xhr.status == 200){
            output.innerHTML = xhr.responseText;
        }
    };
     
    xhr.open('POST', url);  
    xhr.send(username);  
       
}


// Disable button register
//var content_error_email=document.getElementById('error-email').textContent;
//var content_error_uname=document.getElementById('error-uname').textContent;
//var re_submit=document.getElementById('re_submit');
//
//if( content_error_uname=="" || content_error_email==""){
//	re_submit.disabled =false;
//}else{
//	re_submit.disabled =true;
//}
/*----------------------Nam-------------------*/
var btns = document.getElementsByClassName("item");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  });
}

function view(divId){
    subDiv = document.getElementById(divId);
    if(subDiv.style.display == 'block'){
        subDiv.style.display = 'none';
    }else{
        subDiv.style.display = 'block';
    }
    divs = document.querySelectorAll('.sub-menu');
    for (var i = 0; i < divs.length; ++i) {
        if(divs[i].id != divId){
            divs[i].style.display = 'none';
        }   
    }
 }

 function info(show){
    show_info = document.getElementById(show);
    if(show_info.style.display == 'block'){
        show_info.style.display = 'none';
    }else{
        show_info.style.display = 'block';
    }
 }
function mouseleave(show)
{
    show_info = document.getElementById(show);
    show_info.style.display = 'none';
}
 function edit_show() {
            document.getElementById('edit').style.display = "block";
        }
  function edit_hide() {
            document.getElementById('edit').style.display = "none";
  }
 function add_show() {
            document.getElementById('add').style.display = "block";
        }
  function add_hide() {
            document.getElementById('add').style.display = "none";
  }
 function form_view() {
            document.getElementById('form_view').style.display = "block";
        }
function form_hide() {
            document.getElementById('form_view').style.display = "none";
  }
function submit_show() {
            document.getElementById('confirmCourse').style.display = "block";
        }
function submit_hide() {
            document.getElementById('confirmCourse').style.display = "none";	
         
  }
 function ConfirmDelete()
    {
      var x = confirm("Are you sure you want to delete?");
      if (x)
        return true;
      else
        return false;
    }

/*----------------------//Nam-------------------*/









