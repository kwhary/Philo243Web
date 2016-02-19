<!--- <cfinclude TEMPLATE="includes/CheckAuthority.cfm"> --->

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
	
	<h3>Reports</h3>
	<HR WIDTH="100%"><BR>	
	
</cfif>

<!--- <cfset docDir="c:\CFusionMX\wwwroot\NewWeb\documents\reports">  --->
<cfset docDir="D:\Inetpub\Customers\viuxhosting\philolodge\philolodge.net\www\documents\reports">

<cfdirectory name="docs" ACTION="list" DIRECTORY="#docDir#" sort="name asc"><!--- get the directories  --->

<hr class="center">

<h5><A HREF="http://www.adobe.com/products/acrobat/readstep2.html">(Adobe Reader required)</A></h5>

<cfloop from="1" to ="#docs.recordcount#" index="y">
	
	<h4><CFOUTPUT>#docs.name[y]#</CFOUTPUT></h4>
	<hr class="center">
	<cfdirectory name="rpts" ACTION="list" DIRECTORY="#docDir#\#docs.name[y]#" sort="name ASC"><!--- get the files in each  --->
		<cfif #rpts.recordcount# EQ 0><UL><LI><CFOUTPUT>None available</CFOUTPUT></LI></UL></cfif>
	<cfloop from="1" to ="#rpts.recordcount#" index="f">	
		<ul>
			<li><a class="thickbox" HREF="<CFOUTPUT>documents/reports/#docs.name[y]#/#rpts.name[f]#</cfoutput>?TB_iframe=true&height=700&width=800"><CFOUTPUT>#rpts.name[f]#</CFOUTPUT></a></li>
		</ul>	
		
	</cfloop>
	<br/>
</cfloop>

<br/>




