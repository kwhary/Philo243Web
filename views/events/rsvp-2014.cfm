<cfoutput>
<cfparam name="url.pass" default="1"><!--- which pass of the recursive form  --->

<cfswitch expression="#url.pass#">

  <cfcase value="1"><!--- First pass --->
  
		<SCRIPT LANGUAGE="JavaScript">
				
		var antiSpam = function() {
        if (document.getElementById("antiSpam")) {
            a = document.getElementById("antiSpam");
             if (isNaN(a.value) == true) {
                 a.value = 0;
			}
			 else {
                 a.value = parseInt(a.value) + 1;
             }
        }// end if
        setTimeout("antiSpam()", 1000);
		} // end antiSpam function
						
		function emailCheck (emailStr) {
		
			var checkTLD=1;
			var knownDomsPat=/^(com|net|org|edu|int|mil|gov|arpa|biz|aero|name|coop|info|pro|museum|tv)$/;
			var emailPat=/^(.+)@(.+)$/;
			var specialChars="\\(\\)><@,;:\\\\\\\"\\.\\[\\]";
			var validChars="\[^\\s" + specialChars + "\]";
			var quotedUser="(\"[^\"]*\")";
			var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
			var atom=validChars + '+';
			var word="(" + atom + "|" + quotedUser + ")";
			var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
			var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");
			var matchArray=emailStr.match(emailPat);
			
			if (matchArray==null) {
				alert("Incorrect e-mail address. \n(check @ and .'s)");
				return false;
			}
			
			var user=matchArray[1];
			var domain=matchArray[2];
			
			for (i=0; i<user.length; i++) {
				if (user.charCodeAt(i)>127) {
					alert("Incorrect e-mail address. \nThe username contains invalid characters.");
					return false;
			   }
			}
			for (i=0; i<domain.length; i++) {
			if (domain.charCodeAt(i)>127) {
				alert("Incorrect e-mail address. \nThe domain name contains invalid characters.");
				return false;
			   }
			}
			
			if (user.match(userPat)==null) {
			
				alert("Incorrect e-mail address. \nThe username is invalid.");
				return false;
			}
			
			
			var IPArray=domain.match(ipDomainPat);
			if (IPArray!=null) {
			
			for (var i=1;i<=4;i++) {
				if (IPArray[i]>255) {
				alert("Incorrect e-mail address. \nDestination IP address is invalid!");
				return false;
			   }
			}
			return true;
			}
			 
			var atomPat=new RegExp("^" + atom + "$");
			var domArr=domain.split(".");
			var len=domArr.length;
			for (i=0;i<len;i++) {
				if (domArr[i].search(atomPat)==-1) {
				alert("Incorrect e-mail address. \nThe domain name is invalid.");
				return false;
			   }
			}
				
			if (checkTLD && domArr[domArr.length-1].length!=2 && 
				domArr[domArr.length-1].search(knownDomsPat)==-1) {
				alert("Incorrect e-mail address. \nThe address must end in a well-known domain or two letter " + "country.");
				return false;
			}
			
			if (len<2) {
				alert("Incorrect e-mail address \nThe e-mail address is missing a hostname!");
				return false;
			}
			
			return true;
			}
			
		function isInteger(val)
		{
		    //alert(val);
		    if(val==null)
		    {
		       // alert(val);
		        return false;
		    }
		    if (val.length==0)
		    {
		        //alert(val);
		        return false;
		    }
		    for (var i = 0; i < val.length; i++) 
		    {
		        var ch = val.charAt(i)
		        if (i == 0 && ch == "-")
		        {
		            continue
		        }
		        if (ch < "0" || ch > "9")
		        {
		            return false
		        }
		    }
		    return true
		}			
	</SCRIPT>		
		
	<SCRIPT LANGUAGE="JavaScript">		
	
			
		function submitForm(){
			
			var editChecks = false;
			
			//antiSpam();		// sets timer on page and determines if a bot has submitted.
				
			//alert (window.location.pathname);			

			if (document.RSVP.fname.value == "") {
				alert("**             First Name Required  ** \n"
				    + " My Brother, your first name is required for RSVP.  \n");			
				document.RSVP.fname.focus();
				var editChecks = false;
				//return false;
			}
			
			if (document.RSVP.lname.value == "") {
				alert("**            Last Name Field Required  ** \n"
				    + " My Brother, your last name is required for RSVP.  \n");			
				document.RSVP.lname.focus();
				var editChecks = false;
				//return false;
			}
			
			if (document.RSVP.lodge_name.value == "") {
				alert("**            Lodge Name Field Required  ** \n"
				    + " My Brother, your Lodge Name and number is required for RSVP.  \n");			
				document.RSVP.lodge_name.focus();
				var editChecks = false;
				//return false;
			}			
					
			if (document.RSVP.email.value == "") {
				alert("**            Email Field Required  ** \n"
				    + " My Brother, your e-mail address is required for RSVP.  \n");			
				document.RSVP.email.focus();
				var editChecks = false;
				//return false;
			}	
			else { // VALIDATE THE EMAIL ADDRESS
				
				if ( emailCheck(document.RSVP.email.value) ) { // submit the form
						document.RSVP.action = "#cgi.script_name#?pageType=RSVP&pass=2";
						var editChecks = true;
						//return true;
					 	}
				else {  // don't submit
						var editChecks = false;
						//return false;   
				}
			}	
			if (editChecks == true) {
				//if ( isInteger(document.RSVP.antiSpam.value)) {			
				//	if (document.RSVP.antiSpam.value >= 5){
						return true;
						// NOT SPAM
				//	}
				//	else {
						// SPAM
				//		alert('BOT DETECTED ? ' + document.RSVP.antiSpam.value);
				//		return false;
				//	}
				}
				//else {
						// SPAM
				//		alert('BOT DETECTED ? ' + document.RSVP.antiSpam.value);
				//		return false;
				//}
			//}
			else {return false;}
						
		}  // end function

		</SCRIPT>
  
  	<div align="center"><img src="images/Helmet1.jpg"  alt="Knights Helmet"></div>
  
  <!--- <p><br>View last year's photo album<a href="/gallery/KnightToRememberV/index.html" target="_blank" title="View last years photo album"> Knight to Remember V Photos</a></p>--->
  
	<form action="default.cfm?pageType=RSVP&pass=2" method="post" name="RSVP" id="RSVP" onSubmit="return submitForm();" >
	
	<input type="hidden" name="antiSpam" id="antiSpam" value="Please do not alter" />
	
	<div class="row">
		<div class="twelve mobile-four centered columns">
		<cfif IsDefined("cookie.LName")><H5>Brother #COOKIE.LNAME#, </cfif>Reserve you seat at the Round Table now !</H5>
		Having trouble registering ?  Send your RSVP direct to the 
		<a href="mailto:secretary@philolodge.net?Subject=Knight%20to%20Remember%20Table%20Lodge%20at%20Philo-RSVP%20Problem&body=Problem%20RSVPing,%20Please%20register%20me" target="_top">Secretary !</a>
		
		<HR WIDTH="100%">
		</div>	
	</div>
	  <div class="row">
		    <div class="five mobile-four centered columns">
		      <label style="color:white">* First Name:</label>
		      <input name="fname" id="fname" <cfif IsDefined("cookie.fname")>value="#COOKIE.FNAME#"<CFELSE>value=""</CFIF> size="35" type="text" maxlength="30" message="Enter your first name." placeholder="First Name"/>
		    </div>
		    <div class="seven columns"></div>
	  </div>
	  <div class="row">
		    <div class="five mobile-four centered columns">
		      <label style="color:white">* Last Name:</label>
		      <input name="lname" id="lname" <cfif IsDefined("cookie.lname")>value="#COOKIE.LNAME#"<CFELSE>value=""</CFIF>  size="35" type="text" maxlength="30" message="Enter your last name." placeholder="Last Name"/>
		    </div>
		    <div class="seven columns"></div>
	  </div>	
	  <div class="row">
		    <div class="five mobile-four centered columns">
		      <label style="color:white">* Lodge Name & Number:</label>
		      <input name="lodge_name" id="lodge_name" value="" size="35" type="text" maxlength="60" message="Enter your Lodge." placeholder="Your Lodge Name & Number"/>
		    </div>
		    <div class="seven columns"></div>
	  </div>	
	  <div class="row">
		    <div class="five mobile-four centered columns">
		      <label style="color:white">* Email Address:</label>
		      <input name="email" id="email" value="" size="35" type="text" maxlength="60" message="Enter your e-mail address." placeholder="Your e-mail address"/>
		    </div>
		    <div class="seven columns"></div>
	  </div>
	  	
	  <div class="row">
		    <div class="four mobile-four centered columns">
		    	<label style="color:white">Number Attending:</label>
			    <select name="num_attending">
					<option value="1" selected>01</option>
					<option value="2">02</option>
					<option value="3">03</option>
					<option value="4">04</option>
					<option value="5">05</option>
					<option value="6">06</option>
					<option value="7">07</option>
					<option value="8">08</option>
					<option value="9">09</option>
					<option value="10">10</option>
				</select>
		    </div>
		    <div class="six columns"></div>
	  </div>  
	   
	  <div class="row">
		    <div class="five mobile-four centered columns">
		      <label style="color:white">Additional attendee names:</label>
		      <input name="addl_names" id="addl_names" value="" size="55" type="text" maxlength="60" message="Enter names of additional attendees." placeholder="Enter any additional attendee names"/>
		    </div>
		    <div class="seven mobile-four columns"></div>
	  </div>
	<p align="center"><input class="radius button" type="submit" name="register" value="I am up to the Crusade !   Register Me Now" /></p>
	 
	</form>

	
