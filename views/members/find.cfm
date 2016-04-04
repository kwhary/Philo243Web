<!--- <cfinclude TEMPLATE="includes/CheckAuthority.cfm"> --->

<!--- Check to make sure that the user was verified --->
<cfparam name="session.loggedin" default="false" />

<cfif session.loggedin EQ "false">
		<!--- Force a login --->
		<script type="text/javascript">
			$(document).ready(function() {
				$('#loginModal').reveal({  
			     animation: 'fadeAndPop', //fade, fadeAndPop, none  
			     animationspeed: 300, //how fast animations are  
			     closeOnBackgroundClick: true, //if you click background will modal close?  
			     dismissModalClass: 'close-reveal-modal' //the class of a button or element that will close an open modal 
				});  
			});
		</script>
		
	<cfexit>
<cfelse>
	<cfoutput><i class="foundicon-unlock"></i></cfoutput>
	<H5>Member Services - Find a Member</H5>
	<HR WIDTH="100%"><BR>	
	
</cfif>

<cfif url.pass EQ 1>

	<form action="default.cfm?pageType=find&pass=2" method="post">
	  <div class="row">
		    <div class="two mobile-one columns">
		      	<label class="right inline" style="color:white">First Name:</label>
		    </div>
		    <div class="ten mobile-three columns">
		      <input name="FName" id="FName" type="text" placeholder="First Name or part of First Name to search on" class="eight" message="Enter a First Name" maxlength="15" />
		    </div>
	    <p align="center">and / or </p>
	  </div>
	  <div class="row">
		    <div class="two mobile-one columns">
		     	 <label class="right inline" style="color:white">Last Name:</label>
		    </div>
		    <div class="ten mobile-three columns">
		      <input name="LName" id="LName" type="text" placeholder="Last Name or part of Last Name to search on" class="eight" message="Enter a Last Name" maxlength="25" />
		    </div>
	  </div>
	  <p align="center"><input class="radius button" type="submit" value="Find Member" /></p>
		<p>Enter any part of the First or Last name for a global search.<BR/><BR/>
		( i.e. First Name = J &nbsp;&nbsp;returns all first names beginning with "J".  <br/>
		 Last Name = Sm &nbsp;&nbsp; returns all Last names beginning with "Sm" like Smith )
		</p>
	</form>



