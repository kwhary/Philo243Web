<cfcomponent output="true">

<cffunction access="remote" name="getMemberDates" returntype="query" hint="returns member birthday info">

		<cfquery DATASOURCE="lodge_members" name="getBirthdays">
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

	<cfreturn getBirthdays />

</cffunction>

<!---
<cffunction name="outPutDigest" access="private" output="true" returntype="string">

	<cfsavecontent variable="digestHTML">

		<cfoutput>

		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html>
		<head>
		<!--- If you delete this meta tag, the ground will open and swallow you. --->
		<meta name="viewport" content="width=device-width" />

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Inside the Lodge</title>

		<link rel="stylesheet" type="text/css" href="http://www.philolodge.net/stylesheets/email.css" >

		</head>

		<body bgcolor="##FFFFFF" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">

		<!--- HEADER --->
		<table class="head-wrap" bgcolor="##000000">
			<tr>
				<td></td>
				<td class="header container" align="">

					<!--- /content --->
					<div class="content">
						<table bgcolor="##00000" >
							<tr>
								<td><img src="http://www.philolodge.net/images/mailheader.png" /></td>
								<td align="right"><h6 align="center" class="collapse" style="color:##215B84">Events of the Lodge<br>for week of #DateFormat(Now(),  "mmmm dd yyyy" )#</h6></td>
							</tr>
						</table>
					</div><!--- /content --->

				</td>
				<td></td>
			</tr>
		</table><!--- /HEADER --->

		<!--- BODY --->
		<table class="body-wrap" bgcolor="">
			<tr>
				<td></td>
				<td class="container" align="" bgcolor="##FFFFFF">

					<!--- content --->
					<div class="content">
						<table bgcolor="" id="tblWrapper">


						<!--- Content loop gets dynamically built here --->


						</table>

					</div><!--- /content --->

					<div class="content">
					<!--- BIRTHDAYS --->
					<table id="birthdays" class="social" bgcolor="" border=1>
						<tr>
							<td class="container">

									<!--- content --->
									<div class="content">
										<table border=0>
										<tr><th colspan=2 id="birthday_title">Masonic Birthdays for #DateFormat("#getBirthdays.current_date#","mmmm")#</th></tr>

											<cfloop index="bd" from="1" to="#arrayLen(getBirthdays)#">
												<tr>
													<td align="right">#bd.mst# #bd.firstName# #bd.lastName# - </td>
													<td align="left"> <strong>#bd.AdjustedYears#</strong> years - Raised #DateFormat('#bd.mdate#','mm-dd-yyyy')#</td>
												</tr>
											</cfloop>
											<cfif #getBirthdays.recordCount#>
													<tr><td colspan=2 id="congrats" align="center"><br><strong>Congratulations Brethren !</strong></td></tr>
											</cfif>

										</table>
									</div><!--- /content --->

							</td>
						</tr>
					</table><!--- /BIRTHDAYS --->
					</div><!--- /content --->

					<!--- content --->
					<div class="content">
						<table bgcolor="">
							<tr>
								<td>

									<!--- social & contact --->
									<table bgcolor="" class="social" width="100%">
										<tr>
											<td>

												<!--- column 1 --->
												<div class="column">
													<table bgcolor="" cellpadding="" align="left">
														<tr>
														<td>

														<h5 class="">Connect with Philo Lodge:</h5>
														<p class=""><a href="https://www.facebook.com/Philo-Lodge-No-243-FAM-104775649554798/" class="soc-btn fb">Facebook</a></p>

														</td>
														</tr>
													</table><!--- /column 1 --->
												</div>

												<!--- column 2 --->
												<div class="column">
													<table bgcolor="" cellpadding="" align="left">
												<tr>
													<td>

														<h5 class="">Contact Info:</h5>
														<p>Phone: <strong>732.254.9867</strong><br/>
		                Email: <strong><a href="emailto:secretary@philolodge.net">secretary@philolodge.net</a></strong></p>

													</td>
												</tr>
											</table><!--- /column 2 --->
												</div>

												<div class="clear"></div>

											</td>
										</tr>
									</table><!--- /social & contact --->

								</td>
							</tr>
						</table>
					</div><!--- /content --->


				</td>
				<td></td>
			</tr>
		</table><!--- /BODY --->

		<!-- FOOTER -->
		<table class="footer-wrap">
			<tr>
				<td></td>
				<td class="container">

						<!--- content --->
						<div class="content">
							<table>
								<tr>
									<td align="center">
										<p>
											<a href="http://www.philolodge.net">Philo Lodge No. 243 Free & Accepted Masons | South River NJ </a>
										</p>
									</td>
								</tr>
							</table>
						</div><!--- /content --->

				</td>
				<td></td>
			</tr>
		</table><!--- /FOOTER --->

		</body>
		</html>

	</cfoutput>

	<cfreturn digestHTML>
</cffunction>
--->




</cfcomponent>
