<cfcomponent displayname="Digest Service">


<cffunction name="structFromJSobj" access="remote" output="true" >
    <!--- <cfargument name="jsStruct" required="true" type="string"  />--->
    <cfargument name="jsStruct" required="true" type="string"  />
    	<cfscript>
	    	var cfStruct = #DeserializeJSON(arguments.jsStruct)#;
	    	//writeDump(var=#cfStruct#);
	    	return cfStruct;
    	</cfscript>

</cffunction>

<cffunction name="writeIt" access="private" output="true">

	<cfargument name="data" required="true" type="struct">

	<cfdump var="data" expand="false">

	
</cffunction>



</cfcomponent>
