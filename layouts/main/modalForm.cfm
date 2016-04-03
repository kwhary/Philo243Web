<cfoutput>
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
