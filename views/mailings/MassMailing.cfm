<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Mass Mailing</title>
</head>

<body>

		<CFQUERY NAME="GetRecords" DATASOURCE="lodge_members">
			 SELECT LASTNAME, FIRSTNAME, EMAIL, MST, STATS
			 FROM MEMDAT
			 WHERE (EMAIL <> NULL
			 AND (STATS = 'Good'
			 OR STATS = 'MMX'
			 OR STATS = 'FC'
			 OR STATS = 'EA'))
			
		</CFQUERY>
		<CFQUERY NAME="GetPastMasterRecords" DATASOURCE="lodge_members">
			SELECT LASTNAME, FIRSTNAME, EMAIL, MST, STATS
			FROM MEMDAT
			 WHERE (EMAIL <> NULL
			 AND (STATS = 'Good')
			and pm = 'Yes')
			
		</CFQUERY>		
		<!--- <cfoutput>#ValueList(GetRecords.email)#<br></cfoutput> --->
		
<!---  <CFOUTPUT query="GetRecords">
		#LASTNAME# #FIRSTNAME# #EMAIL# #MST# #STATS# <br>
		</CFOUTPUT> 
--->
		<cfset HP240_list = "lnmadigan@comcast.net,bhoff1356@aol.com,ericwolff@optonline.net,DBL1557@aol.com,rawsonm@yahoo.com,jcputnal@patmedia.net,bvash@aol.com,mcmorto@comcast.net,tabayama22@aol.com,warfken@pobox.com,jose.daguman@juno.com,gafsm6@netscape.net,robertjgiudice@yahoo.com,ronbosan@aol.com,p.nickolas@worldwidenet.att.net,normpers@optonline.net,kornspan@yahoo.com,spahnpm@aol.com">
		<cfset LAF27_list = "jakolchin@aol.com,Bill_weber1962@hotmail.com,frankbines@comcast.net,utensils@optonline.net">
		<cfset PRINCE38_list = "wells452@aol.com,theovarga@yahoo.com,rgene.gaillard@agedwards.com,cchuckie55@aol.com,jackford@patmedia.net,PrincetonMason38@aol.com,validude2001@yahoo.com,tbilltoole@aol.com">
		<cfset CAES64_list = "timothy_touhey@msn.com,drumadoir@gmail.com,Popsqd@msn.com,MSparlit@msn.com,mistaporta@aol.com,rspyburn@comcast.net,wfranklin@mitre.org,GMAYMON@aol.com">
		<cfset MILL294_list = "FJGMD@yahoo.com">
		<cfset MON172_list = "glthomas@rci.rutgers.edu">
		<cfset MTZION135_list = "bytheplumb@aol.com">
		<cfset RARVAL46_list = "mmedora@att.net">
		<cfset PAL111_list = "kclollin@cs.com">
		<cfset UNION19_list = "G.filson@worldnet.att.net">
		<cfset SECRETARY_list = "popsqd@msn.com,rawsonm@yahoo.com,ckurowsky@comcast.net,matno192@aol.com,arcon929@aol.com,rseg1@aol.com,jiacone@panynj.gov,bobemig@yahoo.com,benson.curt@gmail.com,jensen1031@hotmail.com,jackford@patmedia.net,tr219@comcast.net,CRJohnsonwm@aol.com">
		<cfset STStevens63_list = "IANCAIRNS@aol.com">
		
		<CFSET EMAIL_LIST = "#HP240_list#,#LAF27_list#,#PRINCE38_list#,#CAES64_list#,#MILL294_list#,#MON172_list#,#MTZION135_list#,#RARVAL46_list#,#PAL111_list#,#UNION19_list#,#STStevens63_list#,">
		<CFSET PHILO_EMAIL_LIST = "#ValueList(GetRecords.email)#">
		
		<!--- <CFOUTPUT query="GetRecords"> --->
		<CFOUTPUT>
				<!--- <CFMAIL to="#EMAIL_LIST#" --->
				<!--- <CFMAIL to="#SECRETARY_list#" --->
				<!--- <CFMAIL to="#PHILO_EMAIL_LIST#" --->
				<CFMAIL to="#EMAIL_LIST#"
				cc="secretary@philolodge.net"
				from="philolodge@philolodge.net" 
				subject="Knight to Remember III Table Lodge at Philo Lodge No. 243" 
				type="HTML">
				<HTML>
				  
				<div align="center" style="background-color: ##383838; color: black; font-family: verdana, arial, sans-serif; font-size: 0.9em;">
				<p>
				<!--- #MST# #LASTNAME#, ---> 
<!---  				<div align="left" style="color: red; font-family: verdana, arial, sans-serif; font-size: 0.75 em;  font-style: italic;" >* Please don't auto respond to this email.*<br><br><br></div>
				Brother Secretary, 
				Please read the following at your next meeting prior to the November 1, 2008 date <BR>and post in your lodge building.<BR><br>
				<div align="center">T H A N K S</div><br> --->
				
				My Brother, if you haven't registered yet, time is running out ! <br><br>
				
				Philo Lodge No. 243 invites you to attend a very special<strong><br>
				"Knight to Remember III" <br>Table Lodge and Encampment <br>
				under the Templar Tent at Philo Lodge</strong><br><br>
				Officers and some guests dressed as Medieval Knights<br><br>
				
				<br>
				<table style="color: black; font-family: verdana, arial, sans-serif; font-size: 1 em;">
					<tr><td><strong>When</strong>:</td><td>Saturday October 24th, 2009</td></tr>
					<tr><td><strong>Time</strong>:</td><td>5:00 PM - Grog Social Hour</td></tr>
					<tr><td>&nbsp;</td><td>6:00 PM - Procession of the Knights</td></tr>
					<tr><td>&nbsp;</td><td>6:30 PM - Saurebraten Dinner, Toasting and Presentaion of 25 year pins</td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td><strong>Where</strong>:</td><td>Philo Lodge No. 243<br>
						120 Old Bridge Turnpike,<br>
						South River, NJ<br>
						[ <a href="http://maps.google.com/maps?q=Masonic%20Temple,%20120%20Old%20Bridge%20Turnpike,%20South%20River,%20NJ&hl=en">get directions</a> ]<br>
						(732) 254-9867<br></td>
					</tr>
					<tr><td><strong>Cost</strong>:</td><td>Templar Tax - $27 per person</td></tr>
				</table>
				<br><br>
				To reserve your seat at the round table, go to the <br><a href="http://www.philolodge.net">Philo Lodge Website</a> and click on the registration link<br>
				OR<br>
				Register <a href="http://www.philolodge.net/default.cfm?pageType=rsvp">here</a> <br>
				OR<br>
				Contact the Philo Lodge Secretary @ (732) 905-9873   (  secretary@philolodge.net  )<br><br>
				
				Don't miss your chance at being part of this very special event !<br>
				Please forward this email to any brothers who you might think would be interested in attending !<BR><br>
		
				<div align="center"><img src="http://www.philolodge.net/images/templar.jpg"></div>
				</div>

				
				</HTML>
				</CFMAIL>				
		
		<cfoutput>Done</cfoutput>
	
		</CFOUTPUT>

</body>
</html>
