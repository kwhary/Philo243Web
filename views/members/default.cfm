<!--- <cfdump VAR="#session#" EXPAND="yes"> --->

<!--- <cfinclude TEMPLATE="includes/CheckAuthority.cfm"> --->

<!--- Check to make sure that the user was verified --->

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
	<H5>Member Services</H5>
	<HR WIDTH="100%">	
	<CFOUTPUT><H5>Welcome #session.MST# #session.lname# ! </H5></CFOUTPUT>
</cfif>

<cfquery DATASOURCE="#application.datasource#" name="getMember">
	 SELECT
		lastName, firstName, midname, mst,
		address, addr2, city, state, zip, 
		spouse,marry,hphone, bphone, cphone, email,
		type, edate, fdate, mdate, stats, 
		ypm, pmlodge, rnk, glnum, glrk,
		aowed, yowed, ardu, curdu, req, assd
	FROM memdat 
	WHERE glnum = '#session.UserID#'
</cfquery>


<ul class="accordion"> 
  <li>
    <div class="title">
      <h5 style="color:white">View your Philo Lodge No. 243 Membership Details</h5>
    </div>
    <div class="content">
		<cfoutput>
		<ul STYLE="list-style-type: none">
			<LI><STRONG>#getMember.mst# #getMember.firstName# #getMember.midname# #getMember.lastName# <cfif #getMember.glrk# eq 'N/A'><cfelse>#getMember.glrk#</cfif> </STRONG></LI>
			<cfif #getMember.marry# EQ 'married'><LI><STRONG>Spouse Name: </STRONG><font COLOR="##FFFF80">#getMember.spouse#</FONT></LI></cfif>
			<LI>#getMember.address# #getMember.addr2# </LI>
			<LI>#getMember.city#, #getMember.state#  &nbsp;&nbsp; #FormatZip(getMember.zip)#</LI>
			<LI>Home:#FormatPhoneNumber(getMember.hphone)# <cfif #getMember.bphone# is not ""><br/>Bus:#FormatPhoneNumber(getMember.bphone)#</cfif><cfif #getMember.cphone# is not ""><br/>Cell:#FormatPhoneNumber(getMember.cphone)#</cfif></LI>
			<LI>e-mail:&nbsp; #getmember.email#</LI>
		</ul>
		<hr>
		<ul STYLE="list-style-type: none">
			<li><STRONG>Lodge Officer :</STRONG> <font COLOR="##FFFF80">#session.Is_Officer#</font> </li>
			<li><STRONG>Member Type :</STRONG> <font COLOR="##FFFF80">#getMember.type#</font> - <STRONG>Standing :</STRONG> <font COLOR="##FFFF80">#getMember.stats#</font> </li>
			<hr>
			<li><STRONG>EA :</STRONG> #DateFormat(getMember.edate, "mmmm d, yyyy")# </li>
			<li><STRONG>FC :</STRONG> #DateFormat(getMember.fdate, "mmmm d, yyyy")# </li>
			<li><STRONG>MM :</STRONG> #DateFormat(getMember.mdate, "mmmm d, yyyy")# </li>
			<cfif #getMember.city# is not "">
			<li><STRONG>PM :</STRONG> #getMember.ypm# - #getMember.pmlodge#</li>
			</cfif>
		</ul>
		<!--- <cfdirectory action="list" directory="D:\home\philolodge.net/db" filter="Memdat.mdb" name="fileInfo"> --->
		<!--- <cfdirectory action="list" directory="../" filter="Memdat.mdb" name="fileInfo"> --->
		<!--- <cfdump var="#fileInfo#" expand="no"> --->
		<hr>
		<ul CLASS="smallcaps" STYLE="list-style-type: none">Your Dues Status was Last Updated on <font COLOR="##FFFF80">
		<cfinclude template="../db/lastUpdate.txt"></font>
			<!--- #DateFormat(parseDateTime(fileInfo.dateLastModified),"mmmm dd, yyyy")# --->
			<li><STRONG>Dues Required : </STRONG><font COLOR="##FFFF80"><STRONG>&nbsp;#getMember.req#</STRONG></font> &nbsp;&nbsp;<STRONG>G.L. Assessment :</STRONG><font COLOR="##FFFF80"><STRONG>&nbsp;#getMember.assd#</STRONG></font></li>
			<li><STRONG>Past Due Amt :</STRONG>  &nbsp;<font COLOR="##FFFF80">#DollarFormat(getMember.ardu)#</font></li>
			<li><STRONG>Current Due :</STRONG> &nbsp;#DollarFormat(getmember.curdu)#</li>
			<li><STRONG>Total Due :</STRONG> <cfif #getMember.yowed# GT 1><font COLOR="##FFFF80">&nbsp;#DollarFormat(getMember.aowed)#</font><cfelse>&nbsp;#DollarFormat(getMember.aowed)#</cfif> - <cfif #getMember.yowed# GT 1><font COLOR="##FFFF80">(#getMember.yowed#)</font><cfelse>(#getMember.yowed#)</cfif> years </li>
		</ul>
		</cfoutput>	
    </div>
  </li>
  <li>
    <div class="title">
      <h5>Member Lookup</h5>
    </div>
    <div class="content">
    	<UL>
			<LI><a href="default.cfm?pageType=find&pass=1" id="findMember">Lookup a Member's Address, Phone Number and Email Information.</a></LI>
      </UL>
    </div>
  </li>   
    
 <cfif session.adminUser eq "Y">
	<CFQUERY NAME="GetReports" DATASOURCE="#application.datasource#">
		 SELECT sum(num_attending) AS how_many
		 FROM RSVP
	</CFQUERY>	 
  <li>
    <div class="title">
      <h5>Reports</h5>
    </div>
    <div class="content">
    	<UL>
		<cfif #GetReports.RecordCount# GT 0>
			<cfoutput>
			<li>Total Table Lodge RSVPs = #GetReports.how_many#</li>
			</cfoutput>
		</cfif>
		<li><A  href="http://www.philolodge.net/RSVP_Report.cfm" target="_blank">Download Full Table Lodge RSVP Report (MS-Excel)</a></li>
      </UL>
    </div>
  </li>   
