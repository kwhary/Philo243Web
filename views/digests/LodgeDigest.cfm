<!--- LAST UPDATE 01/25/2010 - K.WHARY - Corrected issues with missing event details and location on google calendar feed --->

<cfset CurrentDate = DateFormat(#now()#,  "yyyy-mm-dd" ) & "T00:57:00"><!--- 2007-05-01T00:57:00 &start-max=2007-05-31T23:57:00--->

<cfscript>
  URLToPull  = "http://www.google.com/calendar/feeds/mghbbc31rk9taddtvgtk37fnko%40group.calendar.google.com/public/basic?start-min=#CurrentDate#&singleevents=true&orderby=starttime&sortorder=ascend&hl=en";

// Get yesterday's date
function Yesterday()
{
	return DateAdd("d", -1, Now());
}

// Get tomorrow's date
function Tomorrow()
{
	return DateAdd("d", 1, Now());  
 }
</cfscript>

<cfset ThisMonthFull = #DateFormat("#Now()#","mmmm")#>

<cftry>

<cfquery DATASOURCE="lodge_members" name="getBirthdays">
	SELECT 
		Date() as current_date,
		DateDiff('yyyy', mdate, Now()) AS NumYears ,
	    DateDiff('yyyy', DateAdd('yyyy',  adjyear,  mdate), Now()) AS AdjustedYears,
		lastName, 
		firstName, 
		midname, 
		mst,
		email, 
		mdate, 
		stats, 
		ypm, 
		pmlodge, 
		glnum
	FROM memdat
	WHERE  glnum NOT IN (SELECT glnum FROM  omit)
	AND stats = 'good'
	AND MONTH(mdate) = #DateFormat('#Now()#','mm')#
	ORDER BY mdate asc, lastName asc, firstName asc

</cfquery>

<cfhttp url="#URLToPull#"
		   throwonerror="Yes"
           method="GET"
           timeout="15">
</cfhttp>

<cfscript>
  XMLContent = trim(cfhttp.filecontent);
  XMLContent = XMLParse(XMLContent);
</cfscript>

<cfsavecontent variable="digest">
<cfoutput>
<p><em>Do not reply to this message</em></p><br>
<table align="center" width="100%">
<tr>
	<td colspan="2">
		<fieldset STYLE="padding: 5px;">
			<legend ALIGN="center"  STYLE="font-variant:small-caps;font-size:115%">Philo Lodge NO. 243 F&AM<br> Event Digest for Week of #DateFormat(Now(),  "mmmm dd yyyy" )# </legend>
		</fieldset>
	</td>
</tr>
<tr valign="top">
	<td width="50%">

		
		<cfif #ArrayLen(XMLContent.feed.entry)# GTE 10>
			<cfset Show_num_Dates = 10>
		<cfelse>
			<cfset Show_num_Dates = #ArrayLen(XMLContent.feed.entry)#>
		</cfif>
		
		<cfset date_Count = 0><!--- SET THE DATE COUNTER --->
		
		<cfloop from="1" to="#ArrayLen(XMLContent.feed.entry)#" index="feed_idx">
		
			
				<cfset When = Mid(#XMLContent.feed.entry[feed_idx].summary.xmlText#, 6, Find("to",#XMLContent.feed.entry[feed_idx].summary.xmlText# ,1)-6 )>
				
				<cfset WherePosition = Find("Where",#XMLContent.feed.entry[feed_idx].summary.xmlText# ,1)><!--- DID THEY POPULATE THE LOCATION ?--->
				
				<cfif WherePosition EQ 0><!--- EVENT LOCATION NOT PROVIDED --->
					<cfset Where = 'none'>
				<cfelse><!--- EVENT LOCATION PROVIDED --->
					<cfset WherePosition = Find("Where",#XMLContent.feed.entry[feed_idx].summary.xmlText# ,1)+7>
					<cfset WhereEndPosition = Find("<",  #XMLContent.feed.entry[feed_idx].summary.xmlText# ,  #WherePosition# )>
					<cfset LenOfWhere = #WhereEndPosition# - #WherePosition#>
					<cfset Where = Mid(#XMLContent.feed.entry[feed_idx].summary.xmlText#, #WherePosition#, #LenOfWhere# )>
							
				</cfif>
			
				<cfset DesciptionPosition = Find("Event Description:",#XMLContent.feed.entry[feed_idx].content.xmlText# ,0)+ 18>
				<cfif #DesciptionPosition# GT 18>
						<cfset Details= Mid(#XMLContent.feed.entry[feed_idx].content.xmlText#, #DesciptionPosition#, 200 )>
				<cfelse>
					<cfset Details = 'none'>
				</cfif>
					
				<cfset EventDate = #ParseDateTime(When)#>
				
			
				<cfif DateCompare("#EventDate#", "#now()#" ) EQ -1>
							<!--- Date has passed, don't show it --->
				<cfelse>
							
							<fieldset STYLE="padding: 5px;">
							<legend ALIGN="center"  STYLE="font-variant:small-caps">
							
							<cfif DateCompare("#EventDate#", "#DateFormat(Tomorrow())#","d" ) EQ 0>
							<STRONG><FONT COLOR="RED"> &nbsp;TOMORROW -&nbsp;</FONT></STRONG>
							</cfif>
							<cfif DateCompare("#EventDate#", "#now()#","d" ) EQ 0>
							<STRONG><FONT COLOR="RED"> &nbsp;TODAY -&nbsp;</FONT></STRONG>
							</cfif>
							<FONT COLOR="Gray" STYLE="font-variant:small-caps;; font-weight: bold;">#DateFormat(EventDate,'dddd mmmm d, yyyy')#</FONT><br>
							<FONT COLOR="Gray" STYLE="font-variant:small-caps;font-size:95%;">#TimeFormat(EventDate,'h:mm tt')#</FONT>
							</legend>
							<span><FONT STYLE="font-variant:small-caps; font-weight: bold;font-size:105%"><a href="#XMLContent.feed.entry[feed_idx].link[1].XmlAttributes["href"]#" target="_blank" style="text-decoration:none;">#XMLContent.feed.entry[feed_idx].title.xmlText#</a></FONT>
							<br><br>
							<cfif #Details# NEQ 'none'>
									<em>#Details#</em><br><br>
							</cfif>
							<cfif #Where# NEQ 'none'>
									#where#<br>
							</cfif>										
							
							<!--- <FONT COLOR="Gray"><strong>TIME:</strong>&nbsp;#TimeFormat(EventDate,'hh:mm tt')#</FONT><br> --->
							<cfif #Where# EQ 'none'><!--- Use the lodges address by default --->
								[ <a href="http://maps.google.com/maps?q=120 Old Bridge Turnpike South River, NJ 08527&hl=en" alt="get directions" target="_blank">Get Directions</a> ]
							<cfelse>
								[ <a href="http://maps.google.com/maps?q=#where#&hl=en" alt="get directions" target="_blank">Get Directions</a> ]
							</cfif>
							</span>
							<br>
							</fieldset>
							<br>
							<cfset date_Count = date_Count + 1>
				</cfif>
			
		<cfif date_Count EQ Show_num_Dates><cfbreak></cfif><!--- BREAK OUT WHEN YOU REACH MAX DATES TO SHOW --->
			
		</cfloop>
		
		
		<fieldset STYLE="padding: 5px;">
		<legend ALIGN="center" STYLE="font-variant:small-caps"></legend>
		<span><STRONG><FONT COLOR="##FFFF80"><a href="http://www.google.com/calendar/embed?src=mghbbc31rk9taddtvgtk37fnko%40group.calendar.google.com "  target="_blank">VIEW the complete Lodge Calendar powered by <img title="Google" align="absmiddle" src="http://www.philolodge.net/images/google.gif" alt=" Google"></a>
		</FONT></STRONG><br></span>
		
		</fieldset>
		
	</td>
	<td width="50%"><!--- Birthday Display --->

			<cfif getBirthdays.RecordCount EQ 0>
				<fieldset STYLE="padding: 5px;">
				<fieldset STYLE="padding: 5px;">
				<legend ALIGN="center" CLASS="smallcaps">
				<cfoutput><STRONG>There were no Masonic Birthdays for #ThisMonthFull#.</strong></cfoutput>
				</legend>
				</fieldset>
			<cfelse>
				<fieldset STYLE="padding: 5px;">
				<legend ALIGN="center" CLASS="smallcaps">
				<cfoutput><STRONG><FONT COLOR="RED">Masonic Birthdays for #DateFormat("#getBirthdays.current_date#","mmmm")#</FONT></STRONG></cfoutput>
				</legend>
				<span CLASS="vignette" >
				<cfloop query="getBirthdays">
				#mst# #firstName# #lastName# - <strong>#AdjustedYears#</strong> years <cfif #NumYears# NEQ #AdjustedYears#><strong>*</strong></cfif>  (#DateFormat("#mdate#","mm-dd-yyyy")#)<br>
				</cfloop>
				<br><STRONG>Congratulations Brethren !</STRONG>
				</span>
				</fieldset>
			</cfif>				
	</td>
</tr>
<table>

</cfoutput>
</cfsavecontent>
<!--- server="mail.philolodge.net" 
username="philolodge@philolodge.net"
password="may21923" 
to="all-members@philolodge.net"  --->
<CFMAIL to="all-members@philolodge.net"
from="events@philolodge.net" 
subject="Philo Lodge No. 243 - Weekly Event Digest" 
type="HTML">
<HTML>
#digest#
</HTML>
</CFMAIL>	


<cfoutput>DONE - OK</cfoutput>
<cfcatch type="database">

<cfsavecontent variable="digestError">
<cfoutput>
<p>Do not reply to this message</p><br>
	
<fieldset STYLE="padding: 5px; width: 500px;">
	<legend ALIGN="center"  STYLE="font-variant:small-caps">
	<strong><font color="##FFF">** Weekly Digest dB Errror **</font></strong>
	</legend>
	<span>An dB Error was generated by the Lodge Digest.	</span>
</fieldset>
</cfoutput>
</cfsavecontent>

</cfcatch>
<cfcatch type="Any">

<cfsavecontent variable="digestError">
<cfoutput>
<p>Do not reply to this message</p><br>
	
<fieldset STYLE="padding: 5px; width: 500px;">
	<legend ALIGN="center"  STYLE="font-variant:small-caps">
	<strong><font color="##FFF">** Weekly Digest Errror **</font></strong>
	</legend>
	<span>An Error was generated by the Lodge Digest.	</span>
</fieldset>
</cfoutput>
</cfsavecontent>



<CFMAIL to="secretary@philolodge.net"
from="events@philolodge.net" 
subject="ERROR - Philo Lodge Weekly Event Digest" 
type="HTML">
<HTML>
#digestError#
</HTML>
</CFMAIL>		

<cfoutput>DONE - ERROR<br>#digestError#</cfoutput>


</cfcatch>
</cftry>



<!--- <cfdump var="#XMLContent#" expand="no" >  --->



	
