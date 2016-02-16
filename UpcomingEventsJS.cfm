<cfscript>
writeOutput('<!DOCTYPE html><html><body>');
</cfscript>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<link type="text/css" href="stylesheets/jquery.icalendar.css" rel="stylesheet"> 
<script type="text/javascript" src="javascripts/jquery.icalendar.js"></script>

<script type="text/javascript">
//$('#parseButton').click(function() { 
//    var ical = $.icalendar.parse($('#parseInput').val()); 
//    $('#parseOutput').val($.toJSON(ical, true)); 
//});


	//var parsedICAL = ($.toJSON(ical, true);
	//$("#parseItHere").val($.toJSON(ical, true));	  #calendarData.Filecontent#
	//var icalJSON = $('parseItHere').val($.toJSON(ical, true));
	//document.getElementById("demo").innerHTML = icalJSON;


		//var icalJSON = $.toJSON(ical);  // convert to JSON
		//$(".inner").append(icalJSON);
		//$.get( url, [data], [callback], text )


</script>

<cfscript>

	calendarURL  = "https://calendar.google.com/calendar/ical/mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com/public/basic.ics";
	httpService = new http();  //create the service
	httpService.setMethod("get"); 
	httpService.setUrl("#calendarURL#"); 
	httpService.setTimeOut("15"); 
	httpService.setThrowonerror("yes"); 

	calendarData = httpService.send().getPrefix(); // get the calendar data
	
	writeDump(var=calendarData,expand='false');

	//calendarURL  = "https://calendar.google.com/calendar/ical/mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com/public/basic.ics";

	//var myCal = $.icalendar.parse(icalData.Filecontent); // parse to js object	

	//if ( console && console.log ) {
    //		console.log( "Sample of data:", icalData.slice( 0, 100 ) );




writeOutput('
	<script type="text/javascript">
		

			var myCal = $.icalendar.parse($("#calendarData.fileContent#");


	<\/script>
');
		
		//console.log(ical);

		//calendarURL  = "https://calendar.google.com/calendar/ical/mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com/public/basic.ics";

		//$.get(calendarURL, data, function(data){
 		//	 window.alert("Data: " + data);
 		//	 console.log(data);
		//});


	



    //writeDump(var=ical,expand=false);
 	//writeDump(#icalJSON#);
 	writeOutput("</body></html>");

</cfscript>