<cfelse><!---  pass EQ 2 --->
	
	<cfquery DATASOURCE="#application.datasource#" name="findMember">
		 SELECT 
		 	m.rcnm,
			m.lastName, m.firstName, m.midname, m.mst,
			m.address, m.addr2, m.city, m.state, m.zip, 
			m.hphone, m.bphone, m.cphone, m.email,
			m.marry, m.spouse, 
			m.type, m.stats, m.purp, m.died,
			m.ypm, m.rnk, m.glnum, m.glrk,
			edate, fdate, mdate, ypm, pmlodge,
			aowed, yowed, ardu, curdu, req, assd,
			o.glnum as omit_by_request
		FROM memdat m, omit o
		
		WHERE 
		m.stats <> 'rejected'
		AND
		<cfif Len(form.FName) GT 0>
			m.firstName like '#form.FName#%'
			<cfif Len(form.LName) GT 0>
			AND m.lastName like '#form.LName#%'
			</cfif>
		<cfelse>
			<cfif Len(form.LName) GT 0>
			m.lastName like '#form.LName#%'
			<cfelse>
			0 = 1
			</cfif>
		</cfif>
		
		ORDER by m.lastName, m.firstName
		
		
	</cfquery> 
	<cfset thisYear = #dateformat(Now(),'yyyy')#>
	<cfquery DATASOURCE="#application.datasource#" name="current_officers">
		SELECT wml,swl,jwl,trl,scl,sdl,jdl,smcl,jmcl,ssl,jsl,chpl,mshl,tyl,hstl,orgl,pgll
		FROM lodoff
		WHERE rcnm = #thisYear#
	</cfquery>
	<cfif current_officers.RecordCount GT 0>
	<cfset officer_id_list = 
			#current_officers.WML# & "," & 
			#current_officers.SWL# & "," & 
			#current_officers.JWL# & "," & 
			#current_officers.TRL# & "," & 
			#current_officers.SCL# & "," & 
			#current_officers.SDL# & "," & 
			#current_officers.JDL# & "," & 
			#current_officers.SMCL# & "," & 
			#current_officers.JMCL# & "," & 
			#current_officers.SSL# & "," & 
			#current_officers.JSL# & "," & 
			#current_officers.CHPL# & "," & 
			#current_officers.MSHL# & "," & 
			#current_officers.TYL# & "," & 
			#current_officers.HSTL# & "," & 
			#current_officers.ORGL#>
	<cfelse>
		<cfoutput>Officer data table Error - Contact Lodge Secretary</cfoutput>
		<cfabort>
	</cfif>
	<cfif findMember.RecordCount GT 0>
		
		<cfoutput>
		<ul>
			<li><A href="default.cfm?pageType=find&pass=1">Find Another</a></li>
		</ul>

		<h5><FONT COLOR="##ffffff"><em>There <cfif #findMember.Recordcount# NEQ 1>are<cfelse>is</cfif> #findMember.Recordcount# Member<cfif #findMember.Recordcount# NEQ 1>s</CFIF> matching your search.</em></font></h5>
		</cfoutput>
		<ul class="accordion">
			<cfoutput QUERY="findMember"> 
				<cfif #omit_by_request# NEQ #GLNUM# ><!--- not omitted by request --->
				<li>
					<div class="title">
					  <h5>#firstName# <cfif Len(#midname#)eq 1>#midname#.<cfelse>#midname#</cfif> #lastName# &nbsp;&nbsp;( #mid(type,1,1)# )</h5>
					</div>
					<div class="content">
						
						<ul STYLE="list-style-type: none">
							<cfif ListLen(#officer_id_list#) GT 0>
								<cfif listFind(#officer_id_list#, #rcnm# )>
								<li>Lodge Officer: &nbsp; Yes</li>
								</cfif>
							</cfif>
							<cfif #stats# is not "Good">
								<li>[<FONT COLOR="##00FFFF" SIZE="-1"> #stats# 
									<cfif #stats# is "suspended">- #purp#</cfif>
									<cfif #stats# is "deceased"> #DateFormat("#died#","mm-dd-yyyy")#</cfif></FONT> ]
								</li>
							</cfif>								
							<cfif #marry# EQ 'married'>
								<li>Spouse Name: <FONT COLOR="##00FFFF" SIZE="-1">#spouse#</FONT></li>
							</cfif>
							<li>#address#, #addr2#<br> #city#, #state#, #FormatZip(zip)#</li>
							<li>Home: #FormatPhoneNumber(hphone)#<cfif #bphone# is not ""><br/>Bus: #FormatPhoneNumber(bphone)#</cfif>
							<cfif #cphone# is not ""><br/>Cell: #FormatPhoneNumber(cphone)#</cfif></li>
							<cfif #email# is not "">
								<li>e-mail: <a href="mailto:#email#">#email#</a></li>
							</cfif>												
						
							<cfif session.adminUser eq "Y">
								<hr>
								<li><STRONG>Member Type :</STRONG> #type# - <STRONG>Standing :</STRONG> #stats# </li>
								<li><strong>Member Number:</strong>&nbsp;&nbsp;<font COLOR="##FFFF80">#GLNUM#</font></li>
								<hr>
								<li><STRONG>EA :</STRONG> #DateFormat(edate, "mmmm d, yyyy")# </li>
								<li><STRONG>FC :</STRONG> #DateFormat(fdate, "mmmm d, yyyy")# </li>
								<li><STRONG>MM :</STRONG> #DateFormat(mdate, "mmmm d, yyyy")# </li>
								<cfif #ypm# is not "">
									<li><STRONG>PM :</STRONG> #ypm# - #pmlodge#</li>
								</cfif>
								<!--- <cfdirectory action="list" directory="D:\home\philolodge.net/db" filter="Memdat.mdb" name="fileInfo"> --->
								<hr>			
								<li>Dues Status Last Updated <font COLOR="##FFFF80"><cfinclude template="../db/lastUpdate.txt"></font></li>
								<li><STRONG>Dues Required : </STRONG><font COLOR="##FFFF80"><STRONG>#req#</font></STRONG> &nbsp;&nbsp;<STRONG>G.L. Assessment :</STRONG> <STRONG><font COLOR="##FFFF80">#assd#</font></STRONG></li>
								<li><STRONG>Past Due Amt :</STRONG>  &nbsp;<font COLOR="##FFFF80">#DollarFormat(ardu)#</font></li>
								<li><STRONG>Current Due :</STRONG> &nbsp;#DollarFormat(curdu)#</li>
								<li><STRONG>Total Due :</STRONG> <cfif #yowed# GT 1><font COLOR="##FFFF80">&nbsp;#DollarFormat(aowed)#</font><cfelse>&nbsp;#DollarFormat(aowed)#</cfif> - <cfif #yowed# GT 1><font COLOR="##FFFF80">(#yowed#)</font><cfelse>(#yowed#)</cfif> years </li>																
							</cfif><!---  Admin view --->
						</ul><!--- content ul --->
					</div><!--- div content --->
				</li>
				<cfelse><!--- OMIT THE MEMBERSHIP INFORMATION FROM VIEWING ONLINE --->
				<li>
					<div class="title">
					  <h5>#firstName# <cfif Len(#midname#)eq 1>#midname#.<cfelse>#midname#</cfif> #lastName# &nbsp;&nbsp;( #mid(type,1,1)# )</h5>
					</div>
					<div class="content">
					<ul STYLE="list-style-type: none">
						<cfif #cookie.userid# EQ #glnum#><!--- If current user doing the lookup, show his information --->
							<li><FONT color="##8080FF">Your personal details are hidden from other users <br>per your request.</FONT><br />
								<FONT color="##8080FF">If this is incorrect, please contact the <a class="info" href="mailto:secretary@philolodge.net?subject=From The Website [member omitted]">Lodge Secretary</a></FONT>
							</li>
							<li>#firstName# <cfif Len(#midname#)eq 1>#midname#.<cfelse>#midname#</cfif> #lastName# &nbsp;&nbsp;( #mid(type,1,1)# )  
							<cfif #stats# is not "Good">
								<li>[<FONT COLOR="##00FFFF" SIZE="-1"> #stats# 
									<cfif #stats# is "suspended">- #purp#</cfif>
									<cfif #stats# is "deceased"> #DateFormat("#died#","mm-dd-yyyy")#</cfif></FONT> ]
								</li>
							</cfif>												
							<li>#address#, #addr2#<br> #city#, #state#, #FormatZip(zip)#</li>
							<li>Home: #FormatPhoneNumber(hphone)#<cfif #bphone# is not ""><br/>Bus:#FormatPhoneNumber(bphone)#</cfif>
							<cfif #cphone# is not ""><br/>Cell:#FormatPhoneNumber(cphone)#</cfif></li>
							<cfif #email# is not "">
								<li>e-mail: <a href="mailto:#email#">#email#</a></li>
							</cfif>	
													
						<cfelse>
							<li><FONT color="##8080FF">Membership details withheld by member request.</FONT></li>
							<cfif #stats# is not "Good">
								<li>[<FONT COLOR="##00FFFF" SIZE="-1"> #stats# 
									<cfif #stats# is "suspended">- #purp#</cfif>
									<cfif #stats# is "deceased"> #DateFormat("#died#","mm-dd-yyyy")#</cfif></FONT> ]
								</li>
							</cfif>														
						</cfif>
					</ul>
					</div><!--- content --->
				</li>
				</cfif><!--- not omitted --->
			</cfoutput><!--- output query --->
		</ul><!--- end accordian --->		
		
	<cfelse>
		<br/><P>No Member records found !</P>
	</cfif>

	<br/>
	<UL>
		<LI><a href="default.cfm?pageType=find&pass=1" id="findMember">Find Another</a></LI>
	</UL>

</cfif>

