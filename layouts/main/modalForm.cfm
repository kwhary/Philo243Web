<cfoutput>
<!---
    <script type="text/javascript">

   //theclickedURL = document.getElementById("memberServices").getAttribute("href");
  // var pageType = getURLParameter(theclickedURL, 'pageType');
   //alert('pageType=' + pageType);

  // function saveURLParameter() {
    	//var url = ($(this).attr('href'));
//		var pageType = getURLParameter(url, 'pageType');
// 		alert(url);
//    };
//    function getURLParameter(url, name) {
//		return (RegExp(name + '=' + '(.+?)(&|$)').exec(url)||[,null])[1];
//	}

   // alert(document.getElementById("myNav").getAttribute("href"));


	var subCount = 0;
	$(document).ready(function() {

    	$("a").click(function(event) {
    		targetClass = $(this).attr("class");
        	//alert('ID=' + event.target.id);
        	//alert('class=' + $(this).attr("class"));
        	//alert('href=' + event.target.href);
        	//alert('thePageName=' + $("." + targetClass).attr("href"));
        	theRequestedPage = $("." + targetClass).attr("href");

    	});

		//$("##memberServices").click(function() {  // this works with ID
        // alert('memberservices is clicked');
        // return true;
        //});

       // $(".mServices").click(function () {  // this works with class
       // 	var value = $(".mServices").attr("href");
       // alert('pageName=' + value );
    	//});


		// Attach a submit handler to the form
		$( "##logInFormID" ).submit(function( event ) {

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

		});	// Submit function

		function processReturn(returnData) { // Process the response from the login

			if (returnData["STATUS"] == "OK") {  // Let them in
				$( "div.login_message" ).replaceWith( "<div class='login_message'>"+ returnData["ERRORMSG"] +"</div>" );
				$('##loginModal').trigger('reveal:close');

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
						$('##loginModal').trigger('reveal:close');
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

	});//document ready

</script>
--->

<div id="loginModal" class="reveal-modal small">

<!--- <cfdump var="#session#" expand="no"><cfdump var="#application#" expand="no"> --->
	<div class="row">
		<div class="twelve mobile-four columns">
			<cfif IsDefined("cookie.LName")>
				<cfoutput><h5>Brother #cookie.LName#, </h5></cfoutput>
			</cfif>

			<h5><i class="foundicon-lock"></i>&nbsp;&nbsp;Membership Login is Required</h5>

			<div class="login_message"></div><!--- Login Message Area --->
		</div>
	</div>

	<cfform name="loginForm" id="logInFormID">

		<a class="close-reveal-modal" style="color:##A09AFF">&##215;</a>
		<div class="row">
			<label style="color:##A09AFF">Enter UserId:</label>
			<div class="twelve mobile-four columns">
				<cfinput size="10" id="UserID" name="UserID" type="text" required="Yes" message="Please Enter your GL ID ##" maxlength="10" validate="integer" style="background-color:##CCCCCC"/>
			</div>
		</div>

		<div class="row">
			<label style="color:##A09AFF">Enter Password:</label>
			<div class="twleve mobile-four columns">
				<cfinput size="10" id="password" name="password" type="password" message="Please enter a valid Password" maxlength="10" validate="integer" style="background-color:##CCCCCC"/>
			</div>
		</div>
		<div class="row">
				<div class="twelve mobile-four columns">
					<p ALIGN="center"><cfinput type="submit" id="submit" name="submit" value="Login" /></p>
				</div>
		</div>

		<div class="row hide-for-small">
			<div class="twelve mobile-four columns">
				<ul class="accordion">
				  <li>
				    <div class="title">
				      <h5>Login Help</h5>
				    </div>
				    <div class="content">
						<p><IMG ALIGN="center" id="helpImage" SRC="/assets/images/Login-Help.gif" ALT="How do I log in" WIDTH="455" HEIGHT="296" BORDER="0"></p>
				    </div>
				  </li>
				</ul>
			</div>
		</div>
	</cfform>

</div><!--- LoginModal div --->
</cfoutput>
