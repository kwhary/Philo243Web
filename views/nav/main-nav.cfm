<cfoutput><div class="row">
	<div class="twelve columns mobile-four">
		<ul class="nav-bar middle"><!---  data-magellan-expedition="fixed" --->
			<li><a href="#buildURL('main.default')#">Home</a></li>
			<li><cfif session.loggedIn EQ true>
				<a href="#buildURL('main.trestleboard')#" id="trestleboards" class="mServices">Trestleboards</a>
			<cfelse>
				<a href="#buildURL('main.trestleboard')#" data-reveal-id="loginModal" id="trestleboards" class="mServices">Trestleboards</a>
			</cfif></li>
			<li><cfif session.loggedIn EQ true>
				<a href="#buildURL('members.default')#" id="memberServices" class="mServices">Member Services</a>
			<cfelse>
				<a href="#buildURL('members.default')#" data-reveal-id="loginModal" id="memberServices" class="mServices">Member Services</a>
			</cfif></li>
			<!---<li><a href="default.cfm?pageType=m" data-reveal-id="loginModal">Modal</a>--->
			<li><a href="#buildURL('main.history')#">History</a></li>
			<li><a href="#buildURL('main.links')#">Masonic Links &amp; News</a></li>
			<li><a href="#buildURL('galleries.default')#">Photo Selections</a></li>
			<li><a href="#buildURL('main.about')#">About Philo</a></li>
		</ul>
	</div>
</div>
</cfoutput>
