<!DOCTYPE html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<head>
  <LINK rel="SHORTCUT ICON" href="favicon.ico"><!--- This should be in the root directory --->
  <meta name="keywords" content="Freemasonry,Central New Jersey Freemasons,Philo,Philo Lodge,active lodge, active lodge central NJ,growing lodge">
  <meta name="description" content="A very active and vibrant lodge located in central New Jersey">
  <meta charset="utf-8" />
  <!--- Set the viewport width to device width for mobile --->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <title>Philo Lodge No. 243 Free and Accepted Masons,South River N.J. USA</title>
  
  <!--- Included CSS Files (Uncompressed) --->
  
  <link rel="stylesheet" href="stylesheets/foundation.css">
  
  
  <!--- Included CSS Files (Compressed) --->
  <!--- <link rel="stylesheet" href="stylesheets/foundation.min.css"> --->
  <link rel="stylesheet" href="stylesheets/app.css">
  <link rel="stylesheet" href="stylesheets/general_foundicons.css">
  <!--- <link rel="stylesheet" href="stylesheets/social_foundicons.css">
  <link rel="stylesheet" href="stylesheets/general_enclosed_foundicons.css">--->

  <script src="javascripts/modernizr.foundation.js"></script>

  <!--- Date Format function --->
  <script src="javascripts/date.format.js"></script>
  <!--- Set dates used by calendars --->
  <script src="javascripts/setDates.js"></script>

  <!--- <script src="javascripts/build.calendars.js"></script>--->
  
</head>
<body>
<!--- for Debugging --->
<!--- <cflock timeout=20 scope="Session" type="Exclusive">
	<cfset session.loggedin = false>
	<cfset Session.UserID ="">
	<cfset Session.FName ="">
	<cfset Session.LName ="">
	<cfset Session.MST ="">
	<cfset Session.Password =""> 	
</cflock>
--->	
	<!--- <cfoutput><cfdump var="#session#" expand="no"><cfdump var="#application#" expand="no"></cfoutput> --->
	
	<!--- The Orbit fader is initialized at the bottom of the page by calling .orbit() on #fader --->
	<cfinclude template="keyMessageLoader.cfm"> 
	
	<cfinclude template="quoteLoader.cfm">  
	
	<div class="row"><!--- Header and Nav --->
		<div class="twelve columns mobile-four">
			<ul class="nav-bar middle">
				<cfinclude template="mainNav.cfm">
			</ul>
		</div>
	</div>
	<!--- Three-up Content Blocks --->
	<cfinclude template="contentBlocks.cfm">
	
	<!--- Footer --->
	
	<cfinclude template="footer.cfm">
  
	<!--- Included JS Files (Compressed) --->
	<script src="javascripts/foundation.min.js"></script>
	<!--- Initialize JS Plugins --->
	<script src="javascripts/app.js"></script>	
	
	<!--- Javascripts for Orbit Image slider/fader --->
	<cfinclude template="orbitInclude.cfm">
	
	<cfinclude template="modalForm.cfm"><!---  Include the Reveal Modal DIV --->



 	<!--- allows multiple onload events --->
 	<script src="javascripts/addLoadEvent.js"></script>
	<!--- jQuery and jQuery UI --->
	<!--- <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>--->
  	<!--- <script type='text/javascript' src='javascripts/jquery-ui.js'></script>--->

  	
</body>
</html>