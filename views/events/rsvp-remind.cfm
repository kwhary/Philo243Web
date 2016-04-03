<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Remind RSVP</title>
</head>

<body>

	<CFQUERY NAME="GetRecords" DATASOURCE="lodge_members">
		 SELECT *
		 FROM RSVP
		 order by lname,fname asc
		 
	</CFQUERY>	
	
	<cfoutput query="GetRecords">

	<cfset attending = #num_attending#*28>
	
		<cfmail to="#email#"
		from="philolodge@philolodge.net" 
		subject="REMINDER - Knight to Remember VIII Table Lodge at Philo" 
		type="HTML">
		<HTML>
		<div align="center" style=" font-family: verdana, arial, sans-serif; font-size: 0.9em;">  
		<p><br><br>
		------------------------- R E M I N D E R ----------------------<BR>
		Brother #lname#, just a brotherly reminder that you have registered for for the "Knight to Remember VIII" Table Lodge at Philo.<br>
		Bring the RSVP email with you the night of the event.<br>
		Payment will be due the night of the event (Unless you have already made payment). <br>
		Templar Tax Due: #DollarFormat(attending)# <br><br>
		<div align="center" style="font-family: verdana, arial, sans-serif; font-size: 0.9em;">
		------------------------- DETAILS -------------------------</div>
		<p style="font-family: verdana, arial, sans-serif; font-size: 0.9em;">
		Reservation Number: #ID#<br>
		Number in Party: #num_attending#<br>
		<cfif #addl_names# NEQ ''>#addl_names#<br></cfif><br>
		Saturday October 10th, 2015 <br>
		Social Hour : 5:00 PM<br>
		Procession of the Knights: 6:00 PM<br>
		Table Lodge Dinner: 6:30 PM<br>
		</p>
		<img src="http://www.philolodge.net/images/GrailChapelLight.jpg">
		</div>
		
		</HTML>
		</CFMAIL>
done
</cfoutput>

</body>
</html>
