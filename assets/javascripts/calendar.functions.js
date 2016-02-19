


function initMain() {
    
    var config = {
      'client_id': '991711430336-9jeg4n3a2uklrj2664unn0amisdckakj.apps.googleusercontent.com',
      //'client_id': '#application.googleClientID#',
      'scope': 'https://www.googleapis.com/auth/calendar.readonly',  //.readonly
      'immediate': 'true' 
    }
 
  	gapi.auth.authorize(config, function(authResult) {
  		console.log(authResult);

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
};  // end initMain

function listUpcomingEvents() {

	// build the request parameters
	//alert('in listUpcomingEvents');
	var request = gapi.client.calendar.events.list({
	  //'calendarId': '#application.calendarId#', 
	  'calendarId': 'mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com', 
	  'timeMin': (new Date()).toISOString(),
	  'showDeleted': false,
	  'singleEvents': true,
	  'maxResults': 6,
	  //'maxResults': #datesToShow#,
	  'orderBy': 'startTime'
	});

		request.execute(function(resp) { //get the events

		console.log(resp);

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

