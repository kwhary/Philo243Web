<cfset CurrentDate = DateFormat(#now()#,  "yyyy-mm-dd" ) & "T00:57:00"><!--- 2007-05-01T00:57:00 &start-max=2007-05-31T23:57:00--->
<cfscript>
  URLToPull  = "http://www.google.com/calendar/feeds/mghbbc31rk9taddtvgtk37fnko%40group.calendar.google.com/public/basic?start-min=#CurrentDate#&singleevents=true&orderby=starttime&sortorder=ascend";
</cfscript>

<cfhttp url="#URLToPull#"
           method="GET"
           timeout="15">
</cfhttp>

<cfscript>
  XMLContent = trim(cfhttp.filecontent);
  XMLContent = XMLParse(XMLContent);
</cfscript>


<cfoutput>


<cfif #ArrayLen(XMLContent.feed.entry)# GTE 5><cfset MaxFeeds = 5><cfelse><cfset MaxFeeds = #ArrayLen(XMLContent.feed.entry)#></cfif>
<cfloop from="1" to="#MaxFeeds#" index="idx">

	<cfset When = Mid(#XMLContent.feed.entry[idx].summary.xmlText#, 6, Find("to",#XMLContent.feed.entry[idx].summary.xmlText# ,1)-6 )>
	
	<cfset WherePosition = Find("Where",#XMLContent.feed.entry[idx].summary.xmlText# ,1)+7>
	<cfset WhereEndPosition = Find("<",  #XMLContent.feed.entry[idx].summary.xmlText# ,  #WherePosition# )>
	<cfset LenOfWhere = #WhereEndPosition# - #WherePosition#>
	<cfset Where = Mid(#XMLContent.feed.entry[idx].summary.xmlText#, #WherePosition#, #LenOfWhere# )>
	
	<cfset EventDate = #ParseDateTime(When)#>
	
	<cfif DateCompare("#EventDate#", "#now()#" ) EQ -1>
				<!--- date has passed --->
	<cfelse>
				<fieldset class="fs" STYLE="padding: 5px;">
				<legend ALIGN="center" CLASS="smallcaps">#DateFormat(EventDate,'dddd mmmm d yyyy')# </legend>
				<span CLASS="vignette"><STRONG><FONT COLOR="#FFFF80"><a href="#XMLContent.feed.entry[idx].link[1].XmlAttributes["href"]#" target="_blank">#XMLContent.feed.entry[idx].title.xmlText#</a>
				<br>Place : #where#<br>
				Time: #TimeFormat(EventDate,'hh:mm tt')#<br>
				[ Directions ]
				</FONT></STRONG><br></span>
				</fieldset>
	</cfif>

</cfloop>

 </cfoutput>

 <fieldset class="fs" STYLE="padding: 5px;">
<legend ALIGN="center" CLASS="smallcaps">Tuesday June 12th, 2007</legend>
<span CLASS="vignette"><STRONG><FONT COLOR="#FFFF80">SUBLIME  DEGREE OF MASTER MASON</FONT></STRONG><br></span>

</fieldset>
 
 
 
<!--- <cfdump var="#XMLContent#" expand="no" > --->
