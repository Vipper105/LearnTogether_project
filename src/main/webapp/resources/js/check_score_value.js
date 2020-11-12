	/**
	 *  
	 * @author: PhungDinhHuy
	 * 
	 */

function checkScore(score,index,questionId){
		
    var xhr= new XMLHttpRequest();
    var url='validate-score-instructor-mark';
    var output=document.getElementsByClassName('error-mark-score');
    
    xhr.open('POST', url);
    
 // set `Content-Type` header
    xhr.setRequestHeader("Content-type", "application/json"); 
                 
    xhr.onreadystatechange = function(){       
        if (xhr.readyState == 4 && xhr.status == 200){
            output[index].innerHTML = xhr.responseText;
        }
    };
    
 // create a JSON object
    const json = {
    	    "score": score,
    	    "questionID": questionId,
    	    "index":index
    	    
    	};
     
    var data = JSON.stringify(json); 
    xhr.send(data);
       
}