</cfcase>


<cfcase value="2"><!--- pass = 2 ( After form submission ) --->
<!--- second pass --->


	<CFQUERY NAME="CheckForDups" DATASOURCE="lodge_members">
		 SELECT fname, lname, email
		 FROM RSVP
		 WHERE ( email = '#form.email#' )
	</CFQUERY>	
		
	<cfif CheckForDups.RecordCount GT 0>
       
		<div class="row">
			<div class="twelve mobile-four centered columns">
				<h5>Sorry Brother, </h5>
				
				<p>Another brother has already RSVP'ed with information using the e-mail address you entered.</p>
				<p>#form.email#</p>
				<p>Please RSVP with a different e-mail address, or user your browser's 'back' button and try again.</p>
	            <p>&nbsp;</p>				
			</div> 
		</div>          
                    
	<cfelse>
		
		<CFQUERY NAME="InsertData" DATASOURCE="lodge_members">
			INSERT INTO RSVP
				(
				fname,
				lname,
				email,
				lodge_name,
				request_dte,
				num_attending,
				addl_names
				)
			VALUES 
				('#form.fname#',
				'#form.lname#',
				'#form.email#',
				'#form.lodge_name#',
				Date(),
				#form.num_attending#,
				'#form.addl_names#'
				)
		
		</CFQUERY>	
    
		<CFQUERY NAME="GetLastInsert" DATASOURCE="lodge_members"><!--- Get the highest id value in db --->
					       SELECT id
					              FROM RSVP
							Where RSVP.ID=(Select MAX(RSVP.ID) from RSVP)					        
		</CFQUERY>	

		<div class="row">
			<div class="twelve mobile-four centered columns">
				<h5>Thank-you brother #form.lname# for registering for the<br>
				"Knight to Remember VII" <br>Medieval Table Lodge at Philo Lodge.</h5><br>
				<img class="floatCenter" src="images/KnightsAll.gif" width="300" height="299" alt="Knights">
				<br>
				Saturday October 4th, 2014 <br>
				Appetizer Hour : 5:00 PM<br>
				Procession of the Knights: 6:00 PM<br>
				Rustic Table Lodge Dinner: 6:30 PM<br>
				<!--- Followed by the presentation of the 25 year tokens. ---><br><br>
				----------------- D E T A I L S ------------------------<BR>
				Reservation Number: #GetLastInsert.ID#<br>
				Number in Party: #form.num_attending#<br>
				Attendees: #form.fname# #form.lname#<cfif #form.addl_names# NEQ ''>,#form.addl_names#<br></cfif>
				<cfset attending = #form.num_attending#*28>
				Templar Tax Due: #DollarFormat(attending)# <br>
				Confirmation email sent to : <em>#form.email#</em>
				</p>				
			</div>
		</div>
		
		<!--- <p><br>View last year's photo album<a href="/gallery/KnightToRememberV/index.html" target="_blank" title="View last years photo album"> Knight to Remember V Photos</a></p>--->
		
		<CFMAIL to="#form.email#"
		from="philolodge@philolodge.net" 
		cc="secretary@philolodge.net" 
		subject="Knight to Remember VII Medieval Table Lodge at Philo - RSVP Confirmation">
   		<cfmailpart type="text" wraptext="74">
