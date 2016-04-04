<cfcomponent extends=framework.one>
  <cfset this.name ="PhiloWebSite">
  <cfset this.sessionManagement = true>
  <cfset this.sessionTimeout ="#createTimeSpan(0,0,20,0)#"><!--- 20 minutes --->
  <cfset this.setDomainCookies = false>
  <cfset this.scriptProtect = true>
  <cfset this.applicationTimeout="#createTimeSpan(0,1,0,0)#"><!--- 1 hour --->

  <!--- Enable CFOUTPUT Only --->
  <cfsetting enableCFoutputOnly="yes">

  <cffunction name="setupApplication"> <!--- Use this instead of of onApplicationStart --->
      <!--- <cfset application.datasource = "lodge_members"> --->
      <cfset application.calendarID = "mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com"><!--- Lodge Main Calendar --->
      <cfset application.clubcalendarID = "lvgv5n8p90q18v7jbkgpbjhb1o@group.calendar.google.com"><!--- Level Club Calendar --->
    <cfset application.googleClientID = "991711430336-9jeg4n3a2uklrj2664unn0amisdckakj.apps.googleusercontent.com">
  <cfset application.pageSuffix = "Philo Lodge No. 243 Free and Accepted Masons,South River N.J. USA">

<!---
      <cftry>
          <!--- Test whether the DB that this application uses is accessible
                  by selecting some data. --->
          <cfquery name="testDB" dataSource="#application.datasource#" maxrows="2">
              SELECT glnum FROM memdat
          </cfquery>
          <!--- If we get database error, report it to the user, log the error
              information, and do not start the application. --->
          <cfcatch type="database">
              <cfoutput>
                  This application encountered an error connecting to the datasource.<br>
              </cfoutput>
              <cflog file="#this.Name#" type="error"
                  text="Lodge DB not available. message: #cfcatch.message#
                  Detail: #cfcatch.detail# Native Error: #cfcatch.NativeErrorCode#">
              <cfreturn False>
          </cfcatch>
      </cftry>
--->
      <!--- You do not have to lock code in the onApplicationStart method that sets Application scope variables. --->

   </cffunction>

  <cffunction name="onSessionStart">
    <cfset session.UserID ="">
    <cfset session.FName ="">
    <cfset session.LName ="">
    <cfset session.MST ="">
    <cfset session.AdminUser ="">
    <cfset session.is_officer ="">
    <cfset session.Password ="">
    <cfset session.loggedin = false>
  </cffunction>

  <cffunction name="onSessionEnd">
      <cfset session.UserID ="">
      <cfset session.FName ="">
      <cfset session.LName ="">
      <cfset session.MST ="">
      <cfset session.AdminUser ="">
      <cfset session.is_officer ="">
      <cfset session.Password ="">
      <cfset session.loggedin = false>
  </cffunction>


</cfcomponent>
