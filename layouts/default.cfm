<!--- Drives the page to the requested content include --->
<cfinclude template="main/pageDriver.cfm">

<!DOCTYPE html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

	<head>
		<meta charset="utf-8" />
		<!--- <meta name="viewport" content="width=device-width" />--->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="keywords" content="Freemasonry,Central New Jersey Freemasons,Philo,Philo Lodge,active lodge, active lodge central NJ,growing lodge">
		<meta name="description" content="A very active and vibrant lodge located in central New Jersey">
		<link rel="stylesheet" href="/assets/stylesheets/foundation.min.css" />
		<link rel="stylesheet" href="/assets/stylesheets/general_foundicons.css">
		<link rel="stylesheet" href="/assets/stylesheets/app.css" /><!---  local modifications --->
		<!--- <link rel="stylesheet" href="stylesheets/social_foundicons.css">
		<link rel="stylesheet" href="stylesheets/general_enclosed_foundicons.css">--->
		<title><CFOUTPUT>#pageTitle# - Philo Lodge No. 243 Free and Accepted Masons,South River N.J. USA</CFOUTPUT></title>
		<!--- Custom Modernizr for Foundation --->
		<script src="/assets/javascripts/modernizr.foundation.js"></script>

		<!--- Included JS Files (Minified) --->
		<script src="/assets/javascripts/foundation.min.js"></script>
		<script src="/assets/javascripts/app.js"></script>
	</head>
<body>

	<cfinclude template="main/keyMessageLoaderMobile.cfm">

	<!-- Header and Nav -->
	<cfoutput>#view('nav/main-nav')#</cfoutput>
	<!-- End Header and Nav -->

	<div class="row">
		<div id="defaultSideBar" class="three columns hide-for-small">
			<cfoutput>#view('nav/left-side-nav')#</cfoutput>
		</div>

		<div class="nine columns mobile-four panel">
			<!--- <div class="nine columns push-three panel"> ---> <!-- Main Content Section -->
			 <!-- This has been source ordered to come first in the markup (and on small devices) but to be to the right of the nav on larger screens -->
				<cfoutput>#body#</cfoutput>
			 <cfoutput>#content#</cfoutput><!--- Content set by pageDriver.cfm --->
			</div>
	</div>

		<!--- Footer --->
		<footer class="row">
			<div class="three columns" style="text-align:center;"></div>
			<div class="nine columns" style="text-align:center;">
				<p>&copy; Philo Lodge No. 243 &nbsp;Free &amp; Accepted Masons, South River, N.J. USA 08882 - (732) 254-9867 (Tel.)  <i class="general foundicon-phone"></i></p>
			</div>
		</footer>

	<cfinclude template="main/orbitInclude.cfm"><!--- Include the Orbit Scripts --->
	<cfinclude template="main/modalForm.cfm"><!---  Include the Reveal Modal DIV --->







 	<!--- allows multiple onload events --->
 	<script src="javascripts/addLoadEvent.js"></script>
	<!--- jQuery and jQuery UI --->
	<!--- <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>--->
  	<!--- <script type='text/javascript' src='javascripts/jquery-ui.js'></script>--->



	</body>
</html>

<cfif rc.debugSession eq 1>
	<cfoutput>#view('tests/debug/session')#</cfoutput>
</cfif>

<cfdump expand="false" var=#rc# label="##rc##">
<cfdump expand="false" var=#request#>
