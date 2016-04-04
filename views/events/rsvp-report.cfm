<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>RSVP Report</title>
</head>

<body>



	<CFQUERY NAME="GetRecords" DATASOURCE="lodge_members">
		 SELECT *
		 FROM RSVP
		 order by lname,fname asc
		 
	</CFQUERY>	
	<cfheader name="Content-Disposition" value="inline; filename=TableLodge2008.xls">
	<cfcontent type="application/vnd.msexcel">
	<table border='1'>
				<tr style="font-family: verdana, arial, sans-serif; font-size: 0.9em;">
					<td style="background-color: silver; color: black;" align="center">Name</td>
					<td style="background-color: silver; color: black;" align="center">Lodge</td>
					<td style="background-color: silver; color: black;" align="center">e-mail</td>
					<td style="background-color: silver; color: black;" align="center">Attending</td>
					<td style="background-color: silver; color: black;" align="center">Additional<br>Attendees</td>
					<td style="background-color: silver; color: black;" align="center">RSVP<br>Date</td>
					<td style="background-color: silver; color: black;" align="center">Paid</td>
				</tr>
	<cfoutput query="GetRecords">
				<tr>
					<td>#lname#, #fname#</td>
					<td>#lodge_name# </td>
					<td>#email#</td>
					<td  align="center">#num_attending#</td>
					<td>#addl_names#&nbsp;</td>
					<td>#DateFormat("#request_dte#","mm/dd/yyyy")#</td>
					<td>&nbsp;</td>
				</tr>
	</cfoutput>
				<tr style="font-family: verdana, arial, sans-serif; font-size: 0.9em;">
					<td style="background-color: silver; color: black;" align="center">&nbsp;</td>
					<td style="background-color: silver; color: black;" align="center">&nbsp;</td>
					<td style="background-color: silver; color: black;" align="center"><strong>TOTAL</strong></td>
					<td style="background-color: silver; color: black;" align="center"><strong>=Sum(D3..D<cfoutput>3 + (#GetRecords.recordCount# -1)</cfoutput>)</strong></td>
					<td style="background-color: silver; color: black;" align="center">&nbsp;</td>
					<td style="background-color: silver; color: black;" align="center">&nbsp;</td>
					<td style="background-color: silver; color: black;" align="center">&nbsp;</td>				
				</tr>		
	
	
	
	</table>

	
</body>
</html>
