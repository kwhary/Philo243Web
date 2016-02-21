<html>
    <head>     
        <title>jquery.ics</title>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="javascripts/jquery.ics.parser.js"></script>
<cfscript>

	calendarURL  = "https://calendar.google.com/calendar/ical/mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com/public/basic.ics";
	httpService = new http();  //create the service
	httpService.setMethod("get"); 
	httpService.setUrl("#calendarURL#"); 
	httpService.setTimeOut("15"); 
	httpService.setThrowonerror("yes"); 

	calendarData = httpService.send().getPrefix(); // get the calendar data
	
	writeDump(var=calendarData,expand='false');

	writeOutput('

		<script type="text/javascript">
			jQuery(document).ready(function(){
				try {
					var cal = $.parseIcs("#calendarData.fileContent#");
 
					// show the the description of the first event
					console.log(cal.event[0].description[0].value);
				} catch (err) {
					alert(err);
				};
				console.log(cal);
			});
		<\/script>
	');

</cfscript>

    </head>
    <body>
	</body>
</html>