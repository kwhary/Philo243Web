
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>
<script type='text/javascript' src='https://code.jquery.com/ui/1.11.4/jquery-ui.js'></script>
<script src='javascripts/date.format.js'></script>
<script src='javascripts/time.format.js'></script>


<script>
function initMain() {
    
    var config = {
      'client_id': '991711430336-9jeg4n3a2uklrj2664unn0amisdckakj.apps.googleusercontent.com',
      //'client_id': '#application.googleClientID#',
      'scope': 'https://www.googleapis.com/auth/calendar.readonly',  //.readonly
      'immediate': 'true' 
    }
 
    gapi.auth.authorize(config, function(authResult) {
      console.log(authResult);

      if(typeof authResult.error === 'undefined'){  // no error during authorization
        //alert('auth ok');
        gapi.client.load('calendar', 'v3').then(listUpcomingEvents); // load calendar obj then list events
      }
      else { // AUTH error 
        alert(authResult.error);

      dteWrapperHTML = '<div style=\'color:red;\' id=\'error\' class=\'panel radius\'>** Lodge Calendar Error [AUTH] **</div>';
      jQuery('##wrapper').append(dteWrapperHTML); // append the panel
      };
    });
};  // end initMain

function listUpcomingEvents() {

  // build the request parameters
  //alert('in listUpcomingEvents');
  var request = gapi.client.calendar.events.list({
    //'calendarId': '#application.calendarId#', 
    'calendarId': 'mghbbc31rk9taddtvgtk37fnko@group.calendar.google.com', 
    'timeMin': (new Date()).toISOString(),
    'showDeleted': false,
    'singleEvents': true,
    'maxResults': 6,
    //'maxResults': #datesToShow#,
    'orderBy': 'startTime'
  });

    request.execute(function(resp) { //get the events

    console.log(resp);

      if(typeof resp.error === 'undefined'){  // NO ERROR

         // jQuery.ajax({  
         //            type:'POST',          
         //            url: 'build-the-digest.cfc',            
         //            dataType:'json',            
         //            data: {method: 'structFromJSobj',            
         //                    returnFormat:'json',            
         //                    jsStruct: JSON.stringify(resp.items)}
         // });


        //events = resp.items; 

      
      } // end NO CALENDAR ERROR

      else {  // CALENDAR ERROR
        calendarErrorMsg = '** Lodge Calendar Error [' + resp.code + ']-' + resp.message + ' **';
        dteWrapperHTML = '<div style=\'color:red;\'id=\'error\' class=\'panel radius\'>' + calendarErrorMsg + '</div>';
        jQuery('##wrapper').append(dteWrapperHTML); // append the panel
      }

    } ); // end get the events

}; //end listUpcomingEvents


</script>

<script type='text/javascript' src='https://apis.google.com/js/client.js?onload=initMain'></script>

