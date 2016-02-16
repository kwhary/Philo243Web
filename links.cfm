<cfscript>
  URLToPull  = "http://www.freemasons-freemasonry.com/freemasonry_rss.xml";
</cfscript>

<!--- The next step is to actually do a CFHTTP to the location you specified, this is how you get the values of the XML/RSS from the site you want (in this case, the 5 most viewed EasyCFM.Com Tutorials): --->

<cfhttp url="#URLToPull#" method="GET" timeout="15"></cfhttp>

<cfscript>
 // XMLContent = trim(cfhttp.filecontent);
  XMLContent = XmlParse(REReplace( cfhttp.filecontent, "^[^<]*", "", "all" ));  // remove Byte order mark
//  XMLContent = XMLParse(XMLContent);
</cfscript>

<!---<cfdump var="#XMLContent#" expand="no" >
<cfexit>--->

<ul class="accordion">
	<li class="active">
	    <div class="title">
			<cfoutput>
			<H5>Masonic <img src="images/rss_icon.png" alt="rss icon"> News Feeds provided by <a  target="_blank" href="#XMLContent.rss.channel.image.link.xmlText#">#XMLContent.rss.channel.title.xmlText#</a></H5>
			</cfoutput>
	    </div>
	    <div class="content">
			<cfoutput>
			 <ul class="square">
				<cfif #ArrayLen(XMLContent.rss.channel.item)# GTE 10>
					<cfset MaxFeeds = 10>
				<cfelse>
					<cfset MaxFeeds = #ArrayLen(XMLContent.rss.channel.item)#>
				</cfif>
				<cfloop from="1" to="#MaxFeeds#" index="idx">
					<li><a href="#XMLContent.rss.channel.item[idx].link.xmlText#" target="_blank">#XMLContent.rss.channel.item[idx].title.xmlText#</a>
					 - <span>[ As of: #DateFormat("#parseDateTime('#XMLContent.rss.channel.item[idx].pubDate.xmlText#')#","mm-dd-yyyy")# ]</span>
					 </li>	
				</cfloop>
			</ul>
			 </cfoutput>	
	    </div>
	</li>
	<li> 
		<div class="title">
		  <h5>Important New Jersey Links</h5>
		</div>
		<div class="content">
				<ul class="square">
					<li><A HREF="default.cfm?pageType=o" target="_blank">Lodges of the 12th and 10th Masonic Districts</A></li>
					<li><A HREF="http://www.newjerseygrandlodge.org/" target="_blank">Grand Lodge of New Jersey</a></li>
					<li><A HREF="http://www.glofnj.blogspot.com/" target="_blank">Grand Lodge of New Jersey BLOG</a></li>
					<li><A HREF="http://www.njmasonic.org/" target="_blank">Masonic Charity Foundation of New Jersey</a></li>
					<li><A HREF="http://www.njdistrict12.com" target="_blank">12th Masonic District Website</a></li>
					<li><A HREF="http://www.gwmemorial.org/" target="_blank">George Washington Masonic Memorial</a></li>
				</ul>
		</div>
	</li>
	<li>
		<div class="title">
		  <h5>Freemasonic Buzz</h5>
		</div>
		<div class="content">
			<ul class="square">
			    <li><a href="http://www.thefreemasonmovie.com/">The Freemason (the Movie) - 2015</a></li>
				<li><a href="http://www.latimes.com/features/lifestyle/la-ig-masons18-2008may18,0,562412.story" target="_blank">Millenium Masons [article in LA Times ]</a></li>
			</ul>			
		</div>
	</li>
	<li>
		<div class="title">
		  <h5>Exemplary Masonic Websites</h5>
		</div>
		<div class="content">
			<ul class="square">
				<li><a href="http://www.calodges.org/no846/index.html" target="_blank">Lux Lodge No.846, California</a><br>Check out the "Terms of Reference" section.  Nice requirements !</li>
				<li><a href="http://www.askafreemason.org/" target="_blank">Ask a Freemason</a></li>
				<li><a href="http://www.initiatedeye.com" target="_blank">Initiated Eye</a></li>
				<li><a href="http://grandlodge.on.ca/index.htm" target="_blank">Grand Lodge A.F.& A.M. of Ontario, Canada </a></li>
				<li><a href="http://freemasonry.bcy.ca/	" target="_blank">Grand Lodge of British Columbia and Yukon</a></li>
				<li><a href="http://avenue.org/wsl/" target="_blank">Widow's Son Lodge No. 60, Charolettesville, Virginia (USA)</a></li>
				<li><a href="http://www.buckspgl.org/" target="_blank">Provincial Grand Lodge of Buckinghamshire (Scotland)</a></li>
			</ul>
			
		</div>
	</li>
	<li>
		<div class="title">
		  <h5>Masonic Blogs and Online Magazines</h5>
		</div>
		<div class="content">
			<ul class="square">
				<li><a href="http://www.thesanctumsanctorum.com/" target="_blank">Sanctum Sanctorum</a></li>
				<li><a href="http://www.masonicink.com/" target="_blank">Masonic Ink (Tattoos)</a></li>
				<li><a href="http://www.askafreemason.org/" target="_blank">Ask a Freemason</a></li>
				<li><a href="http://thefreemason.blogspot.com/" target="_blank">The Freemason Chronicles</a></li>
				<li><a href="http://burningtaper.blogspot.com" target="_blank">The Burning Taper Blog</a></li>
				<li><a href="http://www.freemasoninformation.com/" target="_blank">Freemason Information</a></li>
				<li><a href="http://masonictraveler.blogspot.com" target="_blank">The Masonic Traveler Blog</a></li>
				<li><a href="http://arsmasonica.blogspot.com" target="_blank">The Arts of Freemasonry Blog</a></li>
				<li><a href="http://www.twtmag.com" target="_blank">The Working Tools Magazine </a></li>
				<li><a href="http://www.freemasonry.fm/" target="_blank">Everything Freemason </a></li>
				<li><a href="http://www.freemasoncollection.com/FMCX_Site/WebPagesUS/Home.htm" target="_blank">Freemason Collection (prints, art, ritual, etc.) </a></li>
			</ul>
		</div>
	</li>	

	<li>
		<div class="title">
		  <h5>Masonic Research and Education</h5>
		</div>
		<div class="content">
			<ul class="square">
				<li><a href="http://www.co-masonry.org/" target="_blank">Freemasonry for Men & Women</a></li>
				<li><a href="http://www.sacred-texts.com/mas/index.htm" target="_blank">Internet Sacred Text Archive</a></li>
				<li><a href="http://themasonicsociety.com/ " target="_blank">Masonic Society</a></li>
				<li><a href="http://www.mmrl.edu/" target="_blank">Masonic Medical Research Laboratory</a></li>
				<li><a href="http://www.brad.ac.uk/webofhiram/" target="_blank">The Web of Hiram - (Univ. of Bradford Electronic Database [nice] )</a></li>
				<li><a href="http://www.freemasons-freemasonry.com/preston_illustrations_masonry.html" target="_blank">Illustrations of Freemasonry (online book)</a></li>
				<li><a href="http://www.phoenixmasonry.org" target="_blank">Pheonix Freemasonry</a></li>
				<li><a href="http://www.levity.com/alchemy/index.html" target="_blank">The Alchemy Web Site</a></li>
			</ul>
			
		</div>
	</li>

</ul><!--- ul class - accordian --->

