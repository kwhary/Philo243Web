<cfoutput>
<cfparam name="url.pass" default="1"><!--- which pass of the recursive form  --->

<cfswitch expression="#url.pass#">

  <cfcase value="1"><!--- First pass --->
  
		<SCRIPT LANGUAGE="JavaScript">
				
		
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
			
			
	</SCRIPT>		
		
	<SCRIPT LANGUAGE="JavaScript">		
		
		function submitForm(){
		
			
			//alert (window.location.pathname);			

			if (document.RSVP.fname.value == "") {
				alert("**             First Name Required  ** \n"
				    + " My Brother, your first name is required for RSVP.  \n");			
				document.RSVP.fname.focus();
				return false;
			}
			
			if (document.RSVP.lname.value == "") {
				alert("**            Last Name Field Required  ** \n"
				    + " My Brother, your last name is required for RSVP.  \n");			
				document.RSVP.lname.focus();
				return false;
			}
			
			if (document.RSVP.lodge_name.value == "") {
				alert("**            Lodge Name Field Required  ** \n"
				    + " My Brother, your Lodge Name and number is required for RSVP.  \n");			
				document.RSVP.lodge_name.focus();
				return false;
			}			
						
			if (document.RSVP.email.value == "") {
				alert("**            Email Field Required  ** \n"
				    + " My Brother, your e-mail address is required for RSVP.  \n");			
				document.RSVP.email.focus();
				return false;
			}	
			else { // VALIDATE THE EMAIL ADDRESS
				
				if ( emailCheck(document.RSVP.email.value) ) { // submit the form
						document.RSVP.action = "#cgi.script_name#?pageType=RSVP&pass=2";
						//return true;
					 	}
				else {  // don't submit
						return false;   }
			}	
			

		}  // end function

		</SCRIPT>
  
  	<div align="center"><img src="images/templar_and_hospitaller_knights.jpg" width="200" height="265" alt="Knights"></div>
  
  
	<form action="default.cfm?pageType=RSVP&pass=2" method="post" name="RSVP" id="RSVP" onSubmit="return submitForm();" >
	<fieldset>
		<legend ALIGN="center"><cfif IsDefined("cookie.LName")><strong>Brother #COOKIE.LNAME#, </cfif>reserve you seat at the Round Table now !</strong></legend>
		
		    <p class="center"><em>*</em> Indicates a required field</p>
		    <p><label for="fname"><em>*</em> First Name:</label>
		    <input name="fname" id="fname" <cfif IsDefined("cookie.fname")>value="#COOKIE.FNAME#"<CFELSE>value=""</CFIF> size="35" type="text" maxlength="30" message="Enter your first name." /></p>

		    <p><label for="lname"><em>*</em> Last Name:</label>
		    <input name="lname" id="lname" <cfif IsDefined("cookie.lname")>value="#COOKIE.LNAME#"<CFELSE>value=""</CFIF>  size="35" type="text" maxlength="30" message="Enter your last name." /></p>

		   <p><label for="lodge_name"><em>*</em> Lodge Name & Number:</label>
		    <input name="lodge_name" id="lodge_name" value="" size="35" type="text" maxlength="60" message="Enter your Lodge." /></p>

		   <p><label for="email"><em>*</em> E-mail address:</label>
		    <input name="email" id="email" value="" size="35" type="text" maxlength="60" message="Enter your e-mail address." /></p>
			
		 <p><label for="num_attending">Number attending:</label>
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
		</p>
		<p><label for="addl_names">Additional attendee names:</label>
		    <input name="addl_names" id="addl_names" value="" size="55" type="text" maxlength="60" message="Enter names of additional attendees." /></p> 
		 
  		<p CLASS="center"><input type="submit" value="I am up to the Crusade !   Register Me Now" /></p>
	</fieldset>
	 
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
			<h3>Sorry Brother, </h3>
			
			<p>Another brother has already RSVP'ed with information using the e-mail address you entered.</p>
			<p>#form.email#</p>
			<p>Please RSVP with a different e-mail address, or user your browser's 'back' button and try again.</p>
            <p>&nbsp;</p>
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

	
		<div align="center">
		<p align="center">Thank-you brother #form.lname# for registering for the<br>
		<h3>"Knight to Remember III" <br>Table Lodge at Philo Lodge.</h3><br>
		<div align="center">
		<img src="images/KnightTemplar.jpg" width="300" height="435" alt="Knights">
		</div><br>
		Saturday October 24th, 2009 <br>
		Grog Social Hour : 5:00 PM<br>
		Procession of the Knights: 6:00 PM<br>
		Table Lodge Dinner: 6:30 PM<br>
		Followed by the presentation of the 25 year tokens.<br><br>
		----------------- D E T A I L S ------------------------<BR>
		Reservation Number: #GetLastInsert.ID#<br>
		Number in Party: #form.num_attending#<br>
		Attendees: #form.fname# #form.lname# <cfif #form.addl_names# NEQ ''>,#form.addl_names#<br></cfif>
		<cfset attending = #form.num_attending#*27>
		Templar Tax Due: #DollarFormat(attending)#<br>
		Confirmation email sent to : <em>#form.email#</em>
		</p>
		</div>
		<cfmail to="#form.email#"
		from="philolodge@philolodge.net" 
		bcc="secretary@philolodge.net" 
		subject="Knight to Remember III Table Lodge at Philo - RSVP Confirmation" 
		type="HTML">
		<HTML>
		<div align="center" style="color: black; font-family: verdana, arial, sans-serif; font-size: 0.9em;">  
		<p><br>
		<img src="http://www.philolodge.net/images/KnightTemplar.jpg" width="300" height="435" alt="Knights">
		<br>
		Thank-you brother #form.lname# for registering for the "Knight to Remember III" Table Lodge at Philo.<br>
		Bring this RSVP email with you the night of the event.<br>
		A Templar Tax will be due the night of the event. <br>
		Templar Tax Due: #DollarFormat(attending)#<br><br>
		<div align="center" style="color: black;	font-family: verdana, arial, sans-serif; font-size: 0.9em;">
		------------------------- DETAILS -------------------------</div>
		<p style="color: black;	font-family: verdana, arial, sans-serif; font-size: 0.9em;">
		Reservation Number: #GetLastInsert.ID#<br>
		Number in Party: #form.num_attending#<br>
		Attendees: #form.fname# #form.lname# <cfif #form.addl_names# NEQ ''>,#form.addl_names#<br></cfif><br>
		<hr><br>
		Saturday October 24th, 2009 <br>
		Social Hour : 5:00 PM<br>
		Procession of the Knights: 6:00 PM<br>
		Table Lodge Dinner: 6:30 PM<br>
		Followed by the presentation of the 25 year tokens.<br><hr>
		</p>
		</div>
		
		</HTML>
		</CFMAIL>
	</cfif>
	
	
</cfcase>


</cfswitch>




</cfoutput>
