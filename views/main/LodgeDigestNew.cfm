
<cfquery DATASOURCE="lodge_members" name="getBirthdays">
	SELECT 
		Date() as current_date,
		DateDiff('yyyy', mdate, Now()) AS NumYears ,
	    DateDiff('yyyy', DateAdd('yyyy',  adjyear,  mdate), Now()) AS AdjustedYears,
		lastName, 
		firstName, 
		midname, 
		mst,
		email, 
		mdate, 
		stats, 
		ypm, 
		pmlodge, 
		glnum
	FROM memdat
	WHERE  glnum NOT IN (SELECT glnum FROM  omit)
	AND stats = 'good'
	AND MONTH(mdate) = #DateFormat('#Now()#','mm')#
	ORDER BY mdate asc, lastName asc, firstName asc

</cfquery>


<cfscript>
  //  11-2016 - Rewritten for Google API 
  //writeDump('#application#');

savecontent variable="lodgeDigest" { 

	 writeOutput("

	<p><em>Do not reply to this message</em></p><br>

	<table align='center' width='100%'>

	<tr id='wrapper'>
		<td colspan='2'>
			<fieldset STYLE='padding: 5px;'>
				<legend ALIGN='center' STYLE='font-variant:small-caps;font-size:115%'>Philo Lodge NO. 243 F&AM<br> Event Digest for Week of #DateFormat(Now(),  'mmmm dd yyyy' )# </legend>
			</fieldset>
		</td>
	</tr>

	");

  writeOutput("<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>");
  writeOutput("<script type='text/javascript' src='https://code.jquery.com/ui/1.11.4/jquery-ui.js'></script>");
  writeOutput("<script type='text/javascript'>
	
	var formattedToday = jQuery.datepicker.formatDate('mmddyy', new Date());

	var tomorrow = new Date();
	var formattedTomorrow = jQuery.datepicker.formatDate('mmddyy', new Date(tomorrow.setDate(tomorrow.getDate() + 1)));
	//alert(formattedTomorrow); 

	function init() {
	        
	        var config = {
	          'client_id': '#application.googleClientID#',
	          'scope': 'https://www.googleapis.com/auth/calendar.readonly',  //.readonly
	          'immediate': 'true' 
	        }
	     
          	gapi.auth.authorize(config, function(authResult) {
          		//console.log(authResult);

          		if(typeof authResult.error === 'undefined'){  // no error during authorization
          			//alert('auth ok');
          			gapi.client.load('calendar', 'v3').then(listUpcomingEvents); // load calendar obj then list events
          		}
          		else { // AUTH error 
          			alert(authResult.error);
					dteWrapperHTML = '<tr><td colspan=2 style=\'color:red;\' id=\'error\'>** Lodge Calendar Error [AUTH] **</td></tr>';
					jQuery('##wrapper').append(dteWrapperHTML); // append the panel
          		};
          	});
   };  // end init
	</script>
");
writeOutput("<script type='text/javascript'>
	function listUpcomingEvents() {

		// build the request parameters

		var request = gapi.client.calendar.events.list({
		  'calendarId': '#application.calendarId#', 
		  //'calendarId': 'badCalendarfnko@group.calendar.google.com',
		  'timeMin': (new Date()).toISOString(),
		  'showDeleted': false,
		  'singleEvents': true,
		  'maxResults': 10,
		  'orderBy': 'startTime'
		});

			request.execute(function(resp) { //get the events

			//console.log(resp);

				if(typeof resp.error === 'undefined'){  // NO ERROR

					events = resp.items; 

					if (events.length > 0) {
						for (i = 0; i < events.length; i++) {
							
							eventItem = events[i];
		          			//console.log(eventItem);
		          			//console.log(events[i].summary);

		          			outputEvent(eventItem,i);  // output the Event

		          		}//end for loop
					} //end events.length

					else {  //NO EVENTS IN CALENDAR
						dteWrapperHTML = '<tr><td colspan=2 style=\'color:red;\' id=\'error\'>** Lodge Calendar Error - No Events Found **</td></tr>';
						jQuery('##wrapper').append(dteWrapperHTML); // append the panel
					}
				} // end NO CALENDAR ERROR

				else {  // CALENDAR ERROR
					calendarErrorMsg = '** Lodge Calendar Error [' + resp.code + ']-' + resp.message + ' **';
					dteWrapperHTML = '<tr><td colspan=2 style=\'color:red;\'id=\'error\'>' + calendarErrorMsg + '</td></tr>';
					jQuery('##wrapper').append(dteWrapperHTML); // append the panel
				}

			} ); // end get the events

	}; //end listUpcomingEvents
	</script>
");

writeOutput("
	<script type='text/javascript'>

		function formatTimeHHMMA(d) {  // convert the date formatting
		  function z(n){return (n<10?'0':'')+n}
		  var h = d.getHours();
		  return (h%12 || 12) + ':' + z(d.getMinutes()) + ' ' + (h<12? 'AM' :'PM');
		}

		function outputEvent(eventItem,cntr) {  // put out the events html
			//alert(cntr);
			//Build the VARIABLE names

			dataWrapperID = 'dataWrapper_' + cntr;
			dteInfoID = 'dateInfo_' + cntr;
			dteDetailID = 'dateDetail_' + cntr;

			// Build the HTML

			dteWrapperHTML = '<tr valign=\'top'\ +  id=' + dataWrapperID + '></tr>';
			jQuery('##wrapper').append(dteWrapperHTML); // append the row

			todayHTML ='';
			tommorowHTML = '';

			<fieldset STYLE=\'padding: 5px;\'><legend ALIGN=\'center\' STYLE=\'font-variant:small-caps\'>

			</fieldset>

			displayEventDate = jQuery.datepicker.formatDate('DD MM dd', new Date(eventItem.start.dateTime));
			formattedEventDate = jQuery.datepicker.formatDate('mmddyy', new Date(eventItem.start.dateTime));

			if (formattedToday == formattedEventDate) {
				todayHTML = '<STRONG><FONT COLOR=RED> &nbsp;TODAY&nbsp;</FONT></STRONG><br>';
			}
			if (formattedTomorrow == formattedEventDate) {
				tommorowHTML = '<STRONG><FONT COLOR=RED> &nbsp;TOMORROW&nbsp;</FONT></STRONG><br>';
			}

			dateHTML = todayHTML + tommorowHTML + '<STRONG><FONT COLOR=##F5F6CE>' + displayEventDate + '</FONT></STRONG>';
			jQuery('##' + dteInfoID).append(dateHTML);  // Append the DATE

			dteInfoHTML = '<tr align=center><td id=' + dteInfoID + ' width=\'50%\'>
			

			</td>
			</tr>';


			jQuery('##' + dataWrapperID).append(dteInfoHTML);  // Append the fieldset





			dteSubheaderHTML = '<h6 class=subheader align=center id=' + dteDetailID + '></div>';
			jQuery('##' + dteInfoID).append(dteSubheaderHTML); // Append the subheader h6


			dteTitleHTML = '<strong><a target=\'_blank\' href=\'' +  eventItem.htmlLink + '\'>' + eventItem.summary + '</a></strong><br>';
			jQuery('##' + dteDetailID).append(dteTitleHTML);  // Append the Summary

			if (eventItem.description) {
				dteDescriptionHTML = eventItem.description + '<br>';
				jQuery('##' + dteDetailID).append(dteDescriptionHTML);  // Append the details
			}

			if (eventItem.location) {
				dteLocationHTML = eventItem.location + '<br>';
				jQuery('##' + dteDetailID).append(dteLocationHTML);  // Append the Location
				directionsHTML = '[ <a href=\'http://maps.google.com/maps?q=' + eventItem.location + '&hl=en\' alt=\'get directions\' target=\'_blank\'>Get Directions</a> ]<br>';
				jQuery('##' + dteDetailID).append(directionsHTML);  // Append the Location
			};


			eventTime = new Date(eventItem.start.dateTime);
			displayEventTime = formatTimeHHMMA(eventTime);
			
			timeHTML = '<FONT COLOR=##F5F6CE>' + displayEventTime + '</FONT><br>';
			jQuery('##' + dteDetailID).append(timeHTML);  // Append the event time
			


			
		}
    </script>
");
writeOutput("<script type='text/javascript' src='https://apis.google.com/js/client.js?onload=init'>// This must stay here</script>");

writeOutput("
<div class='panel radius hide-for-small'>
<h6 class='subheader'>
	<a href='http://www.google.com/calendar/embed?src=mghbbc31rk9taddtvgtk37fnko%40group.calendar.google.com'  target='_blank'>VIEW the complete Lodge Calendar powered by <img align='absmiddle' src='images/google.gif' alt='google image'></a>
</h6>
</div>
	");

} ;

</cfscript>