Knight to Remember Table Lodge Confirmation
Thank-you brother #form.lname# for registering for the "Knight to Remember VII" Medieval Table Lodge at Philo.
Please bring this RSVP email with you the night of the event.
A Templar Tax will be due the night of the event.
Templar Tax Due: #DollarFormat(attending)#
------------------------- DETAILS -------------------------
Reservation Number: #GetLastInsert.ID#
Number in Party: #form.num_attending#
Attendees: #form.fname# #form.lname# <cfif #form.addl_names# NEQ ''>,#form.addl_names#</cfif>
-----------------------------------------------------------
Saturday October 4th, 2014
Social Hour: 5:00 PM
Procession of the Knights: 6:00 PM
Table Lodge Dinner: 6:30 PM
   		</cfmailpart>
		
		<cfmailpart	type="HTML">
		<HTML>
		<head>
		<title>Table Lodge Registration Confirmation</title>
		</head>
		<body>
		<div align="center" style="color: black; font-family: verdana, arial, sans-serif; font-size: 0.9em;">  
		<p><br />
		<img src="http://www.philolodge.net/images/KnightsAll.gif" width="300" height="299" alt="Knights">
		<br />
		Thank-you brother #form.lname# for registering for the "Knight to Remember VII" Medieval Table Lodge at Philo.<br />
		Please bring this RSVP email with you the night of the event.<br />
		A Templar Tax will be due the night of the event. <br />
		Templar Tax Due: #DollarFormat(attending)#<br /><br />
		</p>
		------------------------- DETAILS -------------------------
		<p style="color: black;	font-family: verdana, arial, sans-serif; font-size: 0.9em;">
		Reservation Number: #GetLastInsert.ID#<br />
		Number in Party: #form.num_attending#<br />
		Attendees: #form.fname# #form.lname# <cfif #form.addl_names# NEQ ''>,#form.addl_names#<br></cfif><br />
		<hr><br />
		Saturday October 4th, 2014<br />
		Social Hour : 5:00 PM<br />
		Procession of the Knights: 6:00 PM<br />
		Table Lodge Dinner: 6:30 PM<br />
		<hr>
		</p>
		</div>
		</body>
		</HTML>
		</cfmailpart>
		</CFMAIL>
	</cfif>
	
	
</cfcase>


</cfswitch>




</cfoutput>
