<!--- LAST UPDATE 11/2015 - K.WHARY - Google calendar XML feed no longer supported. Switching to ICAL (ics) format --->

<script type="text/javascript">
function DisplayFormValues()
{
var str = '';
var elem = document.getElementById('frmMain').elements;
for(var i = 0; i < elem.length; i++)
{
str += "<b>Type:</b>" + elem[i].type + "&nbsp&nbsp";
str += "<b>Name:</b>" + elem[i].name + "&nbsp;&nbsp;";
str += "<b>Value:</b><i>" + elem[i].value + "</i>&nbsp;&nbsp;";
str += "<BR>";
}
document.getElementById('lblValues').innerHTML = str;
}
</script>




<cfscript>

CurrentDate = DateFormat(#now()#,  "yyyy-mm-dd" ) & "T00:57:00"; // 2007-05-01T00:57:00 &start-max=2007-05-31T23:57:00

// Get yesterday's date
function Yesterday()
{
	return DateAdd("d", -1, Now());
}

// Get tomorrow's date
function Tomorrow()
{
	return DateAdd("d", 1, Now());  
 }

try {

	calendarURL  = "https://calendar.google.com/calendar/ical/mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com/public/basic.ics";
	httpService = new http();  //create the service
	httpService.setMethod("get"); 
	httpService.setUrl("#calendarURL#"); 
	httpService.setTimeOut("15"); 
	httpService.setThrowonerror("yes"); 

	calendarData = httpService.send().getPrefix(); // get the calendar data
	writeDump(var =calendarData.filecontent,expand=false,label='raw');

	// CREATE OBJECT 
	icalCFC = createObject("component", "private/iCal").init(calendarData.filecontent);  // instantiate the function to convert ics data
	    
	// CALL THE FUNCTION with our ics file content
	//calObj = icalObject.init(calendarData.filecontent);

	writeDump(var=icalCFC.getEvents(),expand=false);

	lodgeDatesArray = icalCFC.getEvents(); // get the event data

	//sortedDatesArray= icalCFC.arrayOfStructsSort(lodgeDatesArray,DTSTART.DATA);
	//writeDump(var=sortedDatesArray,label='sorted',expand=false);

	writeDump(var=request,expand=false,label='request');

	QryLodgeDates = queryNew("EventTitle,startTime,endTime,DESCRIPTION,LOCATION"); // Build a new query we can sort
	queryAddRow(QryLodgeDates, arrayLen(lodgeDatesArray));  // make it the same size

	for (d = 1; d LTE arrayLen(lodgeDatesArray); d = d + 1) {
		// 20151212T230000Z  DESCRIPTION LOCATION DTSTART DTEND SUMMARY

		querySetCell(QryLodgeDates, "eventTitle", lodgeDatesArray[d].SUMMARY.Data, d);
		querySetCell(QryLodgeDates, "startTime",  icalCFC.iCalParseDateTime(lodgeDatesArray[d].DTSTART.Data,request.fromOffsetValue), d); 
		querySetCell(QryLodgeDates, "endTime", icalCFC.iCalParseDateTime(lodgeDatesArray[d].DTEND.Data,request.fromOffsetValue), d);
		querySetCell(QryLodgeDates, "description", lodgeDatesArray[d].DESCRIPTION.Data, d);
		querySetCell(QryLodgeDates, "location", lodgeDatesArray[d].LOCATION.Data, d);

		//adjustedStartDate = icalCFC.iCalParseDateTime(lodgeDatesArray[d].DTSTART.Data,request.fromOffsetValue);
		//adjustedEndDate = icalCFC.iCalParseDateTime(lodgeDatesArray[d].DTEND.Data,request.fromOffsetValue);

		//writeOutput('start=' & adjustedStartDate & '<br>');
		//writeOutput('end=' & adjustedEndDate & '<br>');
		//writeOutput('EVENT=' & lodgeDatesArray[d].SUMMARY.Data & '<br><hr>');
	}

	writeDump(var = QryLodgeDates, expand=false);
    
    // Query of Queries
    getByDate = new Query();
    getByDate.setDBType('query');
    getByDate.setAttributes(resultSet = QryLodgeDates); // needed for QoQ
    //getByDate.addParam(name='state', value='CO', cfsqltype='cf_sql_varchar');
    getByDate.setSQL('SELECT * FROM resultSet ORDER BY startTime DESC');
    //getByDate.setMaxRows(2); // limit max rows, if desired
    getByDateSorted = getByDate.execute().getResult();
    writeDump(var=getByDateSorted,label='getByDateSorted');

	//writeDump(var='#lodgeCalendar#',label='calendarData',expand='false');
}  // end try
catch (any errors) {
	writeOutput(errors);
}  // end catch errors


</cfscript>


	
