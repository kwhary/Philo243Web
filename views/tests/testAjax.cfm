<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
<div id="dteWrapper">
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>
<script type='text/javascript' src='https://code.jquery.com/ui/1.11.4/jquery-ui.js'></script>
<script src='javascripts/calendar.functions.js'></script>
	</head>
	
<script>
$(document).ready(function(){
$.ajax({ url: "https://apis.google.com/js/client.js",
        context: document.body,
        success: function(initMain){
           alert("done");
        }});
});
</script>

</div>

</html>