<cfoutput><h1>
Philo Lodge No. 243<br>
<small>Exception Error Encountered!</small>
</h1>

<img src="/assets/images/skull_bones_error.png" align="center" id="errorImage" alt="error" title="errorImage">

<p>I am the subsystem error view: home:main.error.</p>

<p>Details of the exception:</p>
<ul>
    <li>Failed action:
      <cfif structKeyExists( request, 'failedAction' )>
        <!--- sanitize user supplied value before displaying it --->
        #replace( request.failedAction, "<", "&lt;", "all" )#
      <cfelse>
        unknown
      </cfif>
    </li>
    <li>Application event: #request.event#</li>
    <li>Exception type: #request.exception.type#</li>
    <li>Exception message: #request.exception.message#</li>
    <li>Exception detail: #request.exception.detail#</li>
</ul>

<p>If this problem persists, please contact the <a href="mailto:secretary@philolodge.net?subject=Exception Error on the Website">Web Master.</a></p>
</cfoutput>
