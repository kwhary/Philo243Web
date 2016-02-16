
<script language="javascript" src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
<!--- <script language="javascript" src="jquery.JSON.js"></script> --->
<script language="javascript" type="text/javascript">

var argumentCollection = { q: [1,2] };

$.ajax({
    url:        'test.cfc',
    data:       {
        method: 'getResults',
        argumentCollection: $.parse(argumentCollection)
    },
    success:    function(response) {
        alert(response);
    },
    dataType:   'json'
});

</script>


<cfajaxproxy cfc="test" jsclassname="Remote">
<cfoutput>
<script language="javascript" type="text/javascript">
var oRemote = new Remote();
alert(oRemote.getResults([1,2]));
</script>
</cfoutput>