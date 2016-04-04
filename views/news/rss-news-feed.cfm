
<cfscript>
  URLToPull  = "http://www.freemasons-freemasonry.com/freemasonry_rss.xml";
</cfscript>

<!--- The next step is to actually do a CFHTTP to the location you specified, this is how you get the values of the XML/RSS from the site you want (in this case, the 5 most viewed EasyCFM.Com Tutorials): --->

<cfhttp url="#URLToPull#"
           method="GET"
           timeout="15">
</cfhttp>

<cfscript>
 // XMLContent = trim(cfhttp.filecontent);
  XMLContent = XmlParse(REReplace( cfhttp.filecontent, "^[^<]*", "", "all" ));  // remove Byte order mark
//  XMLContent = XMLParse(XMLContent);
</cfscript>

<!---<cfdump var="#XMLContent#" expand="no" >
<cfexit>--->

<!--- <cfoutput> --->
<!--- Now, let's actually output the information about the feed, in this case the site logo, title and description: --->

<!---     Feed provided by:<BR>
    <a href="#XMLContent.rss.channel.image.link.xmlText#">
       <img src="#XMLContent.rss.channel.image.url.xmlText#" alt="#XMLContent.rss.channel.image.title.xmlText#" border="0">
    </a><br>
    #XMLContent.rss.channel.title.xmlText#<BR>
    #XMLContent.rss.channel.description.xmlText#<BR><BR> --->
<!--- </cfoutput> --->

<!--- Now we will use the array value "XMLContent.rss.channel.item" which will let us know how many records we want to process and display: --->
<!--- <cfloop from="1" to="5" index="idx"> --->
<cfoutput>
<H3>Masonic <img src="images/rss_icon.png" alt="rss icon"> News Feeds  provided by <a  target="_blank" href="#XMLContent.rss.channel.image.link.xmlText#">#XMLContent.rss.channel.title.xmlText#</a></H3>
<HR width="100%">
<BR>
 <ul>
<cfif #ArrayLen(XMLContent.rss.channel.item)# GTE 10><cfset MaxFeeds = 10><cfelse><cfset MaxFeeds = #ArrayLen(XMLContent.rss.channel.item)#></cfif>
<cfloop from="1" to="#MaxFeeds#" index="idx">

	<li><a href="#XMLContent.rss.channel.item[idx].link.xmlText#" target="_blank">#XMLContent.rss.channel.item[idx].title.xmlText#</a>
	 - <span class="smallcaps"">[ #DateFormat("#parseDateTime('#XMLContent.rss.channel.item[idx].pubDate.xmlText#')#","mm-dd-yyyy")# ]</span>
	 </li>

<!---  <BR>
 #ParagraphFormat(ReplaceNoCase(XMLContent.rss.channel.item[idx].description.xmlText, "&lt;", "<", "ALL"))# --->
<!---  Author: #XMLContent.rss.channel.item[idx].author.xmlText#<BR> --->
<!---  Date: #XMLContent.rss.channel.item[idx].pubDate.xmlText# --->

</cfloop>

</ul>
<BR>
 </cfoutput>
<!--- Last, let's display the actual copyright notice that the feed itself returns: --->

<!--- <cfoutput><div align="center">#XMLContent.rss.channel.copyright.xmlText#</div></cfoutput> ---> 
