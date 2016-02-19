<cfif isdefined("url.pageType")><cfelse><cfset #url.pagetype# = 0></cfif>
<cfif isdefined("url.profile")><cfelse><cfset #url.profile# = 1></cfif>

<cfif NOT isDefined("url.pageType")><cfset url.pageType = "default"></cfif>
<cfswitch expression="#url.pageType#"><!--- Page Driver --->

	<cfcase value="a"><!--- about --->
		<cfset pageTitle = "About">
		<cfsavecontent variable="content">
			<cfinclude template="about.cfm">
		</cfsavecontent>	
	</cfcase>
	<cfcase value="b"><!--- by-laws --->
		<cfset pageTitle = "By-Laws">
		<cfsavecontent variable="content">
			<cfinclude template="by-laws.cfm">
		</cfsavecontent>	
	</cfcase>	
	<cfcase value="bd"><!--- masonic birthdays --->
		<cfset pageTitle = "Masonic Birthdays">
		<cfsavecontent variable="content">
			<cfinclude template="ShowBirthday.cfm">
		</cfsavecontent>	
	</cfcase>		
	<cfcase value="because"><!--- I am a Freemason becuase.. --->
		<cfset pageTitle = "Freemason because">
		<cfsavecontent variable="content">
			<cfinclude template="because.cfm">
		</cfsavecontent>	
	</cfcase>		
	<cfcase value="lb"><!--- Level club by-laws --->
		<cfset pageTitle = "Level Club By-Laws">
		<cfsavecontent variable="content">
			<cfinclude template="lvl-club-by-laws.cfm">
		</cfsavecontent>	
	</cfcase>	
	<cfcase value="lc"><!--- Level club constitution --->
		<cfset pageTitle = "Level Club Constitution">
		<cfsavecontent variable="content">
			<cfinclude template="lvl-club-constitution.cfm">
		</cfsavecontent>	
	</cfcase>	
	<cfcase value="find"><!--- find a member --->
		<cfset pageTitle = "Find Member">
		<cfsavecontent variable="content">
			<cfinclude template="findMember.cfm">
		</cfsavecontent>	
	</cfcase>	
	
	<cfcase value="login"><!--- login page --->
		<cfset pageTitle = "Login">
		<cfsavecontent variable="content">
			<cfinclude template="private/login.cfm">
		</cfsavecontent>	
	</cfcase>	

	<cfcase value="h"><!--- history --->
		<cfset pageTitle = "History">
		<cfsavecontent variable="content">
			<cfinclude template="history.cfm">
		</cfsavecontent>	
	</cfcase>
	
	<cfcase value="l"><!--- links --->
		<cfset pageTitle = "Links">
		<cfsavecontent variable="content">
			<cfinclude template="links.cfm">
		</cfsavecontent>		
	</cfcase>	
	
	<cfcase value="m"><!--- memberservices --->
		<cfset pageTitle = "Member Services">
		<cfsavecontent variable="content">
			<cfinclude template="memberServices.cfm">
		</cfsavecontent>		
	</cfcase>
	
	<cfcase value="min"><!--- minutes --->
		<cfset pageTitle = "Minutes">
		<cfsavecontent variable="content">
			<cfinclude template="minutes.cfm">
		</cfsavecontent>		
	</cfcase>
	
	<cfcase value="o"><!--- other lodges --->
		<cfset pageTitle = "Other Lodges">
		<cfsavecontent variable="content">
			<cfinclude template="lodges.cfm">
		</cfsavecontent>	
	</cfcase>	
	
	<cfcase value="p"><!--- profiles --->
		<cfset pageTitle = "Profiles">
		<cfsavecontent variable="content">
			<cfinclude template="profile_#url.profile#.cfm">
		</cfsavecontent>	
	</cfcase>
	
	<cfcase value="pi"><!--- profiles index--->
		<cfset pageTitle = "Profile Index">
		<cfsavecontent variable="content">
			<cfinclude template="profile-index.cfm">
		</cfsavecontent>	
	</cfcase>	
	
	<cfcase value="ph"><!--- photo gallery --->
		<cfset pageTitle = "Photo Gallery">
		<cfsavecontent variable="content">
			<cfinclude template="photo-gallery.cfm">
		</cfsavecontent>	
	</cfcase>

	<cfcase value="r"><!--- reports --->
		<cfset pageTitle = "Reports">
		<cfsavecontent variable="content">
			<cfinclude template="reports.cfm">
		</cfsavecontent>	
	</cfcase>
	
	<cfcase value="reasons"><!--- reasons to join --->
		<cfset pageTitle = "Reasons to Join">
		<cfsavecontent variable="content">
			<cfinclude template="reasons.cfm">
		</cfsavecontent>	
	</cfcase>	
	
	<cfcase value="religion"><!--- freemasonry and religion --->
		<cfset pageTitle = "Freemasonry and Religion">
		<cfsavecontent variable="content">
			<cfinclude template="religion.cfm">
		</cfsavecontent>	
	</cfcase>	
	
	<cfcase value="t"><!--- trestleboard --->
		<cfset pageTitle = "Trestleboards">
		<cfsavecontent variable="content">
			<cfinclude template="trestleboard.cfm">
		</cfsavecontent>	
	</cfcase>

	<cfcase value="RSVP"><!--- Sign Up--->
		<cfset pageTitle = "RSVP">
		<cfsavecontent variable="content">
			<cfinclude template="RSVP.cfm">
		</cfsavecontent>	
	</cfcase>
	
	<cfcase value="u"><!--- update info --->
		<cfset pageTitle = "Update Info">
		<cfsavecontent variable="content">
			<cfinclude template="updateMember.cfm">
		</cfsavecontent>	
	</cfcase>
	
	<cfcase value="table"><!--- Table Lodge --->
		<cfset pageTitle = "Synopsis - Knight to Remember III - Medieval Table Lodge">
		<cfsavecontent variable="content">
			<cfinclude template="KTRIII.cfm">
		</cfsavecontent>	
	</cfcase>
	<cfcase value="exError"><!--- exception Error --->
		<cfset pageTitle = "Exception Error">
		<cfsavecontent variable="content">
			<cfinclude template="errorException.cfm">
		</cfsavecontent>	
	</cfcase>
	<cfcase value="siteWideError"><!--- Request Error --->
		<cfset pageTitle = "Severe Error">
		<cfsavecontent variable="content">
			<cfinclude template="errorRequest.cfm">
		</cfsavecontent>	
	</cfcase>	
	
	<cfdefaultcase><!--- default --->
		<cfset pageTitle = "Default">
		<cfsavecontent variable="content">
			<P>Nothing here yet</P>
		</cfsavecontent>	
	</cfdefaultcase>

</cfswitch>