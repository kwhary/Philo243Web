
<cfquery DATASOURCE="#application.datasource#" name="getBirthdays">
	SELECT 
		Date() as current_date,
		DateDiff('yyyy', mdate, Now()) AS NumYears ,
	    DateDiff('yyyy', DateAdd('yyyy',  adjyear,  mdate), Now()) AS AdjustedYears,
		lastName, 
		firstName, 
		midname, 
		mst,
		email, 
		mdate, 
		stats, 
		ypm, 
		pmlodge, 
		glnum
	FROM memdat
	WHERE  glnum NOT IN (SELECT glnum FROM  omit)
	AND stats = 'good'
	AND MONTH(mdate) = #DateFormat('#Now()#','mm')#
	ORDER BY mdate asc, lastName asc, firstName asc
</cfquery>

<cfif getBirthdays.RecordCount EQ 0>
<!--- dont show anything --->
<cfelse>
	<cfoutput>
	<h6 class="subheader" align="center">
	</cfoutput>
	<cfoutput query="getBirthdays">
		#mst# #firstName# #lastName# - <strong>#AdjustedYears#</strong> yrs<br> <cfif #NumYears# NEQ #AdjustedYears#><strong>*</strong></cfif>  <font style="font-size:smaller;">(#DateFormat("#mdate#","mm-dd-yyyy")#)<br>-------------</br></font>		
	</cfoutput>	
	<cfoutput>
	<br>Congratulations Brethren !</FONT><br>* = Years of service adjusted (contact Secretary for more information )
	</h6>	
	</cfoutput>
</cfif>