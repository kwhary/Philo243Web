<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Mass Mailing</title>
</head>

<body>

		<CFQUERY NAME="GetRecords" DATASOURCE="lodge_members">
			 SELECT LASTNAME, FIRSTNAME, EMAIL, MST, STATS
			 FROM MEMDAT
			 WHERE EMAIL <> NULL
			 AND STATS = 'Good'
			
		</CFQUERY>
		
		<cfoutput>Sent To: #ValueList(GetRecords.email)#<br></cfoutput>


		<CFOUTPUT>

				<CFMAIL to="#ValueList(GetRecords.email)#"
				from="philolodge@philolodge.net" 
				subject="Level Club of South River - Special Meeting" 
				type="HTML" 
				server="mail.philolodge.net" 
				username="philolodge@philolodge.net"
				password="may21923">
				<HTML>
				
				<div align="left" style="color: black; font-family: verdana, arial, sans-serif; font-size: 1 em;">  
				<p>
				
				My Brother, <br><br>
				
				Recieved word from the Level Club President, WB John Kratzer that a special meeting of the<br>
				Level Club of South River will be held Thursday October 11th at 7 PM.<br><br>
				The meeting will be held to discuss the necessary setup for the upcoming table lodge on Saturday October 13th.<br><br>
				
				The Level Club president would also like to stop in and welcome the brothers of Highland Park Lodge No. 240<br>
				who will be meeting the same night in our lodge room.<br><br>
				
				If at all possible, please plan on attending.<br><br>
				
				Fraternally,<br><br>
				
				Kevin Whary, PM<br>
				Secretary

				</div>

				
				</HTML>
				</CFMAIL>				
		
		<cfoutput>Done</cfoutput>
	
		</CFOUTPUT>

</body>
</html>

