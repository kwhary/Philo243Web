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
	<link rel="stylesheet" href="/assets/stylesheets/app.css" /><!---  local modifications --->
	<link rel="stylesheet" href="/assets/stylesheets/general_foundicons.css">
	<!--- <link rel="stylesheet" href="stylesheets/social_foundicons.css">
	<link rel="stylesheet" href="stylesheets/general_enclosed_foundicons.css">--->

 	<!--- Drives the page to the requested content include --->
	 <cfinclude template="../pageDriver.cfm">

	 <title><CFOUTPUT>#pageTitle# - Philo Lodge No. 243 Free and Accepted Masons,South River N.J. USA</CFOUTPUT></title>

	<!--- Custom Modernizr for Foundation --->
	<script src="/assets/javascripts/modernizr.foundation.js"></script>

	<!--- Included JS Files (Minified) --->
	<script src="/assets/javascripts/foundation.min.js"></script>
	<script src="/assets/javascripts/app.js"></script>
</head>
<body>

	<cfinclude template="../keyMessageLoaderMobile.cfm">

	<!-- Header and Nav -->
	<div class="row"><!--- Header and Nav --->
		<div class="twelve columns mobile-four">
			<ul class="nav-bar middle"><!---  data-magellan-expedition="fixed" --->

				<cfinclude template="../mainNav.cfm">

			</ul>
		</div>
	</div>
 	<!-- End Header and Nav -->

	<div class="row">

		<div id="defaultSideBar" class="three columns hide-for-small">

			<!--- <cfinclude template="defaultSideLoader.cfm"> --->

		</div>

		<div class="nine columns mobile-four panel">
	    <!--- <div class="nine columns push-three panel"> ---> <!-- Main Content Section -->
	     <!-- This has been source ordered to come first in the markup (and on small devices) but to be to the right of the nav on larger screens -->
	      <cfoutput>#body#</cfoutput>
	     <cfoutput>#content#</cfoutput><!--- Content set by pageDriver.cfm --->
	    </div>



	</div>
  <!-- Footer -->
  <cfinclude template="../footer.cfm">

  <cfinclude template="../orbitInclude.cfm"><!--- Include the Orbit Scripts --->

  <cfinclude template="../modalForm.cfm"><!---  Include the Reveal Modal DIV --->

  </body>
</html>

<cfdump expand="false" var=#request#>
