 <cfscript>

 	CalendarID = 'xxx';
 	APIKEY = 'AIzaSyAA4cBDPdQIeW6cBwf1tMjFKZ5fQeynGy0';
    // https://www.googleapis.com/auth/calendar.readonly&scopes=https%3A//www.googleapis.com/auth/calendar.readonly&auth_code=4/T7Rr0xRShHzJ074e1BV7CzcYpqMROUptAYarT066R4g&refresh_token=1/TDRiTOSYIku7JTlQGRXiC6Emo6VGSJsJwuunvk-dIZhIgOrJDtdun6zK6XiATCKT&access_token_field=ya29.LwJP4vsrtw3PA4tYn8-7OKEk7Goj7jIKBna3tLdY0BlA_cbplBoxdm-tRUvzK1vOgJEV&url=https%3A//www.googleapis.com/calendar/v3/calendars/mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com/events%3FmaxResults%3D2500%26orderBy%3DstartTime%26singleEvents%3Dtrue%26timeMax%3D2016-12-31T00%253A00%253A00-04%253A00%26timeMin%3D2015-11-01T00%253A00%253A00-04%253A00&content_type=application/json&http_method=GET&useDefaultOauthCred=unchecked&oauthEndpointSelect=Google&oauthAuthEndpointValue=https%3A//accounts.google.com/o/oauth2/auth&oauthTokenEndpointValue=https%3A//www.googleapis.com/oauth2/v3/token&expires_in=3599&access_token_issue_date=1447791966&for_access_token=ya29.LwJP4vsrtw3PA4tYn8-7OKEk7Goj7jIKBna3tLdY0BlA_cbplBoxdm-tRUvzK1vOgJEV&includeCredentials=checked&accessTokenType=bearer&autoRefreshToken=unchecked&accessType=offline&forceAprovalPrompt=checked&response_type=code

 	//https://www.googleapis.com/calendar/v3/calendars/mghbbc31rk9taddtvgtk37fnko%40group.calendar.google.com/events?maxResults=2500&orderBy=startTime&singleEvents=true&timeMax=2016-12-31T00%3A00%3A00-04%3A00&timeMin=2015-11-01T00%3A00%3A00-04%3A00&key={YOUR_API_KEY}

 	//https://www.googleapis.com/calendar/v3/calendars/mghbbc31rk9taddtvgtk37fnko%40group.calendar.google.com/events?maxResults=2500&singleEvents=true&timeMax=2016-12-31T00%3A00%3A00-04%3A00&timeMin=2015-11-01T00%3A00%3A00-04%3A00&key={YOUR_API_KEY}

 	// https://www.googleapis.com/calendar/v3/calendars/mghbbc31rk9taddtvgtk37fnko%40group.calendar.google.com/events?orderBy=updated&timeMax=2015-11-17T00%3A00%3A00-00%3A01&key={YOUR_API_KEY}

	calendarURL  = "https://www.googleapis.com/calendar/v3/calendars/mghbbc31rk9taddtvgtk37fnko%40group.calendar.google.com/events?maxResults=2500&orderBy=startTime&singleEvents=true&timeMax=2016-12-31T00%3A00%3A00-04%3A00&timeMin=2015-11-01T00%3A00%3A00-04%3A00&key=#APIKEY#";

	httpService = new http();  //create the service
	httpService.setMethod("get"); 
	httpService.setUrl("#calendarURL#"); 
	httpService.setTimeOut("15"); 
	httpService.setThrowonerror("yes"); 

	calendarData = httpService.send().getPrefix(); // get the calendar data

	writeDump(var='#calendarData.Filecontent#',expand=false,label='test');




</cfscript>