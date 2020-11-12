/**
 * @author PhungDinhHuy
 * 
 */

window.onload = function() {
	startTime();
};

function startTime() {
	var showTimer = document.getElementById("timer");

	// get time value from url
	var href_str = window.location.href;
	var arr = href_str.split("/");

	var timer = arr[arr.length - 2];
/*
	var hours = Math.round(timer / 3600);
	var remainder=Math.round(timer - hours*3600);
	var minutes = Math.round(remainder / 60) ;
	remainder=Math.round(remainder - minutes*60);
	var seconds = remainder;
*/
	var hours = Math.round(timer / 3600);
	var minutes = Math.round((timer % 3600) / 60);
	var seconds = Math.round(timer % 60);

	function timerCountdown() {
		if (hours == 0 && minutes == 0 && seconds == 0) {
			hours = 0;
			minutes = 0;
			seconds = 0;
		} else if (seconds != 0) {
			seconds--;
		} else if (minutes != 0 && seconds == 0) {
			seconds = 59;
			minutes--;
		} else if (hours != 0 && minutes == 0) {
			minutes = 60;
			hours--;
		}
		return;
	}

	var submit_btn = document.getElementById("submit-btn");
	/*
	 * // Count down by second var time_coundown = setInterval(function() {
	 * showTimer.innerHTML = timer; timer--
	 * 
	 * if (timer === 0) { alert("Time out!!"); // click submit
	 * submit_btn.click(); clearInterval(time_coundown); } }, 1000);
	 */

	// Count down by hours minutes second
	var time_coundown = setInterval(function() {
		showTimer.innerHTML = hours + "h " + minutes + "m " + seconds + "s ";

		timerCountdown();

		if (hours == 0 && minutes == 0 && seconds == 0) {
			alert("Time out!!");
			// click submit
			submit_btn.click();
			clearInterval(time_coundown);
		}
	}, 1000);
}
