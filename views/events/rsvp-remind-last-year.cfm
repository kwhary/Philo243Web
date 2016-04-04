<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Remind RSVP</title>
</head>

<body>

	<CFQUERY NAME="GetRecords" DATASOURCE="lodge_members">
		 SELECT *
		 FROM RSVP_ALL
		 order by lname,fname asc
		 
	</CFQUERY>	
	
	<CFLOOP query="GetRecords">
	<CFOUTPUT>

	<cfset attending = #num_attending#*28>
		 
		<cfmail to="#email#"
		from="philolodge@philolodge.net" 
		subject="CRUSADER ALERT - Knight to Remember VIII Table Lodge at Philo Lodge approaching fast">
<cfmailpart type="text" wraptext="74">
Brother #lname#,
Our Ancient Crusader records indicate that you survived a previous year's crusade (2007, 2008, 2009, 2010, 2011, 2012, 2013 or 2014) 
"Knight to Remember" Medieval Table Lodge at Philo Lodge.
Last year (2014), was another fine table lodge !

We broke bread together as Free Men and Free Masons for the seventh consecutive year in the warmth of our bonfire.  
Our eighth year together is approaching quickly (Less than a month away !).

If you have not already registered to attend this year's event, now is time to sign up for this most Holy of Crusades.
Squeeze out your boots and come join us again this year.  You will not be disappointed or go away hungry.  God So Wills It !

We will be using our New pavilion appropriately adorned for the Battle.  Get your gear because the time is near.
--------------- D E T A I L S -------------
Saturday October 10th, 2015
Social Hour: 5:00 PM
Procession of the Knights: 6:00 PM
Table Lodge Dinner: 6:30 PM - Crusader Beef Sauerbraten Dinner or Rustic Turkey
along with toasting, chivalry and a raging bonfire.
COST: $25 per person ($20 if you wear battle gear !)

Hope to see you there !  Register on our website http://www.philolodge.net or contact the lodge secretary @ (732) 905-9873 / 973-420-3406 (cell)  (  SECRETARY@philolodge.net  )

</cfmailpart>
<cfmailpart	type="HTML">
		<head>
		<title>Knight To Remember VIII - Invitation</title>
		</head>
		<body>		
		<HTML>
		<div align="center" style="background-color: ##FFB76F; font-family: verdana, arial, sans-serif; font-size: 0.9em;">  
		<br><br>
		------------------------- C R U S A D E R&nbsp;&nbsp;&nbsp;A L E R T  ----------------------<BR>
		<table style="color: black; font-family: verdana, arial, sans-serif; font-size: 1 em;">
		<tr><td>
		Brother #lname#, <br>
		Our Ancient Crusader records indicate that you survived a previous year's crusade (2007, 2008, 2009, 2010, 2011, 2012, 2013 or 2014) "Knight to Remember" Medieval Table Lodge at Philo Lodge.<br>Last year (2014), was another fine table lodge. <br><br>We broke bread together as Free Men and Free Masons for the seventh consecutive year in the warmth of our bonfire.  Our eighth year together is approaching quickly (A few weeks away !).<br><br>
		If you have not already registered to attend this year's event, now is time to sign up for this most Holy of Crusades.<br>Squeeze out your boots and come join us again this year.  You will not be disappointed or go away hungry.  God So Wills It !
		We will be using our New pavilion appropriately adorned for the Battle.  Get your gear because the time is near.
		</td>
		</tr>
		</table>
		<div align="center" style="font-family: verdana, arial, sans-serif; font-size: 0.9em;"><br>
		------------------------- DETAILS -------------------------<br><br>
		
		<table style="color: black; font-family: verdana, arial, sans-serif; font-size: 1 em;">
			<tr><td colspan="2" align="center" style="font-size: 1.5 em;"><strong>A Knight to Remember VIII</strong><br>Medieval Table Lodge and Encampment</td></tr>
			<tr><td><strong>When</strong>:</td><td>Saturday October 10th, 2015</td></tr>
			<tr><td><strong>Time</strong>:</td><td>5:00 PM - Appetizer Hour</td></tr>
			<tr><td>&nbsp;</td><td>6:00 PM - Procession of the Knights in full battle regalia (20 last year !)</td></tr>
			<tr><td>&nbsp;</td><td>6:30 PM - Crusader Beef Sauerbraten Dinner or Rustic Turkey, Toasting and Chivalry</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td><strong>Where</strong>:</td><td>Under the Crusader Pavillion<br>Philo Lodge No. 243<br>
				120 Old Bridge Turnpike,<br>
				South River, NJ<br>
				[ <a href="http://maps.google.com/maps?q=Masonic%20Temple,%20120%20Old%20Bridge%20Turnpike,%20South%20River,%20NJ&hl=en">get directions</a> ]<br>
				(732) 254-9867<br></td>
			</tr>
			<tr><td><strong>Cost</strong>:</td><td>Templar Tax - <strong>$28</strong> per person.  <strong>$25</strong> for those in battle gear !</td></tr>
		</table><br>
		<table style="color: black; font-family: verdana, arial, sans-serif; font-size: 1 em;">
		<tr><td>
			To reserve your seat at the round table, go to the <br><a href="http://www.philolodge.net">Philo Lodge Website</a> and click on the registration link<br>
				OR<br>
				Register <a href="http://www.philolodge.net/default.cfm?pageType=rsvp">here</a> <br>
				OR<br>
				Contact the Philo Lodge Secretary @ (732) 905-9873 / 973-420-3406 (cell)  (  SECRETARY@philolodge.net  )<br><br>
				
				Don't miss your chance at being part of this very special event !<br>
		</td>
		</tr>
		</table><br><br>
				Please forward this email to any brothers who you might think would be interested in attending !<BR>ALL MASONS WELCOME !<br>				
		</div>
		<img src="http://www.philolodge.net/images/Helmet1.jpg">
		</div>
		
		</HTML>
</cfmailpart>		
		</CFMAIL>
			
	
EMAIL SENT TO: #fname# #lname#  ----- #email#<br>

</CFOUTPUT>
</CFLOOP>
<CFOUTPUT>
<br>Process Done<br>
</CFOUTPUT>
</body>
</html>

