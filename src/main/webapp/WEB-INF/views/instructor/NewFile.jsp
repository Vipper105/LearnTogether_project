<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<input id="fileUp" type="file" value="Upload" onchange="abc()">
	<label id="infos"></label>
</body>

<script type="text/javascript">
var myVideos = [];
document.getElementById('fileUp').onchange = setFileInfo;

function setFileInfo() {
  var files = this.files;
  myVideos.push(files[0]);
  var video = document.createElement('video');
  video.preload = 'metadata';

  video.onloadedmetadata = function() {
    window.URL.revokeObjectURL(video.src);
    var duration = video.duration;
    myVideos[myVideos.length - 1].duration = duration;
    updateInfos();
  }

  video.src = URL.createObjectURL(files[0]);;
}


function updateInfos() {
  var infos = document.getElementById('infos');
  infos.textContent = "";
  for (var i = 0; i < myVideos.length; i++) {
    infos.textContent = myVideos[i].name + " duration: " + myVideos[i].duration + '\n';
  }
}
</script>
</html>
