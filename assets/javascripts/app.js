;
(function($, window, undefined) {
    'use strict';
    var $doc = $(document),
        Modernizr = window.Modernizr;

    //theclickedURL = document.getElementById("memberServices").getAttribute("href");
    // var pageType = getURLParameter(theclickedURL, 'pageType');
    //alert('pageType=' + pageType);

    // function saveURLParameter() {
    //var url = ($(this).attr('href'));
    //      var pageType = getURLParameter(url, 'pageType');
    //      alert(url);
    //    };
    //    function getURLParameter(url, name) {
    //      return (RegExp(name + '=' + '(.+?)(&|$)').exec(url)||[,null])[1];
    //  }

    // alert(document.getElementById("myNav").getAttribute("href"));

    var subCount = 0;

    $(document).ready(function() {
        $.fn.foundationAlerts ? $doc.foundationAlerts() : null;
        $.fn.foundationButtons ? $doc.foundationButtons() : null;
        $.fn.foundationAccordion ? $doc.foundationAccordion() : null;
        $.fn.foundationNavigation ? $doc.foundationNavigation() : null;
        $.fn.foundationTopBar ? $doc.foundationTopBar() : null;
        $.fn.foundationCustomForms ? $doc.foundationCustomForms() : null;
        $.fn.foundationMediaQueryViewer ? $doc.foundationMediaQueryViewer() : null;
        $.fn.foundationTabs ? $doc.foundationTabs({
            callback: $.foundation.customForms.appendCustomMarkup
        }) : null;
        $.fn.foundationTooltips ? $doc.foundationTooltips() : null;
        $.fn.foundationMagellan ? $doc.foundationMagellan() : null;
        $.fn.foundationClearing ? $doc.foundationClearing() : null;
        $.fn.placeholder ? $('input, textarea').placeholder() : null;

        $("a").click(function(event) {
            targetClass = $(this).attr("class");
            //alert('ID=' + event.target.id);
            //alert('class=' + $(this).attr("class"));
            //alert('href=' + event.target.href);
            //alert('thePageName=' + $("." + targetClass).attr("href"));
            theRequestedPage = $("." + targetClass).attr("href");

        });

        //$("#memberServices").click(function() {  // this works with ID
        // alert('memberservices is clicked');
        // return true;
        //});

       // $(".mServices").click(function () {  // this works with class
       //   var value = $(".mServices").attr("href");
       // alert('pageName=' + value );
        //});


        // Attach a submit handler to the form
        $( "#logInFormID" ).submit(function( event ) {

            event.preventDefault();  // Stop form from submitting normally

            //var href = $(this).attr('href');

            //var pageType = location.search.split('pageType=')[1];
            //alert(pageType);

            var $form = $( this ),  // Get some values from elements on the page:
                //theRequestedPage = $("." + targetClass).attr("href");
                theID = $form.find( "input[name='UserID']" ).val(),
                thePass = $form.find( "input[name='password']" ).val(),

                //url = $form.attr( "action" );  //This will pull the URL from the form action (nice)
                url = 'private/login.cfc?method=getData&UserId='+theID+'&password='+thePass;

            // post the form data
            var posting = $.post( url );
            // Put the results in a div
            posting.done(function( data ) { //succssful post

                subCount++;  // count how many times submitted
                processReturn(JSON.parse(data));  // Process the returned login data

            }); // posting.done

            posting.fail(function( data ) {alert("Error Processing Request");} );

        }); // Submit function

        function processReturn(returnData) { // Process the response from the login

            if (returnData["STATUS"] == "OK") {  // Let them in
                $( "div.login_message" ).replaceWith( "<div class='login_message'>"+ returnData["ERRORMSG"] +"</div>" );
                $('#loginModal').trigger('reveal:close');

                if (typeof theRequestedPage != 'undefined') {
                    window.location=theRequestedPage;
                }
                else {  // theRequestedPage is undefined - User accesses restricted page directly and logs in
                    window.location=window.location.href;
                }
            }
            else { // ERROR
                // now determine what type of error
                if (returnData["ERRORTYPE"] == 'password'){
                // show message and count submissions
                    if (subCount > 2){ // Too many attempted logins
                        $( "div.login_message" ).replaceWith( "<div class='login_message'><h5>The following error has occurred during login;</h5><h6 style='color:white'>"+ returnData["ERRORMSG"] +"</h6></div>" );
                        $( "div.login_message" ).append( "<br>Too Many Attempts" );
                        $('#loginModal').trigger('reveal:close');
                        window.location="index.cfm";
                    }
                    else {
                        $( "div.login_message" ).replaceWith( "<div class='login_message'><h5>The following error has occurred during login;</h5><h6 style='color:white'>"+ returnData["ERRORMSG"] +"<br />Please try again.</h6></div>" );
                    }

                }
                if (returnData["ERRORTYPE"] == 'standing'){
                // show message and provide a modal close
                    $( "div.login_message" ).replaceWith( "<div class='login_message'><h5>The following error has occurred during login;</h5><h6 style='color:white'>"+ returnData["ERRORMSG"] +"</h6></div>" );
                }
                //alert(returnData["STATUS"]);
            }
        }
    });

    // UNCOMMENT THE LINE YOU WANT BELOW IF YOU WANT IE8 SUPPORT AND ARE USING .block-grids
    // $('.block-grid.two-up>li:nth-child(2n+1)').css({clear: 'both'});
    // $('.block-grid.three-up>li:nth-child(3n+1)').css({clear: 'both'});
    // $('.block-grid.four-up>li:nth-child(4n+1)').css({clear: 'both'});
    // $('.block-grid.five-up>li:nth-child(5n+1)').css({clear: 'both'});
    // Hide address bar on mobile devices (except if #hash present, so we don't mess up deep linking).

    if (Modernizr.touch && !window.location.hash) {
        $(window).load(function() {
            setTimeout(function() {
                window.scrollTo(0, 1);
            }, 0);
        });
    }
})(jQuery, this);

