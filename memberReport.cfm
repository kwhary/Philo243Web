<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<!--- <cfdump var='#cgi#'> --->


<cfquery DATASOURCE="lodge_members" NAME="getMembers">

SELECT 
		m.glnum, m.rcnm, m.mst, m.lastname, m.firstname, m.midname, m.mst,
		m.Address, m.addr2, m.city, m.state, m.zip,
		m.HPhone, m.BPhone, m.CPhone, m.email,
		m.mdate as theDate, m.spouse,
		m.stats
FROM memdat m
WHERE 	(
		m.stats = 'good' 	
		)
order by m.rcnm

</cfquery>
<!--- <cfdump VAR="#getMembers#" expand="no">--->

<cfloop query="getMembers">
<cfif #dateFormat(getMembers.theDate,'yyyy')# GTE '2005'>

<cfoutput>
<strong>#mst# #firstName# #midname# #lastName# </strong></br>
Spouse: #spouse#<br>
#address# <cfif #addr2# is not "">#addr2#</cfif></br>
#city#, #state#  #mid("#zip#","1","5")#</br>
Home Phone : <cfif #hphone# is not "">(#mid("#hphone#","1","3")#) #mid("#hphone#","4","3")#-#mid("#hphone#","7","4")#<cfelse>n/a</cfif></br>
Bus. Phone:  <cfif #bPhone# is not "">(#mid("#bPhone#","1","3")#) #mid("#bPhone#","4","3")#-#mid("#bPhone#","7","4")#<cfelse>n/a</cfif></br>
Cell Phone:  <cfif #cPhone# is not "">(#mid("#cPhone#","1","3")#) #mid("#cPhone#","4","3")#-#mid("#cPhone#","7","4")#<cfelse>n/a</cfif></br>
e-mail:  <cfif #email# is not "">#email#<cfelse>/na</cfif></br>
MM Date: #DateFormat(theDate,'mm-dd-yyyy')#<br>
-------------------------------------<br>

</cfoutput>

</cfif>
</cfloop>
</body>
</html>

