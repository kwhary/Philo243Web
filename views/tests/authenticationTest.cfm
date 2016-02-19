<cfscript>
	session.user.okta.passwordKey = generateSecretKey("AES");
	this.myPasswordString = '12345';
	this.myEncryptedPassword = encrypt(this.myPasswordString, session.user.okta.passwordKey);  
	this.myDecryptedPassword = decrypt(this.myEncryptedPassword, session.user.okta.passwordKey);  
	writeDump(this);
	
</cfscript>

<cfoutput>

<script src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/aes.js"></script>

<script type="text/javascript">

$(document).ready(function() {

	//alert('document Ready');
	
	$( "##shuLoginFormID" ).submit(function( event ) {  //submit event handler
	
		event.preventDefault();  // Stop form from submitting on CR/Enter
		 
		do_login(shuLogin.username.value,shuLogin.password.value);
	
	});  //submit function event handler
		
	//function do_login (thisUserName,thisPassword,thisSecretKey) {
	function do_login (thisUserName,thisPassword) {
		
		jQuery.ajax({
			type:'get',
			url: '../customcf/okta/session.cfc?method=create&username=' + thisUserName + '&password=' + thisPassword,
			//url: 'http://www.badURL.org',
			dataType: 'json',
				beforeSend:function(){
					//alertValue = '#session.user.okta.passwordKey#';
					//window.alert(alertValue);
					// Encrypt the password
					window.alert(thisPassword);
					doubleSecretPassword = CryptoJS.AES.encrypt(thisPassword, '#session.user.okta.passwordKey#');
					window.alert(doubleSecretPassword);
					window.alert(CryptoJS.AES.decrypt(doubleSecretPassword, '#session.user.okta.passwordKey#'));
 					var encrypted = CryptoJS.AES.encrypt("12345", '#session.user.okta.passwordKey#');
 					window.alert(encrypted);
 					var decrypted = CryptoJS.AES.decrypt(encrypted, '#session.user.okta.passwordKey#');
 					window.alert(decrypted.toString(CryptoJS.enc.Utf8));
					
					
					
						
				} 
			}
			)
			.done(function(oktaData) {
				if (oktaData.errorCode) {
					//window.alert('Login Error: ' + oktaData.errorSummary);
					jQuery( "div.login_message" ).replaceWith( "<div class='login_message'><h3 class='error' style='color:##FF0000'>"+ oktaData.errorSummary +"</h3></div>" );
				}
				else {  // Good to go
					window.alert('Login Valid : Redirecting to shu.okta.com');
					//oktaData.id, oktaData.userId, oktaData.mfaActive
					
					SHUoktaURL = 'https://shu.okta.com/login/sessionCookieRedirect?token=' + oktaData.cookieToken ;
					redirectURL = 'https://shu.okta.com/app/UserHome?fromLogin=true';
					window.location.href = SHUoktaURL + '&redirectUrl=' + redirectURL;
				
					}
				})	// .done 
			.fail(function( jqXHR, textStatus ) {
				//window.alert( "Request failed: " + textStatus );
				jQuery( "div.login_message" ).replaceWith( "<div class='login_message'><h3 class='error' style='color:##FF0000'>Request Failed;<br />"+ textStatus +"<br />Please try again later.</h3></div>" );				
			})
	};
		
	function do_logOut () {
	
	};


});//document ready

</script>

<!--- <div id="loginModal" class="reveal-modal" data-reveal> --->

<!--- <cfform name="shuLogin" id="shuLoginFormID" action="loginFunctions.cfc?method=do_login" method="POST"> --->
<cfform name="shuLogin" id="shuLoginFormID">
	
	<div class="row">
		<div class="small-8 centered">
			<div class="login_message"></div><!--- Login Message Area --->
		</div>
	</div>
	<div class="row">
		<div class="small-8 centered">
		  <div class="row collapse">
		    <div id="shuLoginId" class="small-12 columns">
		     <label>SHU Login:
		     	 <cfinput required="true" id="inputSHUUsername" name="username" type="text" placeholder="Enter SHU Login" message="Login Id Required" />
		      </label>
		    </div>
		    
		  </div>
		  <div class="row collapse">
		    <div id="shuPass" class="small-12 columns">
				<label>Password:
					<cfinput required="true" id="inputSHUPassword" name="password" type="password" placeholder="Enter SHU Password" message="Password Required" />
				</label>
		    </div>
		  </div> 
	</div>
	<div class="row">
		<div class="small-8 centered">
			<cfinput type="submit" id="submit" name="submit" value="Login" />
		</div>		
	</div>	


</cfform>

<!--- </div> --->
</cfoutput>