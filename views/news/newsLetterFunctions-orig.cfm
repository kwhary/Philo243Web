
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

datesToShow = 7;
writeOutput("<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>");
writeOutput("<script type='text/javascript' src='https://code.jquery.com/ui/1.11.4/jquery-ui.js'></script>");
writeOutput('

	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html>
	<head>
	<!-- If you delete this meta tag, the ground will open and swallow you. -->
	<meta name="viewport" content="width=device-width" />

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Inside the Lodge</title>
		
	<link rel="stylesheet" type="text/css" href="http://www.philolodge.net/stylesheets/email.css" >

	</head>
	 
	<body bgcolor="##FFFFFF" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">

	<!-- HEADER -->
	<table class="head-wrap" bgcolor="##000000">
		<tr>
			<td></td>
			<td class="header container" align="">
				
				<!-- /content -->
				<div class="content">
					<table bgcolor="##00000" >
						<tr>
							<td><img src="http://www.philolodge.net/images/mailheader.png" /></td>
							<td align="right"><h6 align="center" class="collapse" style="color:##215B84">Events of the Lodge<br>for week of #DateFormat(Now(),  "mmmm dd yyyy" )#</h6></td>
						</tr>
					</table>
				</div><!-- /content -->
				
			</td>
			<td></td>
		</tr>
	</table><!-- /HEADER -->

	<!-- BODY -->
	<table class="body-wrap" bgcolor="">
		<tr>
			<td></td>
			<td class="container" align="" bgcolor="##FFFFFF">
				
				<!-- content -->
				<div class="content">
					<table bgcolor="" id="tblWrapper">


					<!--- Content loop gets built here --->			
					

					</table>
				
				</div><!-- /content -->

				<div class="content">
				<!-- BIRTHDAYS -->
				<table id="birthdays" class="social" bgcolor="" border=1>
					<tr>
						<td class="container">
							
								<!-- content -->
								<div class="content">
									<table border=0>
									<tr><th colspan=2 id="birthday_title">Masonic Birthdays for #DateFormat("#getBirthdays.current_date#","mmmm")#</th></tr>
');
										for (bd in getBirthdays) {
											writeOutput('
											<tr>
												<td align="right">#bd.mst# #bd.firstName# #bd.lastName# - </td>
												<td align="left"> <strong>#bd.AdjustedYears#</strong> years - Raised #DateFormat('#bd.mdate#','mm-dd-yyyy')#</td>
											</tr>
											');
										};	
										if (getBirthdays.recordCount) {
											writeOutput("
											<tr><td colspan=2 id='congrats' align='center'><br><strong>Congratulations Brethren !</strong></td></tr>
											");
										};
										
writeOutput('
									</table>
								</div><!-- /content -->
								
						</td>
					</tr>
				</table><!-- /BIRTHDAYS -->
				</div><!-- /content -->

				<!-- content -->
				<div class="content">
					<table bgcolor="">
						<tr>
							<td>
								
								<!-- social & contact -->
								<table bgcolor="" class="social" width="100%">
									<tr>
										<td>
											
											<!--- column 1 -->
											<div class="column">
												<table bgcolor="" cellpadding="" align="left">
											<tr>
												<td>				
													
													<h5 class="">Connect with Philo Lodge:</h5>
													<p class=""><a href="https://www.facebook.com/Philo-Lodge-No-243-FAM-104775649554798/" class="soc-btn fb">Facebook</a></p>
							
													
												</td>
											</tr>
										</table><!-- /column 1 -->
											</div>
											
											<!--- column 2 -->
											<div class="column">
												<table bgcolor="" cellpadding="" align="left">
											<tr>
												<td>				
																				
													<h5 class="">Contact Info:</h5>												
													<p>Phone: <strong>732.254.9867</strong><br/>
	                Email: <strong><a href="emailto:secretary@philolodge.net">secretary@philolodge.net</a></strong></p>
	                
												</td>
											</tr>
										</table><!-- /column 2 -->	
											</div>
											
											<div class="clear"></div>
		
										</td>
									</tr>
								</table><!-- /social & contact -->
								
							</td>
						</tr>
					</table>
				</div><!-- /content -->
				

			</td>
			<td></td>
		</tr>
	</table><!-- /BODY -->

	<!-- FOOTER -->
	<table class="footer-wrap">
		<tr>
			<td></td>
			<td class="container">
				
					<!-- content -->
					<div class="content">
						<table>
							<tr>
								<td align="center">
									<p>
										<a href="http://www.philolodge.net">Philo Lodge No. 243 Free & Accepted Masons | South River NJ </a>
									</p>
								</td>
							</tr>
						</table>
					</div><!-- /content -->
					
			</td>
			<td></td>
		</tr>
	</table><!-- /FOOTER -->

	</body>
	</html>

');
writeOutput("
	<script type='text/javascript'>

		function outputEvent(eventItem,cntr) {  // put out the events html
			//alert('in outputEvent');
			//Build the VARIABLE names

			trID = 'row_id_' + cntr;
			tdID = 'td_id_' + cntr;
			h4ID = 'h4_id_' + cntr;

			// Build the HTML
			trHTML = '<tr id=' + trID + '></tr>';
			jQuery('##tblWrapper').append(trHTML); // append the new row to the table

			var string = eventItem.summary;

			// set default image
			calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/sqncompass.png\' /></td>';

			imageSwitch: {  // switch the image based on the event title

				var matchVal = string.match(/Knight To Remember|Table Lodge/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/tablelodge.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Past Masters Night|PM Night/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/pmnight.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Master Mason Degree|MM Degree/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/mmdegree.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Fellowcraft Degree|FC Degree/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/fcdegree.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Entered Apprentice Degree|EA Degree/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/eadegree.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Installation|Elections/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/install.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Roll Call/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/rollcall.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Rib Fest|Rib Feast/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/ribfest.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Beefsteak|Beef Steak/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/beefsteak.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Santa/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/santa.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Easter Bunny/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/bunny.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/District Lodge of Instruction|DLI/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/dli.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Official Visit/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/ov.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Officer Rehearsal/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/or.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Masonic Funeral Service|Funeral Service/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/funeral.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Veterans Home/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/vets.png\' /></td>';
					break imageSwitch;
				};
				var matchVal = string.match(/Level Club/i);
				if (matchVal != null) {  //string found
					calImageHTML = '<td class=\'small\' width=\'20%\' style=\'vertical-align: top; padding-right:10px;\'><img src=\'http://www.philolodge.net/images/levelclub.png\' /></td>';
					break imageSwitch;
				};
			};// imageSwitch
			
			jQuery('##' + trID).append(calImageHTML); // append the image td in the row
			
			todayHTML ='';
			tommorowHTML = '';

			displayEventDate = dateFormat(eventItem.start.dateTime, 'dddd, mmmm dS');
			formattedEventDate = dateFormat(eventItem.start.dateTime,'mmddyy');

			eventTime = new Date(eventItem.start.dateTime);
			displayEventTime = formatTimeHHMMA(eventTime);

			if (formattedToday == formattedEventDate) {
				todayHTML = '<STRONG><FONT COLOR=RED>&nbsp;&nbsp;[&nbsp;Today&nbsp;]</FONT></STRONG><br><br>';
			}
			if (formattedTomorrow == formattedEventDate) {
				tommorowHTML = '<STRONG><FONT COLOR=RED>&nbsp;&nbsp;[&nbsp;Tomorrow&nbsp;]</FONT></STRONG><br><br>';
			}

			todayTomorrow = todayHTML + tommorowHTML;
			dateHTML = '<STRONG>' + displayEventDate + '</STRONG>';

			detailHTML = '<td id=' + tdID + '></td>';
			jQuery('##' + trID).append(detailHTML);  // Append td for the event details	

			dteTitleNDateHTML = '<h4 id=' + h4ID + '><a target=\'_blank\' href=\'' +  eventItem.htmlLink + '\'>' + eventItem.summary + '</a><br><br><small>' + dateHTML + ' @ ' + displayEventTime + todayTomorrow + '</small></h4>';
			jQuery('##' + tdID).append(dteTitleNDateHTML);  // Append the Title and date	

			if (typeof(eventItem.description) !=='undefined') {	
				dteDescriptionHTML = '<p class=\'\'>' +  eventItem.description + '</p>';
				jQuery('##' + tdID).append(dteDescriptionHTML);  // Append the Title and date
			}

			dteMoreHTML = '<p class=\'\'><a target=\'_blank\' href=\'' +  eventItem.htmlLink + '\'>' + '[ Read More ]</a>';
			jQuery('##' + tdID).append(dteMoreHTML);  // Append the Read More link
					
		}
    </script>

");

writeOutput("
	<script src='javascripts/date.format.js'></script>
	<script type='text/javascript'>

	function formatTimeHHMMA(d) {  // convert the date formatting
	  function z(n){return (n<10?'0':'')+n}
	  var h = d.getHours();
	  return (h%12 || 12) + ':' + z(d.getMinutes()) + ' ' + (h<12? 'AM' :'PM');
	}

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
		  'calendarId': '#application.calendarId#', 
		  'timeMin': (new Date()).toISOString(),
		  'showDeleted': false,
		  'singleEvents': true,
		  'maxResults': #datesToShow#,
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
	</script>
");

writeOutput("<script type='text/javascript'>alert(document.documentElement.innerHTML);</script>");

writeOutput("<script type='text/javascript' src='https://apis.google.com/js/client.js?onload=initMain'>// This must stay here</script>");

</cfscript>