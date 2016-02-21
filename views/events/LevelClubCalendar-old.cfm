<cfset CurrentDate = DateFormat(#now()#,  "yyyy-mm-dd" ) & "T00:57:00"><!--- 2007-05-01T00:57:00 &start-max=2007-05-31T23:57:00--->
<cfscript>
  URLToPull  = "http://www.google.com/calendar/feeds/lvgv5n8p90q18v7jbkgpbjhb1o%40group.calendar.google.com/public/basic?start-min=#CurrentDate#&singleevents=true&orderby=starttime&sortorder=ascend&hl=en";
</cfscript>

<cftry>

<cfhttp url="#URLToPull#" 
		   throwonerror="Yes"
           method="GET"
           timeout="15">
</cfhttp>

<cfscript>
  XMLContent = trim(cfhttp.filecontent);
  XMLContent = XMLParse(XMLContent);
</cfscript>

<cfoutput>


	<cfif #ArrayLen(XMLContent.feed.entry)# GTE 7>
		<cfset Show_num_Dates = 7>
	<cfelse>
		<cfset Show_num_Dates = #ArrayLen(XMLContent.feed.entry)#>
	</cfif>
	
	<cfset date_Count = 0><!--- SET THE DATE COUNTER --->
	
	<cfloop from="1" to="#ArrayLen(XMLContent.feed.entry)#" index="feed_idx">
	
		
			<cfset When = Mid(#XMLContent.feed.entry[feed_idx].summary.xmlText#, 6, Find("to",#XMLContent.feed.entry[feed_idx].summary.xmlText# ,1)-6 )>
			
			<cfset WherePosition = Find("Where",#XMLContent.feed.entry[feed_idx].summary.xmlText# ,1)+7>
			<cfset WhereEndPosition = Find("<",  #XMLContent.feed.entry[feed_idx].summary.xmlText# ,  #WherePosition# )>
			<cfset LenOfWhere = #WhereEndPosition# - #WherePosition#>
			<cfset Where = Mid(#XMLContent.feed.entry[feed_idx].summary.xmlText#, #WherePosition#, #LenOfWhere# )>			
			
			<cfset DesciptionPosition = Find("Event Description:",#XMLContent.feed.entry[feed_idx].content.xmlText# ,0)+ 18>
			<cfif #DesciptionPosition# GT 18>
					<cfset Details= Mid(#XMLContent.feed.entry[feed_idx].content.xmlText#, #DesciptionPosition#, 200 )>
			<cfelse>
				<cfset Details = 'none'>
			</cfif>
				
			<cfset EventDate = #ParseDateTime(When)#>
			
		
			<cfif DateCompare("#EventDate#", "#now()#" ) EQ -1>
						<!--- date has passed --->
			<cfelse>
						
				<div class="panel radius">
						<h6 align="center">
						<cfif DateCompare("#EventDate#", "#now()#","d" ) EQ 0>
							<STRONG><FONT COLOR="RED"> &nbsp;TODAY&nbsp;</FONT></STRONG><br>
							</cfif>
							<STRONG><FONT COLOR="##F5F6CE">#DateFormat(EventDate,'dddd mmmm d yyyy')# </FONT></STRONG>
						</h6>
						<h6 class="subheader" align="center">
							<strong><a href="#XMLContent.feed.entry[feed_idx].link[1].XmlAttributes["href"]#" target="_blank">#XMLContent.feed.entry[feed_idx].title.xmlText#</a></strong>
							<br>
							#where#<br>
							<FONT COLOR="##F5F6CE">#TimeFormat(EventDate,'hh:mm tt')#</FONT><br>
	<!--- 						<cfif #Details# NEQ 'none'>
									#Details#
							</cfif> --->
							[ <a href="http://maps.google.com/maps?q=#where#&hl=en" alt="get directions" target="_blank">Get Directions</a> ]
						</h6>
				</div>
						<cfset date_Count = date_Count + 1>
			</cfif>
		
	<cfif date_Count EQ Show_num_Dates><cfbreak></cfif><!--- BREAK OUT WHEN YOU REACH MAX DATES TO SHOW --->
		
	</cfloop>

 </cfoutput>
<div class="panel radius hide-for-small">
<h6 class="subheader">

	<a href="http://www.google.com/calendar/embed?src=lvgv5n8p90q18v7jbkgpbjhb1o%40group.calendar.google.com&ctz=America/New_York"  target="_blank">VIEW the complete Rental Calendar powered by <img align="absmiddle" src="images/google.gif" alt="google image"></a> 
</h6>
</div>
<cfcatch type="Any">
	<cfoutput>
	<div class="panel">
	<h5 align="center">
			<strong><font color="##FFF">** RENTAL CALENDAR ERROR **</font></strong>
	</h5>
	<h6 class="subheader">Please refresh or try again later.</h6>
	</div>
	</cfoutput>
</cfcatch>
</cftry> 



<!--- <cfdump var="#XMLContent#" expand="no" >  --->



	
