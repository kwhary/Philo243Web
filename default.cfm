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
	<link rel="stylesheet" href="stylesheets/foundation.css" />
	<link rel="stylesheet" href="stylesheets/foundation.min.css" />
	<link rel="stylesheet" href="stylesheets/app.css" /><!---  local modifications --->
	<link rel="stylesheet" href="stylesheets/general_foundicons.css">
	<!--- <link rel="stylesheet" href="stylesheets/social_foundicons.css">
	<link rel="stylesheet" href="stylesheets/general_enclosed_foundicons.css">--->

<cfscript>

	function rotate_Quote() {
		quoteArray = ArrayNew(1);
		quoteArray[1] = "four score and seven years ago";
		quoteArray[2] = "this is cool";
		quoteArray[3] = "this is way too easy";
		quoteArray[4] = "nice";
		
		q = RandRange(1, ArrayLen(quoteArray));

		return quoteArray[q];
	}
	
	function rotate_Info() {
		infoArray = ArrayNew(1);
		infoArray[1] = "<h5 class='sideBarFader'>HISTORY FACT</h5>Philo Lodge was consituted in 1923<br /><br />";
		infoArray[2] = "<h5 class='sideBarFader'>HISTORY FACT</h5>Annual Roll Call dinners <br/>were instituted in 1932 !<br /><br />";
		infoArray[3] = "<h5 class='sideBarFader'>HISTORY FACT</h5>Philo Lodge was granted it's <br>warrant at the 136th Annual Communication<br>of Grand Lodge,  April 18, 1923.<br /><br />";
		infoArray[4] = "<h5 class='sideBarFader'>PHILO FACT</h5>The word '<em>philo</em>' is the <br>Greek word for '<em>love</em>'.<br /><br />";
		infoArray[5] = "<h5 class='sideBarFader'>HISTORY FACT</h5>The cornerstone for our building was laid in 1958.<br /><br />";
		infoArray[6] = "<h5 class='sideBarFader'>HISTORY FACT</h5>WB James Drumright served as Secretary of the Lodge<br> for 43 years.<br /><br />";
		infoArray[7] = "<h5 class='sideBarFader'>WEBSITE FACT</h5>Our website has been online <br>and available continuously <br>since 1997.<br /><br />";
		
		i = RandRange(1, ArrayLen(infoArray));

		return infoArray[i];
	}	
	
	function formatPhoneNumber(phone_number) {
	
		if (Len(phone_number) neq 0 ) {
			if (Len(phone_number) eq 10) {
					formattedPhoneNumber = '(' & #MID(phone_number,1,3)# & ') ' & #MID(phone_number,4,3)# & ' - ' & #MID(phone_number,7,4)#;
				}
					else if (len(phone_number) eq 7) {
						formattedPhoneNumber = #MID(phone_number,1,3)# & ' - ' & #MID(phone_number,4,4)#;
				}
		else {
			formattedPhoneNumber = 'Phone ## not found';
		}
		
		return formattedPhoneNumber;
		}
	}
	
	
	function FormatZip(zip_code){
	
		if (Len(zip_code) neq 0) {
			if (len(zip_code) EQ 9) {
				formattedZip = #MID(zip_code,1,5)# & '-' & #MID(zip_code,6,4)#;
			}
			else {
			formattedZip = zip_code;
			}
		}
		else {
		formattedZip = '0000';
		}
		return formattedZip;
	}
</cfscript>

 	<!--- Drives the page to the requested content include --->
	 <cfinclude template="pageDriver.cfm">	
	 
	 <title><CFOUTPUT>#pageTitle# - Philo Lodge No. 243 Free and Accepted Masons,South River N.J. USA</CFOUTPUT></title>

	<!--- Custom Modernizr for Foundation --->
	<script src="javascripts/modernizr.foundation.js"></script>
	
	<!--- Included JS Files (Minified) --->  
	<script src="javascripts/foundation.min.js"></script>
	<script src="javascripts/app.js"></script>



</head>
<body>
	
	<cfinclude template="keyMessageLoaderMobile.cfm">
	<!-- Header and Nav -->
	<div class="row"><!--- Header and Nav --->
		<div class="twelve columns mobile-four">
			<ul class="nav-bar middle"><!---  data-magellan-expedition="fixed" --->
				<cfinclude template="mainNav.cfm">
			</ul>
		</div>
	</div>
 	<!-- End Header and Nav -->
  
	<div class="row">
	
		<div id="defaultSideBar" class="three columns hide-for-small">
			<cfinclude template="defaultSideLoader.cfm">
		</div>	
	    
		<div class="nine columns mobile-four panel">
	    <!--- <div class="nine columns push-three panel"> ---> <!-- Main Content Section -->
	     <!-- This has been source ordered to come first in the markup (and on small devices) but to be to the right of the nav on larger screens -->     
	      
	     <cfoutput>#content#</cfoutput><!--- Content set by pageDriver.cfm --->  
	    </div>	    
	

		
	</div>    
  <!-- Footer -->
  <cfinclude template="footer.cfm">
 
  <cfinclude template="orbitInclude.cfm"><!--- Include the Orbit Scripts --->  

  <cfinclude template="modalForm.cfm"><!---  Include the Reveal Modal DIV --->
  	
  </body>
</html>
