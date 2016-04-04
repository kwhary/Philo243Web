
	<CFQUERY NAME="GetRecords" DATASOURCE="lodge_members">
		 SELECT *
		 FROM RSVP
		 order by lname,fname asc
		 
	</CFQUERY>	
	<table border='1'>
				<tr style="font-family: verdana, arial, sans-serif; font-size: 0.9em;">
					<td style="background-color: silver; color: black;" align="center">Name</td>
					<td style="background-color: silver; color: black;" align="center">Lodge</td>
					<td style="background-color: silver; color: black;" align="center">e-mail</td>
					<td style="background-color: silver; color: black;" align="center">Attending</td>
					<td style="background-color: silver; color: black;" align="center">Additional<br>Attendees</td>
					<td style="background-color: silver; color: black;" align="center">RSVP<br>Date</td>
				</tr>
	<cfoutput query="GetRecords">
				<tr>
					<td class="smallcaps">#lname#, #fname#</td>
					<td class="small">#lodge_name# </td>
					<td class="small">#email#</td>
					<td class="small"  align="center">#num_attending#</td>
					<td class="small">#addl_names#&nbsp;</td>
					<td class="small">#DateFormat("#request_dte#","mm/dd/yyyy")#</td>
				</tr>
	</cfoutput>
	
	</table>

