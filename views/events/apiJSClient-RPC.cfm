// OR RPC REQUESTS

    <script type='text/javascript'>

    function init() {
    	function auth() {
    		gapi.client.setApiKey('AIzaSyCNhQu9vn8f1kBmoW0gIPzFD6zgSkqJmz8');
    		var config = {}

    	}


    }

    gapi.client.load('calendar','v3', function onReady() {  // load all calendar api methods **

    	// loads when the requested API is ready to use
    });

    	gapi.client.register('calendar.events',{'apiVersion': 'v3'});
    	var request = gapi.client.calendar.events({'foo':'fooValue'});
    	function requestCallBack(jsonResponse,rawResponse) {

    		// do something with jsonResponse (object) or rawResponse (string)
    	};
    </script>
    <script type='text/javascript' src='https://apis.google.com/client.js?onload=init'>



   ");