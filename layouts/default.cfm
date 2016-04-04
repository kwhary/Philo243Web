<cfscript>
    if (rc.action eq 'main.default') {
        rc.showNav = 0;
        rc.columnClass = 'twelve';
    } else {
        rc.showNav = 1;
        rc.columnClass = 'nine';
    }
</cfscript>

<cfoutput><!DOCTYPE html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="Freemasonry,Central New Jersey Freemasons,Philo,Philo Lodge,active lodge, active lodge central NJ,growing lodge">
        <meta name="description" content="A very active and vibrant lodge located in central New Jersey">
        <link rel="stylesheet" href="/assets/stylesheets/foundation.min.css" />
        <link rel="stylesheet" href="/assets/stylesheets/general_foundicons.css">
        <link rel="stylesheet" href="/assets/stylesheets/app.css" /><!---  local modifications --->
        <title>#rc.page.title# - #application.pageSuffix#</title>

        <!--- Custom Modernizr for Foundation --->
        <script src="/assets/javascripts/modernizr.foundation.js"></script>

        <!--- Included JS Files (Minified) --->
        <script src="/assets/javascripts/foundation.min.js"></script>
        <script src="/assets/javascripts/app.js"></script>
    </head>
    <body>
    </cfoutput>

        <cfif rc.action eq 'main.default'>
            <cfinclude template="main/keyMessageLoaderMobile.cfm">
            <cfoutput>#view('main/key-messages')#</cfoutput>
        </cfif>

        <cfoutput>
        <!-- Header and Nav -->
        #view('nav/main-nav')#
        <!-- End Header and Nav -->

        <div class="row">
            <cfif rc.showNav eq 1>
                <div id="defaultSideBar" class="three columns hide-for-small">
                    #view('nav/left-side-nav')#
                </div>
            </cfif>

            <div class="#rc.columnClass# columns mobile-four panel">
                <!--- NOTE: This is where the real content is rendered... --->
                #body#
                </div>
        </div>

            <!--- Footer --->
            <footer class="row">
                <div class="ten columns centered" style="text-align:center;">
                    <p>&copy; Philo Lodge No. 243 &nbsp;Free &amp; Accepted Masons, South River, N.J. USA 08882 - (732) 254-9867 (Tel.)  <i class="general foundicon-phone"></i></p>
                </div>
            </footer>
</cfoutput>

        <cfinclude template="main/modalForm.cfm"><!---  Include the Reveal Modal DIV --->

<cfoutput>
        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
        <script type="text/javascript">
            _uacct = "UA-2349423-1";
            urchinTracker();
        </script>
    </body>
</html>
</cfoutput>

<cfdump expand="false" var=#application#>
<cfdump expand="false" var=#request#>
<cfdump expand="false" var=#rc# label="##rc##">
