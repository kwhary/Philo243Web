<cfset datesToShow = 7>

<cfajaxproxy cfc="commonFunctions" jsclassname="commonFunctions"><!--- connect to the common functions --->

<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>
<script type='text/javascript' src='https://code.jquery.com/ui/1.11.4/jquery-ui.js'></script>
<script src='javascripts/date.format.js'></script>
<script src='javascripts/time.format.js'></script>

<script src='javascripts/calendar.functions.js'></script>

<script src='javascripts/find.index.js'></script>
<script src='javascripts/setDates.js'></script>

<script src='javascripts/build.digest.js'></script><!--- build digest calendar rows --->

<!--- <cfsavecontent variable="theDigest">--->
	
<!--- <cf_digest />---><!---  get the table HTML for the weekly digest 
<cfdump expand="false" var="#THISTAG#">
<cfif (THISTAG.ExecutionMode EQ "Start")>--->

<cfsavecontent variable="theStuff">
		
	<cfinclude template="digest.cfm"><!---  get the table HTML for the weekly digest --->

	<cfscript>
		writeOutput("<script type='text/javascript' src='https://apis.google.com/js/client.js?onload=initMain'></script>");
	</cfscript>

</cfsavecontent>
<!---
<cfdump expand="false" var="#variables#">--->
<cfoutput>#theStuff#</cfoutput>

<!--- </cfif>
<cfdump expand="false" var="#THISTAG#">--->

<!--- <cfcontent type="text/plain" variable="#CharsetDecode(theDigest, 'utf-8')#"> --->
<!--- </cfsavecontent>--->


<script type="text/javascript">

	var results = new commonFunctions(); // instantiate the commonfunction cfc object
	results.setCallbackHandler(doBirthdays); // set the callbacks
	results.setErrorHandler(doBirthdayError);  // set the callbacks

	results.getMemberDates(); // get the member dates
	
	function doBirthdays(bd) {

		birthdayBlockHTML = "";

		if (bd.DATA.length) {

			bdHeaderHTML = '<tr><th colspan=2 id="birthday_title">Masonic Birthdays for ' + dateFormat(bd.DATA[i][bd.COLUMNS.findIdx("CURRENT_DATE")], "mmmm") + '</th></tr>';
			jQuery('#birthdayBlock').append(bdHeaderHTML); // append the birthday header
		}

		for( i=0; i < bd.DATA.length; i++ ){ 
			//alert( bd.DATA[i][bd.COLUMNS.findIdx('FIRSTNAME')] );
			birthdayBlockHTML = "<tr>" + "<td align='right'>" + bd.DATA[i][bd.COLUMNS.findIdx('MST')] + " " + bd.DATA[i][bd.COLUMNS.findIdx('FIRSTNAME')] + " " + bd.DATA[i][bd.COLUMNS.findIdx('LASTNAME')] + " - </td><td align='left'><strong>" + bd.DATA[i][bd.COLUMNS.findIdx('ADJUSTEDYEARS')] + "</strong> years - Raised " + dateFormat(bd.DATA[i][bd.COLUMNS.findIdx("MDATE")], "mm/dd/yyyy") + "</td></tr>";

			jQuery('#birthdayBlock').append(birthdayBlockHTML); // append the birthdays
		}

		if (bd.DATA.length) {
			congratsHTML = "<tr><td colspan=2 id='congrats' align='center'><br><strong>Congratulations Brethren !</strong></td></tr>";
			jQuery('#birthdayBlock').append(congratsHTML); // append the congrats
		}
		else {
			nobirthdaysHTML = "<tr><td colspan=2 id='nobirthdays' align='center'><br><strong>None this month </strong></td></tr>";
			jQuery('#birthdayBlock').append(nobirthdaysHTML); // append the no birthdays
		}
		
	}

	function doBirthdayError(e) {
		alert(e);
	}

</script>
