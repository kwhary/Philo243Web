<cfoutput><h1>Error Encountered!</h1>

<img src="/assets/images/skull_bones_error.png" align="center" id="errorImage" alt="error" title="errorImage">

<!--- <p>I am the subsystem error view: home:main.error.</p> --->

<h3>Details of the exception:</h3>

<ul>
    <li><strong>Failed action:</strong>
      <cfif structKeyExists( request, 'failedAction' )>
        <!--- sanitize user supplied value before displaying it --->
        #replace( request.failedAction, "<", "&lt;", "all" )#
      <cfelse>
        unknown
      </cfif>
    </li>
    <li><strong>Application event:</strong> #request.event#</li>
    <li><strong>Exception type:</strong> #request.exception.type#</li>
    <li><strong>Exception message:</strong> #request.exception.message#</li>
    <li><strong>Exception detail:</strong> #request.exception.detail#</li>
</ul>

<cfdump expand="false" var=#request#>

<p>If this problem persists, please contact the <a href="mailto:secretary@philolodge.net?subject=Exception Error on the Website">Web Master.</a></p>
</cfoutput>