</cfif>   
  <li>
    <div class="title">
      <h5>Officer Documents</h5>
    </div>
    <div class="content">
		<UL>
			<li><A  href="documents/OfficerStuff/callout2015.pdf?TB_iframe=true&height=700&width=800">Emergency Call Out (2015) (PDF)</a></li>
			<LI><A href="default.cfm?pageType=b">Lodge By-Laws</a></LI>
			<!--- <LI><A href="default.cfm?pageType=min">Meeting Minutes</a></LI>
			<LI><A href="default.cfm?pageType=r">Secretary Reports ( Fiduciary / Annual )</a></LI>--->			
			<li><A  href="documents/OfficerStuff/Cipher.pdf?TB_iframe=true&height=700&width=800">Download Ritual Cipher (2006) [1.13 M)</a></li>

			<LI>Click CIPHER to open larger view.<br>
			<div>
			<object style="width:300px;height:566px" ><param name="movie" value="http://static.issuu.com/webembed/viewers/style1/v1/IssuuViewer.swf?mode=embed&amp;viewMode=presentation&amp;layout=http%3A%2F%2Fskin.issuu.com%2Fv%2Fdark%2Flayout.xml&amp;showFlipBtn=true&amp;documentId=100208201522-a2bb8630524a4e0896bcf5bb0ed308d9&amp;docName=nj_ritual_cipher&amp;username=kwhary&amp;loadingInfoText=NJ%20Ritual%20Cipher&amp;et=1265661458311&amp;er=22" />
			<param name="allowfullscreen" value="true"/><param name="menu" value="false"/><embed src="http://static.issuu.com/webembed/viewers/style1/v1/IssuuViewer.swf" type="application/x-shockwave-flash" allowfullscreen="true" menu="false" style="width:300px;height:566px" flashvars="mode=embed&amp;viewMode=presentation&amp;layout=http%3A%2F%2Fskin.issuu.com%2Fv%2Fdark%2Flayout.xml&amp;showFlipBtn=true&amp;documentId=100208201522-a2bb8630524a4e0896bcf5bb0ed308d9&amp;docName=nj_ritual_cipher&amp;username=kwhary&amp;loadingInfoText=NJ%20Ritual%20Cipher&amp;et=1265661458311&amp;er=22" /></object>
			</div>
			</LI>
		</UL>
    </div>
  </li>  
   <li>
    <div class="title">
      <h5>Candidate Examination Documents</h5>
    </div>
    <div class="content">
		<UL>
			<LI><A  href="documents/OfficerStuff/EnteredApprenticeExam2010.pdf?TB_iframe=true&height=700&width=800">Entered Apprentice Examination (2010 Short Form)  (PDF)</a></LI>
			<LI><A  href="documents/OfficerStuff/EA-Exam-LongForm.pdf?TB_iframe=true&height=700&width=800">Entered Apprentice Examination Booklet (Long Form) (PDF)</a></LI>
			<HR width="75%">
			<LI><A  href="documents/OfficerStuff/FellowcraftExam2010.pdf?TB_iframe=true&height=700&width=800">Fellowcraft Examination (2010 Short Form) (PDF)</a></LI>
			<LI><A  href="documents/OfficerStuff/FC-Exam-LongForm.pdf?TB_iframe=true&height=700&width=800">Fellowcraft Examination Booklet (Long Form) (PDF)</a></LI>
			<HR width="75%">
			<LI><A  href="documents/OfficerStuff/MasterMasonExam2010.pdf?TB_iframe=true&height=700&width=800">Master Mason Examination (2010 Short Form) (PDF)</a></LI>
		</UL>
    </div>
  </li>  
  <li>
    <div class="title">
      <h5>Membership Petition and Committee Documents</h5>
    </div>
    <div class="content">
    	<UL>
			<LI><A  href="documents/forms/Petition.pdf?TB_iframe=true&height=700&width=800">Petition for Membership</a></LI>
			<LI><A  href="documents/forms/ReportOfCommittee(Form O).pdf?TB_iframe=true&height=650&width=800">Committee of Investigation form (Form O)</a></LI>
			<LI><A  href="documents/forms/CommitteeLetter.pdf?TB_iframe=true&height=700&width=800">Committee of Investigation - Letter to references</a></LI>
      </UL>
    </div>
  </li>  
  <li>
    <div class="title">
      <h5>Level Club Documents</h5>
    </div>
    <div class="content">
    	<UL>
			<LI><A href="default.cfm?pageType=lb">Level Club By-Laws</a></LI>
			<LI><A href="default.cfm?pageType=lc">Level Club Constitution</a></LI>
      </UL>
    </div>
  </li>  
  <li>
    <div class="title">
      <h5>Grand Lodge Documents</h5>
    </div>
    <div class="content">
	<UL>
		<LI><a href="http://www.njmasons.com/documents/CONSTITUTION2013.pdf">Grand Lodge Constitution and By-Laws (2013)</a></LI>
	</UL>    
	<UL>
		<LI><A  href="documents/AlcoholicBeveragePolicy.pdf?TB_iframe=true&height=700&width=800">Grand Lodge Alcoholic Beverage Policy (Sept. 2009)</a></LI>
	</UL>

    </div>
  </li>    
</ul><!--- end accordion --->

