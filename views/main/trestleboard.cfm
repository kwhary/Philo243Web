<!--- Check to make sure that the user was verified --->
<cfparam name="session.loggedin" default="false" />

<cfif session.loggedin EQ "false">
		<!--- Force a login --->
		<script type="text/javascript">
			$(document).ready(function() {
				$('#loginModal').reveal({  
			     animation: 'fadeAndPop', //fade, fadeAndPop, none  
			     animationspeed: 300, //how fast animations are  
			     closeOnBackgroundClick: true, //if you click background will modal close?  
			     dismissModalClass: 'close-reveal-modal' //the class of a button or element that will close an open modal 
				});  
			});
		</script>
		
	<cfexit>
<cfelse>
	<cfoutput><i class="foundicon-unlock"></i></cfoutput>
	<h5>Philo Lodge No. 243 Trestleboards</h5>
	<HR WIDTH="100%"><BR>	
	
</cfif>  


<!--- <cfset docDir="c:\ColdFusion8\wwwroot\NewWeb\documents\trestleboards"> --->
<!--- <cfset docDir="D:\Inetpub\Customers\viuxhosting\philolodge\philolodge.net\www\documents\trestleboards"> --->
<!--- <cfset docDir="C:\Inetpub\vhosts\philolodge.net\httpdocs\documents\trestleboards"> --->
<cfset docDir="D:\home\philolodge.net\wwwroot\documents\trestleboards">

<cfdirectory name="docs" ACTION="list" DIRECTORY="#docDir#" sort="name desc"><!--- get the years directories  --->
<hr class="center">
<br/>
<h5>Current Trestleboard</h5>

<!--- 1028736/7702863 1028736/10713316 --->
<!--- style="width: 569px; height: 400px;" --->

<div data-configid="1028736/32462522"  class="mobile-four issuuembed" style="height: 200px;"></div>
<script type="text/javascript" src="//e.issuu.com/embed.js" async="true"></script>
<!--- 
<div>
	<object style="width:700px;height:492px" >
	<param name="movie" value="http://static.issuu.com/webembed/viewers/style1/v1/IssuuViewer.swf?mode=embed&amp;layout=http%3A%2F%2Fskin.issuu.com%2Fv%2Fcolor%2Flayout.xml&amp;backgroundColor=383838&amp;showFlipBtn=true&amp;
	documentId=130501190028-795eac9b952d436c8758ffe0d054aa58&amp;docName=may2013&amp;username=kwhary&amp;loadingInfoText=May-June%202013%20Trestleboard&amp;et=1298733643016&amp;er=4" />
	<param name="allowfullscreen" value="true"/>
	<param name="menu" value="false"/>
	<embed src="http://static.issuu.com/webembed/viewers/style1/v1/IssuuViewer.swf" type="application/x-shockwave-flash" allowfullscreen="true" menu="false" style="width:700px;height:492px" flashvars="mode=embed&amp;viewMode=presentation&amp;layout=http%3A%2F%2Fskin.issuu.com%2Fv%2Fcolor%2Flayout.xml&amp;backgroundColor=383838&amp;showFlipBtn=true&amp;documentId=130501190028-795eac9b952d436c8758ffe0d054aa58&amp;docName=may2013&amp;username=kwhary&amp;loadingInfoText=May-June%202013%20Trestleboard&amp;et=1298733643016&amp;er=4" />
	</object>
</div>
---->

<!--- 
<object style="width:569px;height:400px" >
<param name="movie" value="http://static.issuu.com/webembed/viewers/style1/v1/IssuuViewer.swf?mode=embed&amp;viewMode=presentation&amp;layout=http%3A%2F%2Fskin.issuu.com%2Fv%2Fcolor%2Flayout.xml&amp;backgroundColor=383838&amp;showFlipBtn=true&amp;
documentId=XXXXXXXXXXXXXXXXXXXXXXXXXXX" />
<param name="allowfullscreen" value="true"/>
<param name="menu" value="false"/>
<embed src="http://static.issuu.com/webembed/viewers/style1/v1/IssuuViewer.swf" type="application/x-shockwave-flash" allowfullscreen="true" menu="false" style="width:569px;height:400px" flashvars="mode=embed&amp;viewMode=presentation&amp;layout=http%3A%2F%2Fskin.issuu.com%2Fv%2Fcolor%2Flayout.xml&amp;backgroundColor=383838&amp;showFlipBtn=true&amp;
documentId=XXXXXXXXXXXXXXXXXXXXXXXXXX" />
</object>

--->
<center><A HREF="http://www.adobe.com/products/acrobat/readstep2.html">(Adobe Reader required)</A></center><br />

<!--- <cfloop from="1" to ="#docs.recordcount#" index="y"> --->
<h5>Trestleboards by Year</h5>

<ul class="accordion">
	<cfloop from="1" to ="2" index="y"><!--- Show Two years worth --->
	  <cfif y EQ 1>
	  <li class="active"><!--- Make the first year the open accordion --->
	  <cfelse>
	  <li>
	  </cfif>
	    <div class="title">
	      <h5 class="trestleboard"><CFOUTPUT>#docs.name[y]#</CFOUTPUT></h5><!--- YEAR --->
	    </div>
	    <cfdirectory name="tbs" ACTION="list" DIRECTORY="#docDir#\#docs.name[y]#" sort="datelastmodified desc"><!--- get the files in each year --->
	    <div class="content">
	    	<ul class="square">
	    		<cfloop from="1" to ="#tbs.recordcount#" index="f">
	     			 <li><a HREF="<CFOUTPUT>documents/trestleboards/#docs.name[y]#/#tbs.name[f]#</cfoutput>#page=2?TB_iframe=true&height=525&width=800"><CFOUTPUT>#tbs.name[f]#</CFOUTPUT></a></li>
	    		</cfloop>
	    	</ul>
	    </div>
	  </li>
	</cfloop>
</ul>
<!--- GetDirectoryFromPath(GetTemplatePath()) --->
  	<!--- <li><a HREF="documents/trestleboards/2006/Jan2005.pdf#page=2">#tbs.name[t]#</a></li> --->


