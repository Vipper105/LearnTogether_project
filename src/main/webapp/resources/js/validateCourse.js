/**
 * @author Diep Nguyen
 */

function validate(coursePrice, courseDescription, numOfLesson, categoryID, courseLevelID, courseImage, isLessonNoVideo, totalVideoDuration, uHeadline, uBiography, uImg){
		var popup = document.getElementById("popup");
		//var pricing = document.getElementById("pricing").value;
		
		if(courseDescription.length < 50){
			popup.style.display = "block";
			return false;
		}else if(categoryID.length == 0 || courseLevelID.length == 0){
			popup.style.display = "block";
			return false;
		}else if(courseImage == 'course-placeholder.png'){
			popup.style.display = "block";
			return false;
		}else if(coursePrice == "0.0"){
			popup.style.display = "block";
			return false;
		}else if(numOfLesson < 5){
			popup.style.display = "block";
			return false;
		}else if(isLessonNoVideo == "true"){
			popup.style.display = "block";
			return false;
		}else if(totalVideoDuration = '' || totalVideoDuration < 30){
			popup.style.display = "block";
			return false;
		}else if(uHeadline.length == 0 || uBiography.legth == 0 || uImg.length == 0){
			popup.style.display = "block";
			return false;
		}
		return true;
	}