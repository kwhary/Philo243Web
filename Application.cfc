<cfcomponent extends=framework.one>
  <cfset THIS.name ="PhiloWebSite">
  <cfset THIS.Sessionmanagement = true>
  <cfset THIS.Sessiontimeout ="#createtimespan(0,0,20,0)#"><!--- 20 minutes --->
  <cfset THIS.setDomainCookies = false>
  <cfset THIS.scriptProtect = true>
  <cfset THIS.applicationtimeout="#createtimespan(0,1,0,0)#">

  <cffunction name="onApplicationStart">

      <!--- <cfset application.datasource = "lodge_members"> --->
      <cfset application.calendarID = "mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com"><!--- Lodge Main Calendar --->
      <cfset application.clubcalendarID = "lvgv5n8p90q18v7jbkgpbjhb1o@group.calendar.google.com"><!--- Level Club Calendar --->
    <cfset application.googleClientID = "991711430336-9jeg4n3a2uklrj2664unn0amisdckakj.apps.googleusercontent.com">
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
              <cflog file="#THIS.Name#" type="error"
                  text="Lodge DB not available. message: #cfcatch.message#
                  Detail: #cfcatch.detail# Native Error: #cfcatch.NativeErrorCode#">
              <cfreturn False>
          </cfcatch>
      </cftry>
--->
      <!--- You do not have to lock code in the onApplicationStart method that sets Application scope variables. --->

   </cffunction>

  <cffunction name="onSessionStart">
    <cfset Session.UserID ="">
    <cfset Session.FName ="">
    <cfset Session.LName ="">
    <cfset Session.MST ="">
    <cfset Session.AdminUser ="">
    <cfset Session.is_officer ="">
    <cfset Session.Password ="">
    <cfset session.loggedin = false>
  </cffunction>

  <cffunction name="onSessionEnd">

      <cfset Session.UserID ="">
      <cfset Session.FName ="">
      <cfset Session.LName ="">
      <cfset Session.MST ="">
      <cfset Session.AdminUser ="">
      <cfset Session.is_officer ="">
      <cfset Session.Password ="">
      <cfset session.loggedin = false>

  </cffunction>


</cfcomponent>