$(window).load(function() {
    $('#KMfader').orbit({
        animation: 'fade',
        directionalNav: false,
        animationSpeed: 3000,
        timer: true,
        advanceSpeed: 12000,
        pauseOnHover: true,
        startClockOnMouseOut: true,
        startClockOnMouseOutAfter: 1,
        captions: true,
        captionAnimation: 'fade',
        captionAnimationSpeed: 12000,
        fluid: true
    });

    $('#KMfaderMobile').orbit({
        animation: 'fade',
        directionalNav: false,
        animationSpeed: 3000,
        timer: true,
        advanceSpeed: 12000,
        pauseOnHover: true,
        startClockOnMouseOut: true,
        startClockOnMouseOutAfter: 1,
        captions: true,
        captionAnimation: 'fade',
        captionAnimationSpeed: 12000,
        fluid: true
    });

    $('#ProfileFader').orbit({
        animation: 'fade',
        directionalNav: false,
        animationSpeed: 3000,
        timer: true,
        advanceSpeed: 6000,
        pauseOnHover: true,
        startClockOnMouseOut: true,
        startClockOnMouseOutAfter: 1,
        captions: true,
        captionAnimation: 'slideOpen',
        captionAnimationSpeed: 1000,
        fluid: true
    });

    $('#sideBarFader').orbit({
        animation: 'fade',
        directionalNav: false,
        animationSpeed: 3000,
        timer: true,
        advanceSpeed: 12000,
        pauseOnHover: true,
        startClockOnMouseOut: true,
        startClockOnMouseOutAfter: 1,
        captions: true,
        captionAnimation: 'fade',
        captionAnimationSpeed: 12000,
        fluid: true
    });

    $('#aboutImageFader').orbit({
        animation: 'fade',
        directionalNav: false,
        animationSpeed: 300,
        timer: true,
        advanceSpeed: 9000,
        pauseOnHover: true,
        startClockOnMouseOut: true,
        startClockOnMouseOutAfter: 1,
        captions: true,
        captionAnimation: 'fade',
        captionAnimationSpeed: 1000,
        fluid: true
    });

    $('#quoteSlider').orbit({
        animation: 'fade',
        directionalNav: false,
        animationSpeed: 3000,
        timer: true,
        advanceSpeed: 12000,
        pauseOnHover: true,
        startClockOnMouseOut: true,
        startClockOnMouseOutAfter: 0,
        captions: true,
        captionAnimation: 'fade',
        captionAnimationSpeed: 12000,
        fluid: '16x6'
    });
});

function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
       window.onload = func
    } else {
       window.onload = function() {
           if (oldonload) {
                  oldonload()
          }
          func()
       }
   }
}
