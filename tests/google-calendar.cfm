<cfscript>

	this.clientID = 'local-cf@philolodge-net.iam.gserviceaccount.com';
	this.google.oauthURL = 'https://accounts.google.com/o/oauth2/auth';
	this.google.tokenURL = 'https://accounts.google.com/o/oauth2/token';
	this.google.tokenURL_OLD = 'https://www.googleapis.com/oauth2/v4/token';
	this.scope = 'https://www.googleapis.com/auth/calendar.readonly';


	// NOTE: generate a JWT for authorization. => https://developers.google.com/identity/protocols/OAuth2ServiceAccount#authorizingrequests

	// NOTE: Format the header
	this.google.auth.headerEncoded = base64urlEncode('{"alg":"RS256","typ":"JWT"}');

	// NOTE: Format the claim set
	// this.google.auth.iss = 'local-cf@philolodge-net.iam.gserviceaccount.com';
	this.google.auth.iss = this.clientID;
	this.google.auth.scope = this.scope;
	this.google.auth.aud = this.google.tokenURL;
	this.google.auth.time = now();
	this.google.auth.unixTime = dateDiff('s', createDate(1970,1,1), createODBCDateTime(this.google.auth.time));
	this.google.auth.exp = dateDiff('s', createDate(1970,1,1), createODBCDateTime(dateAdd('h', 1, this.google.auth.time)));
	this.google.auth.iat = dateDiff('s', createDate(1970,1,1), createODBCDateTime(this.google.auth.time));
	this.google.auth.claimSet = '{"iss":"' & this.google.auth.iss & '", "scope":"' & this.google.auth.scope & '", "aud":"' & this.google.auth.aud & '", "exp":"' & this.google.auth.exp & '", "iat":"' & this.google.auth.iat & '"}';
	this.google.auth.claimSetEncoded = base64urlEncode(this.google.auth.claimSet);

	// NOTE: Format the signature
	this.google.auth.signature = '{' & this.google.auth.headerEncoded & '}.{' & this.google.auth.claimsetEncoded & '}';
	this.google.auth.signatureHash = hash(this.google.auth.signature, 'sha-256');

	// NOTE: Request the access token
	this.google.auth.grantType = encodeForURL('urn:ietf:params:oauth:grant-type:jwt-bearer');
	this.google.auth.assertion = this.google.auth.headerEncoded & '.' & this.google.auth.claimsetEncoded & '.' & this.google.auth.signatureHash;
	this.google.auth.tokenData = 'grant_type=' & this.google.auth.grantType & '&assertion=' & this.google.auth.assertion;
	// this.google.auth.tokenURL = 'https://www.googleapis.com/oauth2/v4/token';
	this.google.auth.token = curlMe(method='put', url=this.google.tokenURL, data=this.google.auth.tokenData);



	/*
	//NOTE: This is the example code from Google. There's a URL change in the string which makes the encoded string not equal the generated one.
	this.google.encodeString = '{"iss":"761326798069-r5mljlln1rd4lrbhg75efgigp36m78j5@developer.gserviceaccount.com","scope":"https://www.googleapis.com/auth/prediction","aud":"https://www.googleapis.com/oauth2/v4/token","exp":1328554385,"iat":1328550785}';
	this.google.encodedString = base64urlEncode(this.google.encodeString);
	this.google.testDecode = base64urldecode('eyJpc3MiOiI3NjEzMjY3OTgwNjktcjVtbGpsbG4xcmQ0bHJiaGc3NWVmZ2lncDM2bTc4ajVAZGV2ZWxvcGVyLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzY29wZSI6Imh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvcHJlZGljdGlvbiIsImF1ZCI6Imh0dHBzOi8vYWNjb3VudHMuZ29vZ2xlLmNvbS9vL29hdXRoMi90b2tlbiIsImV4cCI6MTMyODU1NDM4NSwiaWF0IjoxMzI4NTUwNzg1fQ');
	*/




	this.google.api.url = 'https://www.googleapis.com';
	this.google.endpoint = '/calendar';
	this.google.endpointVersion = '/v3';
	this.google.calendar.id = 'cbe917atmrb9rfpihmhqg1r2jk@group.calendar.google.com';
	this.google.calendar.httpMethod = 'get';
	this.google.calendar.method = 'get';
	this.google.calendar.request = this.google.api.url & this.google.endpoint & this.google.endpointVersion & '/calendars/' & this.google.calendar.id;
	this.google.calendar.response = curlMe(url=this.google.calendar.request);







// https://accounts.google.com/o/oauth2/v2/auth?prompt=none&access_type=online&state=testing&response_type=code&redirect_uri=http%3a%2f%2f127.0.0.1%3a8501&scope=email%20profile&client_id=local-cf@philolodge-net.iam.gserviceaccount.com

