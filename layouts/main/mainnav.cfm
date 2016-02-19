<li><a href="index.cfm">Home</a></li>
<li>
	<cfif session.loggedIn EQ true>
		<a href="default.cfm?pageType=t" id="trestleboards" class="mServices">Trestleboards</a>
	<cfelse>
		<a href="default.cfm?pageType=t" data-reveal-id="loginModal" id="trestleboards" class="mServices">Trestleboards</a>
	</cfif>
</li>
<li>
	<cfif session.loggedIn EQ true>
		<a href="default.cfm?pageType=m" id="memberServices" class="mServices">Member Services</a>
	<cfelse>
		<a href="default.cfm?pageType=m" data-reveal-id="loginModal" id="memberServices" class="mServices">Member Services</a>
	</cfif>
</li>
<!--- <li><a href="default.cfm?pageType=m" data-reveal-id="loginModal">Modal</a> --->
<li><a href="default.cfm?pageType=h">History</a></li>
<li><a href="default.cfm?pageType=l">Masonic Links & News</a></li>
<li><a href="default.cfm?pageType=ph">Photo Selections</a></li>
<li><a href="default.cfm?pageType=a">About Philo</a></li> 
