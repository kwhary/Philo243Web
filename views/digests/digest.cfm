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


					<!--- Content loop gets built here --->			
					

					</table>
				
				</div><!--- /content --->

				<div class="content">
				<!--- BIRTHDAYS --->
				<table id="birthdays" class="social" bgcolor="" border=1>
					<tr>
						<td class="container">
							
								<!--- content --->
								<div class="content">
									<table id="birthdayBlock" border=0>
									
														<!--- Masonic dates get build here --->

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