// curl -v -d 'grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJsb2NhbC1jZkBwaGlsb2xvZGdlLW5ldC5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsICJzY29wZSI6Imh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvY2FsZW5kYXIucmVhZG9ubHkiLCAiYXVkIjoiaHR0cHM6Ly9hY2NvdW50cy5nb29nbGUuY29tL28vb2F1dGgyL3Rva2VuIiwgImV4cCI6IjE0NTU3NTc5ODAiLCAiaWF0IjoiMTQ1NTc1NDM4MCJ9.228F97244B9C678B57CA689C89AFD1B91E10C9CCE72F50C1FC1040D68CA1D18D' https://accounts.google.com/o/oauth2/token



	writeDump(this);



	// NOTE: Thanks Ben Nadel!!! => https://gist.githubusercontent.com/bennadel/9cc6e3905b1ccab5bd01/raw/6cee458f10151a956440b99aabaccf2d432edde6/base64url.cfm

	// Set up our input to take through the base64url-encoding lifecycle.
	input = "MC Lyte: I rock the party that rocks the body!";

	// Encode and then subsequently decode the base64url value to make sure that both
	// the input and the output match after encoding.
	encodedValue = base64urlEncode( input );
	decodedValue = base64urlDecode( encodedValue );

	// Output our results.
	writeOutput( "Input: #input# <br />" );
	writeOutput( "Encoded: #encodedValue# <br />" );
	writeOutput( "Decoded: #decodedValue# <br />" );
	writeOutput( "Matches: #yesNoFormat( ! compare( input, decodedValue ) )# <br />" );


	// ------------------------------------------------------------------------------- //
	// ------------------------------------------------------------------------------- //


	/**
	* I decode the base64url value into its original UTF-8 string.
	*
	* @value I am the UTF-8 string to decode.
	* @output false
	*/
	public string function base64urldecode( required string value ) {

		// First, we need to get this base64url value back to the original base64 format.
		// To do this, we have to re-add the standard base64 characters.
		value = replace( value, "-", "+", "all" );
		value = replace( value, "_", "/", "all" );

		// Part of the original coding stripped out the padding characters at the end of
		// the base64 value. We need to add these back in, otherwise ColdFusion won't be
		// able to parse the value.
		value &= repeatString( "=", ( 4 - ( len( value ) % 4 ) ) );

		// Once we have the valid base64 input, we can get the binary representation.
		var bytes = binaryDecode( value, "base64" );

		// And, from the binary, we can re-encode the value as the original UTF-8 string.
		var decodedValue = charsetEncode( bytes, "utf-8" );

		return( decodedValue );

	}


	/**
	* I encode the given UTF-8 string using base64url encoding.
	*
	* @value I am the UTF-8 string to encode.
	* @output false
	*/
	public string function base64urlEncode( required string value ) {

		// Get the binary representation of the UTF-8 string.
		var bytes = charsetDecode( value, "utf-8" );

		// Encode the binary using the core base64 character set.
		var encodedValue = binaryEncode( bytes, "base64" );

		// Replace the characters that are not allowed in the base64url format. The
		// characters [+, /, =] are removed for URL-based base64 values because they
		// have significant meaning in the context of URL paths and query-strings.
		encodedValue = replace( encodedValue, "+", "-", "all" );
		encodedValue = replace( encodedValue, "/", "_", "all" );
		encodedValue = replace( encodedValue, "=", "", "all" );

		return( encodedValue );

	}

</cfscript>

<!---   Execute cURL from the servers CLI   --->
<cffunction access="package" description="Executes cURL from the CLI" displayName="Execute cURL" hint="Runs cURL" name="curlMe" output="false" returnType="struct">
    <cfargument name="data" type="string" required="no" default="">
    <cfargument name="authorization" type="string" required="no">
    <cfargument name="method" type="string" required="no" default="get">
    <cfargument name="timeout" type="numeric" required="no" default=30>
    <cfargument name="url" type="string" required="yes">

    <cfif data neq "">
        <cfset data = ' -d ' & data>
    </cfif>

<!---         <cfdump var="#arguments#" expand="false" label="curlMe() Arguments"> --->
    <!--- <cfset session.okta.utils.curl.arguments = arguments> --->

    <!--- <cfset curlArgs = '-H "Authorization:' & authorization & '" -H "Accept:application/json" -H "Content-Type:application/json" -X ' & ucase(method) & data & ' ' & url> --->
    <cfset curlArgs = ucase(method) & data & ' ' & url>
<!---         <cfdump var="#curlArgs#" expand="false" label="cURL Arguments"> --->
    <!--- <cfset session.okta.utils.curl.args = curlArgs> --->

<!---         <cftrace type='information' category='Curl' text='Start Curl Executition'> --->
    <cfexecute
        name = "curl"
        arguments = "#curlArgs#"
        variable = "curlData.resultRaw"
        errorVariable = "curlData.resultError"
        timeout = "#timeout#"
    >
    </cfexecute>
<!---         <cftrace type='information' category='Curl' text='End Curl Executition'> --->
<!--- CFExecute Output Not Going in Your Variable? ===> http://blog.crankybit.com/cfexecute-output-in-var/ --->

    <cfif isJson(curlData.resultRaw)>
	    <cfset curlData.data = deserializeJSON(curlData.resultRaw)>
    </cfif>
<!---         <cfdump var="#curlData#" expand="false" label="cURL Response Data"> --->
    <!--- <cfset session.okta.utils.curl.data = curlData> --->
    <cfreturn curlData>
</cffunction>

<!---
https://accounts.google.com/o/oauth2/v2/auth?
	scope=https://www.googleapis.com/auth/drive.file
	&state=security_token%3D138r5719ru3e1%26url%3Dhttps://oa2cb.example.com/myHome
	&redirect_uri=https%3A%2F%2Fmyapp.example.com%2Fcallback
	&response_type=code
	&client_id=8127352506391.apps.googleusercontent.com
	&prompt=consent
	&include_granted_scopes=true
--->
