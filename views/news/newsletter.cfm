

<!--- <cfhttp url="http://www.philolodge.net/newsLetterFunctions.cfm">
<cfoutput>

  #cfhttp.filecontent#
</cfoutput>--->


<cfscript>



//include "newsLetterFunctions.cfm";



savecontent variable="theDigest" {

	include "newsLetterFunctions.cfm";

};

writeOutput("<script type='text/javascript' src='https://apis.google.com/js/client.js?onload=initMain'>// This must stay here</script>");

//writeDump(#theDigest#);
//writeOutput(#theDigest#);




//writeDump(#theDigest#);
//saveContent();

mail=new mail(#theDigest#);


// Set SMTP settings (not required if you have defined these in the ColdFusion Administrator Mail settings
//mail.setServer( "smtp.mymailserver.com" );
//mail.setUsername( "username" );
//mail.setPassword( "password" );

// Set it's properties
mail.setSubject( "Philo Lodge No. 243 - Weekly Event Digest" );
mail.setTo( "kwhary@optonline.net" );
mail.setFrom( "events@philolodge.net" );
//mail.setCC( "cc@coldgen.com" );
//mail.setBCC( "bcc@coldgen.com" );
mail.setFailTo( "kwhary@optonline.net" );
//mail.setReplyTo( "replyto@coldgen.com" );

// Set the priority (1, 2 or 3 - High to Low)
mail.addParam(name="X-Priority", value="1" );

// Add an attachment, remove from server after sending
//mail.addParam( file="C:\foo.txt", remove="true" );

// Add email body content in text and HTML formats
mail.addPart( type="text", charset="utf-8", wraptext="72", body="This is a test message." );
mail.addPart( type="html", charset="utf-8", body="#theDigest#" );

// Send the email message
//mail.send();


</cfscript>


