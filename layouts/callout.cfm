<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Emergency Call Out</title>
</head>

<CFFUNCTION NAME="FormatPhoneNumber" RETURNTYPE="string">
 <cfargument name="phone_number" type="string" required="true">

 <cfif Len(phone_number) neq 0>
		<cfif Len(phone_number) eq 10>
			<CFSET formattedPhoneNumber = '(' & #MID(phone_number,1,3)# & ') ' & #MID(phone_number,4,3)# & ' - ' & #MID(phone_number,7,4)#>
		<cfelseif len(phone_number) eq 7>
			<CFSET formattedPhoneNumber = #MID(phone_number,1,3)# & ' - ' & #MID(phone_number,4,4)#>
		</cfif>
<cfelse>
	<CFSET formattedPhoneNumber = 'n/a'>
</cfif>

<cfreturn formattedPhoneNumber>

</CFFUNCTION>

<CFFUNCTION NAME="IsOfficer" RETURNTYPE="BOOLEAN"  OUTPUT = "yes">
	<CFARGUMENT NAME="MEM_NAME" TYPE="string" REQUIRED="TRUE">

	<CFLOOP LIST="#GetOfficerNames.columnList#" INDEX="zz">
	
	<cfset OFF_NAME = #evaluate("GetOfficerNames.#zz#")#>
	<cfset MEM_NAME = #evaluate("mem_name")#>
	
	<CFIF #OFF_NAME# EQ #MEM_NAME#>
		<CFSET Officer = true>
		<cfbreak>
	<CFELSE>
		<CFSET Officer = false>
	</CFIF>
	</CFLOOP>
<CFRETURN Officer>

</CFFUNCTION>	
	
<body>

</body>
</html> 
<CFSET REPORT_YEAR = 2015>

<cfquery name="GetOfficerNames" datasource="lodge_members">
	SELECT	WOMA,SEWA,JUWA,SEDE,JUDE,SEMA,JUMA,SEST,JUST,CHAP,MARS,TYLE
	<!--- WML,SWL,JWL,TRL,SCL,SDL,JDL,SMCL,JMCL,SSL,JSL,CHPL,MSHL,TYL  --->
	FROM 	LODOFF
	WHERE RCNM = #REPORT_YEAR#
</cfquery>


<CFOUTPUT QUERY="GetOfficerNames">

<!--- #GetOfficerNames.columnList# <br> --->

<!--- #WML#,#SWL#,#JWL#,#TRL#,#SCL#,#SDL#,#JDL#,#SMCL#,#JMCL#,#SSL#,#JSL#,#CHPL#,#MSHL#,#TYL# <BR> --->

	<CFLOOP LIST="#GetOfficerNames.columnList#" INDEX="CO">
	<CFOUTPUT>#CO#<br></CFOUTPUT>
	
<!--- 	<CFQUERY dbtype="query" name="GetOfficerName"> 
		SELECT #CO# AS #CO#_NAME
		FROM GetOfficerNames
	</CFQUERY> --->
	
	<CFQUERY NAME="GET_CALLOUT_FOR_#CO#" DATASOURCE="lodge_members">
		SELECT distinct
			L.#CO# AS #CO#_NAME,
			CO.RCNM,
			M.YPM,
			M.LASTNAME, M.FIRSTNAME, M.MIDNAME, M.CITY, M.STATE, M.ZIP, M.HPHONE, M.BPHONE, M.CPHONE, M.EMAIL, M.PM,
			M.SPOUSE, M.TYPE
			
			FROM CALLOUT CO, MEMDAT M, LODOFF L
			
			WHERE ( CO.CALLED_BY = '#CO#' AND  CO.RCNM = M.RCNM )
			AND L.RCNM = #REPORT_YEAR#
			
			ORDER BY M.LASTNAME ASC, M.FIRSTNAME ASC
		 
	</CFQUERY>
	
	</CFLOOP>
</CFOUTPUT>


