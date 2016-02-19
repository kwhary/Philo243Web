




<cfoutput>
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>
<script type='text/javascript' src='https://code.jquery.com/ui/1.11.4/jquery-ui.js'></script>
</cfoutput>

	<cfset result = "">
	<cfset data = "">

	<cfhttp url="https://apis.google.com/js/client.js" method="post" result="authResult">

		<cfhttpparam name="X-HTTP-Method-Override" value="GET" type="header">
		<cfhttpparam name="client_id" type="formfield"  value="991711430336-9jeg4n3a2uklrj2664unn0amisdckakj.apps.googleusercontent.com">
		<cfhttpparam name="scope"  type="url"  value="https://www.googleapis.com/auth/calendar.readonly">
		<cfhttpparam name="immediate" type="formfield" value="true">

	</cfhttp>

<cfdump var="#authResult.fileContent#">










<!----
	<cfif isDefined(deAuth.error)>
		<!--- error --->
	<cfelse>
--->


<!---- 
	</cfif>
	<!---deserialize the result; the UTF-8 is required to handle extended character sets--->
	<cfset deData = deserializeJSON(authResult.fileContent.toString("UTF-8"))>
	<!---here we take our translation and concatenate it to the full set of translations--->
	<cfset translatedOutput = deData.data.translations[1].translatedText>
	<!---return the full translation --->
	
<cfreturn translatedOutput>
---->

