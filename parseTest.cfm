<cfscript>

// Get yesterday's date
function Yesterday() {	return DateAdd("d", -1, Now()); }
// Get tomorrow's date
function Tomorrow() {	return DateAdd("d", 1, Now()); }

try {

	//URLToPull  = "https://calendar.google.com/calendar/ical/mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com/public/basic.ics"; // lodge calendar
	cfhttp(method="GET", charset="utf-8", url="https://calendar.google.com/calendar/ical/0kksn4lm4bequfsmbtsjmu689c%40group.calendar.google.com/public/basic.ics", result="calendarData") {}
	//cfhttp(method="GET", charset="utf-8", url="basic.ics", result="calendarData") {
//}
	//writeDump(var =calendarData.filecontent,expand=false,label='raw');

	if (calendarData.statusCode EQ '200 OK') {
		FileWrite('D:\home\philolodge.net\wwwroot\lodgeCalendar.ics', '#calendarData.filecontent#');
	}
	writeOutput('<div id="notsortedDates" style="padding:10px; border:1px solid ##ff0000;">not sorted<hr /></div>');
	writeOutput('<div id="sortedDates" style="padding:10px; border:1px solid ##ff0000;">sorted<hr /></div>');
	writeOutput('
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="javascripts/jquery.ics-0.3.min.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function(){
				try {
					var cal = $.parseIcs("http://www.philolodge.net/lodgeCalendar.ics");

						for(i = 0; i < cal.event.length; i++){

							var dtstart = cal.event[i].dtstart[0].value;
							// get the date
							var year = dtstart.substring(0,4);
							var month = dtstart.substring(4,6);
							var day = dtstart.substring(6,8);
							var hour = dtstart.substring(9,11);
							var minute = dtstart.substring(11,13);
							var second = dtstart.substring(13,15);
							var datetime = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;

							var icalDate = new Date(Date.parse(datetime));

							var today = new Date();
							var dateLimit = new Date(); // thirty days in the future
							dateLimit.setDate(today.getDate() + 30);
							//alert(dateLimit);
							if(today.getTime() <= icalDate.getTime() && icalDate.getTime() <= dateLimit.getTime()){
								//console.log(icalDate);
								alert(icalDate)
							}
						} //end for
				} //end try
				catch (err) {
					alert(err);
				}
				console.log(cal);
			});
		</script>
'); // end writeOutput
} // end try
catch (any errors) {
	writeOutput(errors);
}

</cfscript>
