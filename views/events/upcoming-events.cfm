<cfscript>
  //  11-2016 - Rewritten for Google API 
  //writeDump('#application#');

  datesToShow = 6; // number of dates to display 
  
</cfscript>

<cfscript>

  writeOutput("<div id='wrapper'></div>");

  writeOutput("<script type='text/javascript'>
	var now = new Date();
	var formattedToday = dateFormat(now,'mmddyy');

	var tempDte = new Date();
	var tomorrow = new Date(tempDte.setDate(tempDte.getDate() + 1));//add a day
	var formattedTomorrow = dateFormat(tomorrow,'mmddyy');

	//alert(formattedTomorrow); 
	

	function initMain() {
	        
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
					dteWrapperHTML = '<div style=\'color:red;\' id=\'error\' class=\'panel radius\'>** Lodge Calendar Error [AUTH] **</div>';
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
		  'timeMin': (new Date()).toISOString(),
		  'showDeleted': false,
		  'singleEvents': true,
		  'maxResults': #datesToShow#,
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
						dteWrapperHTML = '<div style=\'color:red;\' id=\'error\' class=\'panel radius\'>** Lodge Calendar Error - No Events Found **</div>';
						jQuery('##wrapper').append(dteWrapperHTML); // append the panel
					}
				} // end NO CALENDAR ERROR

				else {  // CALENDAR ERROR
					calendarErrorMsg = '** Lodge Calendar Error [' + resp.code + ']-' + resp.message + ' **';
					dteWrapperHTML = '<div style=\'color:red;\'id=\'error\' class=\'panel radius\'>' + calendarErrorMsg + '</div>';
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
			dteWrapperHTML = '<div id=' + dataWrapperID + ' class=\'panel radius\'></div>';
			jQuery('##wrapper').append(dteWrapperHTML); // append the panel

			dteInfoHTML = '<h6 align=center id=' + dteInfoID + '></h6>';
			jQuery('##' + dataWrapperID).append(dteInfoHTML);  // Append the h6

			todayHTML ='';
			tommorowHTML = '';

			displayEventDate = dateFormat(eventItem.start.dateTime, 'dddd, mmmm dS');

			formattedEventDate = dateFormat(eventItem.start.dateTime,'mmddyy');

			if (formattedToday == formattedEventDate) {
				todayHTML = '<STRONG><FONT COLOR=RED> &nbsp;TODAY&nbsp;</FONT></STRONG><br>';
			}
			if (formattedTomorrow == formattedEventDate) {
				tommorowHTML = '<STRONG><FONT COLOR=RED> &nbsp;TOMORROW&nbsp;</FONT></STRONG><br>';
			}

			dateHTML = todayHTML + tommorowHTML + '<STRONG><FONT COLOR=##F5F6CE>' + displayEventDate + '</FONT></STRONG>';
			jQuery('##' + dteInfoID).append(dateHTML);  // Append the DATE

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

writeOutput("<script type='text/javascript' src='https://apis.google.com/js/client.js?onload=initMain'>// This must stay here</script>");

writeOutput("
<div class='panel radius hide-for-small'>
<h6 class='subheader'>
	<a href='http://www.google.com/calendar/embed?src=#application.calendarId#'  target='_blank'>VIEW the complete Lodge Calendar powered by <img align='absmiddle' src='images/google.gif' alt='google image'></a>
</h6>
</div>
	");



</cfscript>