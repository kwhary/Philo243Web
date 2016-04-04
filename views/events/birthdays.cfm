<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>


<!--- <cfquery DATASOURCE="lodge_members" name="getBirthdays">

SELECT
		Date() as current_date,
		DateDiff('yyyy', m.mdate, Now()) AS NumYears ,
		m.lastName, m.firstName, m.midname, m.mst,
		m.email, m.mdate, m.stats, m.ypm, m.pmlodge,m.GLNUM
	FROM memdat m, omit o 
	WHERE m.stats = 'good'
	AND m.GLNUM <> o.GLNUM
	AND MONTH(m.mdate) = #DateFormat('#Now()#','mm')#
	
	
	
	ORDER BY m.mdate asc, m.lastName asc, m.firstName asc	
	
</cfquery> --->
<cfquery DATASOURCE="lodge_members" name="getBirthdays">
SELECT 
	Date() as current_date,
	DateDiff('yyyy', mdate, Now()) AS NumYears ,
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

</cfquery>
<CFOUTPUT QUERY="GETBIRTHDAYS">

#FIRSTNAME# #LASTNAME# #GLNUM# <BR>

</CFOUTPUT>

</body>
</html>