<cfsetting showdebugoutput="false">
<cfheader name="content-disposition" value="inline;filename=call_out_#REPORT_YEAR#.xls">
<cfcontent type="application/msexcel">
<?xml version="1.0"?>
<Workbook
xmlns="urn:schemas-microsoft-com:office:spreadsheet"
xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s1">
   <Alignment ss:Vertical="Center"/>
   <Borders/>
   <Font ss:Bold="1"/>
   <Interior ss:Color="#C0C0C0" ss:Pattern="Solid"/>
   <NumberFormat/>
   <Protection/>
  </Style>
 <Style ss:ID="s2">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:Bold="1"/>
   <Interior ss:Color="#C0C0C0" ss:Pattern="Solid"/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s3">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:Color="#0000FF" ss:Italic="1"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
   <Style ss:ID="s4">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:Color="#FF0000" ss:Bold="1"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
 </Styles>
	<CFLOOP LIST="#GetOfficerNames.columnList#" INDEX="OFFICER">
	<CFSET OFF_VAR = "#OFFICER#" & "_NAME">
	<CFSWITCH EXPRESSION="#OFFICER#">
		<CFCASE VALUE="WOMA"><CFSET OFF = "MASTER"></CFCASE>
		<CFCASE VALUE="SEWA"><CFSET OFF = "SR.WARDEN"></CFCASE>
		<CFCASE VALUE="JUWA"><CFSET OFF = "JR.WARDEN"></CFCASE>
		<CFCASE VALUE="TREA"><CFSET OFF = "TREAS"></CFCASE>
		<CFCASE VALUE="SECR"><CFSET OFF = "SECR"></CFCASE>
		<CFCASE VALUE="SEDE"><CFSET OFF = "SR.DEACON"></CFCASE>
		<CFCASE VALUE="JUDE"><CFSET OFF = "JR.DEACON"></CFCASE>
		<CFCASE VALUE="SEMA"><CFSET OFF = "SR.MC"></CFCASE>
		<CFCASE VALUE="JUMA"><CFSET OFF = "JR MC"></CFCASE>
		<CFCASE VALUE="SEST"><CFSET OFF = "SR.STEWARD"></CFCASE>
		<CFCASE VALUE="JUST"><CFSET OFF = "JR.STEWARD"></CFCASE>
		<CFCASE VALUE="CHAP"><CFSET OFF = "CHAPLAN"></CFCASE>
		<CFCASE VALUE="MARS"><CFSET OFF = "MARHSAL"></CFCASE>
		<CFCASE VALUE="TYLE"><CFSET OFF = "TYLER"></CFCASE>
	</CFSWITCH>
   <Worksheet ss:Name="<CFOUTPUT>#OFF#</CFOUTPUT>">
  	<Table>
		<Column ss:AutoFitWidth="0" ss:Width="150"/>
		<Column ss:Width="70"/>
		<Column ss:Width="30"/>
		<Column ss:AutoFitWidth="0" ss:Width="90"/>
		<Column ss:AutoFitWidth="0" ss:Width="90"/>
		<Column ss:AutoFitWidth="0" ss:Width="90"/>
		<Column ss:AutoFitWidth="0" ss:Width="150"/>
		<Column ss:Width="89"/>	
         <Row ss:Height="30">
			<Cell ss:StyleID="s1" ss:Index="1"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Member Name</B></Data></Cell>
			<Cell ss:StyleID="s1" ss:Index="2"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Spouse</B></Data></Cell>
			<Cell ss:StyleID="s2" ss:Index="3"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>PM</B></Data></Cell>
			<Cell ss:StyleID="s1" ss:Index="4"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Home Phone</B></Data></Cell>
			<Cell ss:StyleID="s1" ss:Index="5"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Bus.Phone</B></Data></Cell>
			<Cell ss:StyleID="s1" ss:Index="6"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Cell Phone</B></Data></Cell>
			<Cell ss:StyleID="s1" ss:Index="7"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>E-Mail</B></Data></Cell>
			<Cell ss:StyleID="s1" ss:Index="8"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>TOWN</B></Data></Cell>
         </Row>
		 <CFLOOP QUERY="GET_CALLOUT_FOR_#OFFICER#">
		 <cfprocessingdirective SUPPRESSWHITESPACE="Yes">
		 <cfoutput>
         <Row ss:Height="20">
		 	<cfif #MIDNAME# is not "">
				<cfif #IsOfficer("#FIRSTNAME# #MIDNAME# #LASTNAME#")#>
				<Cell ss:StyleID="s4" ss:Index="1"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40">#FIRSTNAME# #MIDNAME# #LASTNAME#</Data></Cell>
				<cfelse>
				<Cell ss:Index="1"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40">#FIRSTNAME# #MIDNAME# #LASTNAME#</Data></Cell>
				</cfif>			
			<cfelse>
				<cfif #IsOfficer("#FIRSTNAME# #LASTNAME#")#>
				<Cell ss:StyleID="s4" ss:Index="1"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40">#FIRSTNAME# #MIDNAME# #LASTNAME#</Data></Cell>
				<cfelse>
				<Cell ss:Index="1"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40">#FIRSTNAME# #MIDNAME# #LASTNAME#</Data></Cell>
				</cfif>			
			</cfif>
			<Cell ss:Index="2"><ss:Data ss:Type="String">#SPOUSE#</Data></Cell>
			<Cell ss:Index="3"><ss:Data ss:Type="String">#YPM#</Data></Cell>
			<Cell ss:Index="4"><ss:Data ss:Type="String">#FormatPhoneNumber(HPHONE)#</Data></Cell>
			<Cell ss:Index="5"><ss:Data ss:Type="String">#FormatPhoneNumber(BPHONE)#</Data></Cell>
			<Cell ss:Index="6"><ss:Data ss:Type="String">#FormatPhoneNumber(CPHONE)#</Data></Cell>
			<Cell ss:StyleID="s3" ss:Index="7" ss:HRef="mailto:#EMAIL#"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><I>#EMAIL#</I></Data></Cell>
			<Cell ss:Index="8"><ss:Data ss:Type="String">#CITY# #STATE#</Data></Cell>
         </Row>	
		</cfoutput>
		</cfprocessingdirective>
		</CFLOOP> 
      </Table>
	  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
	   <PageSetup>
	    <Layout x:Orientation="Landscape"/>
		 <Header x:Data="&amp;CPhilo Lodge No. 243&#10;Emergency Call Out List&#10;for the &amp;A&#10;"/>
   		 <Footer x:Data="&amp;C&#10;As of &amp;D"/>
	   </PageSetup>
	   <Print>
	    <ValidPrinterInfo/>
	    <Scale>75</Scale>
	    <HorizontalResolution>600</HorizontalResolution>
	    <VerticalResolution>600</VerticalResolution>
		 <Gridlines/>
	   </Print>
	   <Selected/>
	   <ProtectObjects>False</ProtectObjects>
	   <ProtectScenarios>False</ProtectScenarios>
	  </WorksheetOptions>	  
   </Worksheet>
   </CFLOOP>
</Workbook>


