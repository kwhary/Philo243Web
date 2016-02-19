
<cfscript>

    var credential = GoogleCredential
        .setTransport( NetHttpTransport )
        .setJsonFactory( JacksonFactory )
        .setServiceAccountId( accountId )
        .setServiceAccountScopes( Collections.singleton( DirectoryScopes.ADMIN_DIRECTORY_USER ) )
        .setServiceAccountPrivateKeyFromP12File( p12File )
        .build();

////////

 	var p12File = createObject( 'java', 'java.io.File' ).init( '/private/Calendar Service Project-0684ba2e05d3.json' );
    var accountId = JavaCast( "string", "lodgeweb@calendar-service-project.iam.gserviceaccount.com" );

    var GoogleCredential = createObject( "java", "com.google.api.client.googleapis.auth.oauth2.GoogleCredential$Builder" );

    var httpTransport = createObject( "java", "com.google.api.client.http.HttpTransport" ).init();
    var NetHttpTransport = createObject( "java", "com.google.api.client.http.javanet.NetHttpTransport" ).init();

    var jsonFactory = createObject( "java", "com.google.api.client.json.JsonFactory" ).init();

    var calendar = createObject( "java","com.google.api.services.calendar.Calendar").init();
    var event = createObject( "java","com.google.api.services.calendar.model.Event").init();
    var events = createObject( "java","com.google.api.services.calendar.model.Events").init();

    var service = new Calendar.Builder(httpTransport, jsonFactory, credentials).setApplicationName("applicationName").build();

	cfanalytics = createObject("component", "path.to.cfanalytics").init(
                                        serviceAccountID="lodgeweb@calendar-service-project.iam.gserviceaccount.com",
                                        pathToKeyFile=expandPath("p12File"),
                                        analyticsAppName="Your App Name in the GA Console") />
                                                                         


//import com.google.api.services.calendar.Calendar;
//import com.google.api.services.calendar.model.Event;
//import com.google.api.services.calendar.model.Events;

// ...

// Initialize Calendar service with valid OAuth credentials
Calendar service = new Calendar.Builder(httpTransport, jsonFactory, credentials).setApplicationName("applicationName").build();

// Iterate over the events in the specified calendar
String pageToken = null;
do {
  Events events = service.events().list('primary').setPageToken(pageToken).execute();
  List<Event> items = events.getItems();
  for (Event event : items) {
    System.out.println(event.getSummary());
  }
  pageToken = events.getNextPageToken();
} while (pageToken != null);




writeOutput('
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript">

var mykey = "AIzaSyAA4cBDPdQIeW6cBwf1tMjFKZ5fQeynGy0"; // typically like Gtg-rtZdsreUr_fLfhgPfgff
var calendarid = "mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com"; // will look somewhat like 3ruy234vodf6hf4sdf5sd84f@group.calendar.google.com

	jQuery.ajax({
	    type: "GET",
	    url: encodeURI("https://www.googleapis.com/calendar/v3/calendars/" + calendarid+ "/events?key=" + mykey),
	    dataType: "json",
	    success: function (response) {
	        alert(response);
	    },
	    error: function (response) {
	        //tell that an error has occurred
	    }
	});
	</script>
');
</cfscript>