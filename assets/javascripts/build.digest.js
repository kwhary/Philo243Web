// function to build the calendar digest

function outputEvent(eventItem,cntr) {  // put out the events html
	//alert('in outputEvent');
	//Build the VARIABLE names

	trID = 'row_id_' + cntr;
	tdID = 'td_id_' + cntr;
	h4ID = 'h4_id_' + cntr;

	// Build the HTML
	trHTML = '<tr id=' + trID + '></tr>';
	jQuery('#tblWrapper').append(trHTML); // append the new row to the table

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
	
	jQuery('#' + trID).append(calImageHTML); // append the image td in the row
	
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
	jQuery('#' + trID).append(detailHTML);  // Append td for the event details	

	dteTitleNDateHTML = '<h4 id=' + h4ID + '><a target=\'_blank\' href=\'' +  eventItem.htmlLink + '\'>' + eventItem.summary + '</a><br><br><small>' + dateHTML + ' @ ' + displayEventTime + todayTomorrow + '</small></h4>';
	jQuery('#' + tdID).append(dteTitleNDateHTML);  // Append the Title and date	

	if (typeof(eventItem.description) !=='undefined') {	
		dteDescriptionHTML = '<p class=\'\'>' +  eventItem.description + '</p>';
		jQuery('#' + tdID).append(dteDescriptionHTML);  // Append the Title and date
	}

	dteMoreHTML = '<p class=\'\'><a target=\'_blank\' href=\'' +  eventItem.htmlLink + '\'>' + '[ Read More ]</a><br><hr>';
	jQuery('#' + tdID).append(dteMoreHTML);  // Append the Read More link
			
}
