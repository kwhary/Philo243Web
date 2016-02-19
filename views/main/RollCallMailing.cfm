<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
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

<CFSET PHILO_EMAIL_LIST = "#ValueList(GetRecords.email)#">

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

<!--- <CFMAIL to="#EMAIL#" query="GetRecords" --->
<CFMAIL to="#EMAIL_LIST#" 
from="secretary@philolodge.net" 
subject="Philo Lodge's Annual Roll Call Dinner is February 21, 2009" 
type="HTML">  
<HTML>
<P>
<!--- <CFSWITCH expression="#MST#">
<CFCASE value="RW">Right Worshipful</CFCASE><CFCASE value="WB">Worshipful</CFCASE></CFSWITCH> Brother #lastname#, --->
My Brother,
<br><br>
Philo Lodge's Annual Roll Call Dinner is coming next week. <BR>
If you do not know, this is the evening where, we as brothers, honor the memory of the Philo Lodge brothers <BR>
who have been called to the lodge on high by the Grand Artificer of the Universe during 2008.<br>
The lodge would be honored if you would be able to attend.<br><br>

DETAILS<BR><HR>
<strong>Saturday February 21, 2009</strong><br>
<strong>5PM </strong>- Social Hour<br>
<strong>6PM</strong> - Dinner<br>
Call of the Membership Roll<br>
Guest Speaker - To Be Announced<br><hr><br>

Please click <a href="http://spreadsheets.google.com/viewform?key=pkAvImLQluDwd2X-vBFtOCg">here to RSVP</a> and let us know that you will be attending so our Stewards can prepare a place for you.<br>
<!--- If you have already paid your 2009 dues, you should have received a complementary ticket for the Roll Call Dinner.  <br>
Please bring your ticket or your 2009 dues card with you.<br><br> --->


Fraternally,<br><br>

Kevin W. Whary, PM<br>
Secretary<br
Philo Lodge No. 243<br>
http://www.philolodge.net<br>
</P>
</HTML>
</cfmail>



</body>
</html>
