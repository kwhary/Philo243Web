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
	
	<H5>Lodge By-Laws</H5>
	<HR><BR>	
	
</cfif>

<DIV CLASS="CENTER">
<H5>Table of Contents </H5>

<FONT SIZE=2>
<P>(Click on a link below to jump to that section of document)</P></FONT>

<UL CLASS="LEFT">
		<LI><A HREF="#ARTICLE-I">Article I - Communications </A> </LI> 
		<LI><A HREF="#ARTICLE-II">Article II - Officers </A></LI>
			<UL>
				<LI><A HREF="#A2S1">Section 1. - Elective Officers</A></LI>
				<LI><A HREF="#A2S2">Section 2. - Appointive Officers</A></LI>
				<LI><A HREF="#A2S3">Section 3. - Board of Trustees</A></LI>
				<LI><A HREF="#A2S4">Section 4. - Nomination of Officers</A></LI>
				<LI><A HREF="#A2S4A">Section 4-A - Election of Officers</A></LI>
				<LI><A HREF="#A2S5">Section 5. - Eligibility</A></LI>
				<LI><A HREF="#A2S6">Section 6. - Duties of Officers</A></LI>
					<UL>
						<LI><A HREF="#A2S6A">Part A. - All Officers</A></LI>
						<LI><A HREF="#A2S6B">Part B. - Treasurer</A></LI>
						<LI><A HREF="#A2S6C">Part C. - Secretary</A></LI>
						<LI><A HREF="#A2S6D">Part D. - Board of Trustees</A></LI>
						<LI><A HREF="#A2S6E">Part E. - Tyler</A></LI>
					</UL>
				<LI><A HREF="#A2S7">Section 7. - Compensation of Officers</A></LI>
			</UL>
		<LI><A HREF="#ARTICLE-III">Article III - Committees </A></LI>
			<OL>
				<LI><A HREF="#A3S1">Standing Committee</A></LI>
				<LI><A HREF="#A3S2">Relief Committee</A></LI>
				<LI><A HREF="#A3S3">Auditing Committee</A></LI>
			</OL>
		<LI><A HREF="#ARTICLE-IV">Article IV - Membership </A></LI>
			<UL>
				<LI><A HREF="#A4S1">Section 1. - Dues</A></LI>
				<LI><A HREF="#A4S2">Section 2. - Arrears</A></LI>
				<LI><A HREF="#A4S3">Section 3. - Initiation Fee</A></LI>
				<LI><A HREF="#A4S4">Section 4. - Petitioner</A></LI>
				<LI><A HREF="#A4S5">Section 5. - Renewal of Petition</A></LI>
			</UL>
		<LI><A HREF="#ARTICLE-V">Article V - Amendments </A></LI>
</UL>	
</DIV>


	<TABLE ALIGN="CENTER" WIDTH="100%" BORDER="1">
	<TD>
		<A NAME="COVER">		
		<DIV ALIGN="center">
		
		<H5>Philo Lodge No. 243 F&amp;AM</H5>
		<H5>South River, N.J.</H5>
		<H5>BY-LAWS</H5>
		<FONT FACE="Arial"SIZE="2" COLOR="white">Under Dispensation, November 28, 1922<BR>
		<H5>Warrant Issued April 18, 1923<BR>
		Instituted May 2, 1923</H5></FONT><BR>
		<FONT SIZE="2">(Made available on the Web March 1999)<br>
		Last Revised October 2014</FONT>
		</DIV>
	</TD>
	</TABLE>

<DIV ALIGN="center">
<A NAME="ARTICLE-I"></A>
<H5>ARTICLE I.<BR>COMMUNICATIONS</H5>
</DIV>

<DIV ALIGN="Left">
<P class="byLawsLeft">Regular communications are held on the second and fourth Tuesdays of each month except during the months of July and August, legal holidays, the evening before Memorial Day, the fourth Tuesday in December, and the Tuesday during the week of the Annual Communication of Grand Lodge.</P>

<P class="byLawsLeft"> The hour of opening shall be 7:30 o'clock P.M. The Worshipful Master may in his discretion, open stated communications up to one hour earlier provided that due and timely notice be given each member and that no business is transacted until the regular hour of opening.</P>
</DIV>
<HR><BR>
<DIV ALIGN="center"><A NAME="ARTICLE-II"></A>
<H5>ARTICLE II.<BR>OFFICERS</H5>
</DIV><BR>

<A NAME="A2S1"></A>
<H5 class="section">Section 1 - Elective Officers</H5>

<P class="byLawsLeft">The elective officers of this Lodge shall be Worshipful Master, Senior Warden, Junior Warden, Treasurer and Secretary.</P>

<A NAME="A2S2"></A>
<H5 class="section">Section 2 - Appointive Officers</H5>

<P class="byLawsLeft">The appointive officers shall be a Chaplain, Senior and Junior Deacons, Senior and Junior Masters of Ceremonies, Senior and Junior Stewards, Marshall, Organist, Historian and Tyler.</P>

<A NAME="A2S3"></A>
<H5 class="section">Section 3 - Board of Trustees</H5>
<P class="byLawsLeft">The Board of Trustees shall consist of three members, one of whom shall be elected for one year, one for two years and one for three years, and thereafter at each annual communication, one Trustee shall be elected for a term of three years. (No officer except a Warden shall be elected for the office of Trustee.)</P>

<A NAME="A2S4"></A>
<H5 class="section">Section 4 - Nomination of Officers</H5>
<P class="byLawsLeft">At the first regular November Communication of the Lodge, the Worshipful Master shall open the floor for the purpose of accepting nominations for the Elected Officers of the Lodge for the ensuing Masonic Year. The Secretary shall place the ballot box upon his table, wherein any member of the Lodge may place nominations for any or all of the elective officers which nominations shall be read for the information of the Lodge. <br>(Approved by the Grand Master 2014)
</P>
<A NAME="A2S4A"></A>
<H5 class="section">Section 4A - Election of Officers </H5>
<P class="byLawsLeft">At the second regular November Communication of the Lodge, the Secretary shall read the names of those nominated for the elective officers of the lodge for the ensuing Masonic year and shall place the ballot box upon his table, wherein any member of the Lodge may place their ballots for any or all of the elective officers previously nominated.  The officers shall be chosen separately by ballot, a majority of the votes cast being necessary for a choice.</P>

<P class="byLawsLeft">The Worshipful Master shall appoint three tellers to canvass the ballot and they shall announce the result. When there are more than two candidates for the same office, after a second ballot the one having the lowest number of votes shall be dropped and so continue with each ballot until a choice shall be made. <br>(Approved by the Grand Master 2014)
</P>

<A NAME="A2S5"></A>
<H5 class="section">Section 5 - Eligibility</H5>
<P class="byLawsLeft">No brother shall be eligible to an office unless he be present to signify his acceptance or has authorized some brother to accept for him.</P>

<A NAME="A2S6"></A>
<H5 class="section">Section 6 - Duties of Officers</H5>

<A NAME="A2S6A"></A>
<H5 class="section">Part A - All Officers</H5>
<P class="byLawsLeft">The duties of all officers shall be in accordance with the regulations  of the Grand Lodge. Also, it shall be the duty of all appointed officers to be present at every communication of the Lodge.</P>
 
<A NAME="A2S6B"></A>

<H5 class="section">Part B - Treasurer</H5>
<P class="byLawsLeft">In addition thereto it shall be the duty of the Treasurer to receive all moneys from the Secretary and receipt therefor and deposit same in a bank or trust company designated by the Lodge, pay all warrants drawn on him by the authority of the Lodge, and in the name of the Lodge duly signed by the Worshipful Master and attested by the Secretary; submit a full and detailed report annually at the first stated communication in January and deliver to his successor in office all books, papers, vouchers, and other property of the Lodge pertaining to his office and all funds in his hands within ten days after the installation of his successor.</P>

<A NAME="A2S6C"></A>
<H5 class="section">Part C - Secretary</H5>

<P class="byLawsLeft">It shall be the duty of the Secretary to keep a correct record of all the  proceedings of the Lodge; write all things proper to be written; to receive all Moneys due the Lodge and pay the same to the Treasurer, taking the receipt therefor; to perform all duties prescribed by the Grand Lodge; to notify all committees appointed by the Worshipful Master; to communicate to all members of special committees of investigation the residence of all candidates proposed for membership; to produce the documents of the body for reference at all regular communications when ordered to do so by the Worshipful Master; to render a full and detailed report annually at the first regular  communications in January. He shall deliver to his successor in office all property of the Lodge in his possession within ten days after the installation of his successor.</P>

<A NAME="A2S6D"></A>
<H5 class="section">Part D- Board of Trustees</H5>
<P class="byLawsLeft">It shall be the duties of the Trustees to care for, insure,preserve and maintain in proper repair the property of the Lodge in their charge. Each and every investment by the Trustees shall be made after written resolution shall have been signed by the Trustees or a majority of their number and approved by the Worshipful Master and attested by the Secretary of the Lodge. Funds invested by the Trustees may be invested in such securities as those in which savings of fiduciary institutions of the State of New Jersey may lawfully invest funds. No loans or investments shall be made in mortgages.</P>


<A NAME="A2S6E"></A>
<H5 class="section">Part E - Tyler</H5>
<P class="byLawsLeft">It shall be the duty of the Tyler, in addition to the requirements of the Grand Lodge, to arrange and keep in good order the regalia, jewels, aprons and all other property of the Lodge in his care.</P>

<A NAME="A2S7"></A>
<H5 class="section">Section 7 - Compensation of Officers</H5>
<P class="byLawsLeft">The compensation to any officers may be defined by resolution at the annual communication of the Lodge.</P>

<HR>
<A NAME="ARTICLE-III"></A>
<DIV ALIGN="center">
<H5>ARTICLE III.<BR>COMMITTEES</H5></DIV>

<P class="byLawsLeft">The Worshipful Master shall appoint the following committees:</P>

	<OL>
		<A NAME="A3S1"></A>
			<LI><P class="byLawsLeft">A <B><I>Standing Committee</I></B> of three, through whom the supplies shall be ordered, and by whom
   			all bills of indebtedness shall be audited.</P></LI>
   		<A NAME="A3S2"></A>
			<LI><P class="byLawsLeft">A <B><I>Relief Committee</I></B> of three, who shall officiate as almoners.</P></LI>
		<A NAME="A3S3"></A>
			<LI><P class="byLawsLeft">An <B><I>Auditing Committee</I></B> of three, not holding other office, whose duty shall be to 
			examine the books of the Treasurer, Secretary, and Trustees, and report in writing 
			upon the correctness of the same at the next stated communication after the reports 
			of said officers have been received, and at such time as directed.</P></LI>
	</OL>

<HR>
<DIV ALIGN="center">
<A NAME="ARTICLE-IV"></A>
<H5>ARTICLE IV.<BR>MEMBERSHIP</H5></DIV>


<A NAME="A4S1"></A>
<H5 class="section">Section 1 - Dues</FONT></H5>
<P class="byLawsLeft">The annual dues shall be <I>One Hundred and Twenty-Five dollars ($125.00)</I>, plus Grand Lodge Assessment, payable in advance. <br> (Approved by Grand Master, 2005 )</P>

<P class="byLawsLeft">Dues for those becoming members of Philo Lodge will be pro-rated from the date of raising or affiliation.</P>

<P class="byLawsLeft">In the event of a member demitting, that part of the dues not earned by the lodge will be refunded.</P>


<A NAME="A4S2"></A>
<H5 class="section">Section 2 - Arrears</H5>
<P class="byLawsLeft">Any member who shall become twelve months in arrears and who shall refuse or neglect to pay the same within three months after demand therefor has been made by the Secretary may be suspended in accordance with the 15th General Regulation.</P>

<A NAME="A4S3"></A>
<H5 class="section">Section 3 - Initiation Fee</H5>
<P class="byLawsLeft">The initiation fee shall be Two-Hundred and Eighty dollars ($ 280.00) of which <I>One-Hundred and Thirty dollars ($ 130.00 )</I> shall accompany the petition and the balance shall be paid prior to the initiation. There shall also be paid by the candidate such sum as the Grand Lodge shall determine as the initial contribution to charity to be applied specifically to the Maintenance of the Masonic Home and Charity Foundation fund and such fee required to cover the costs of a criminal background check. <br> (Approved by Grand Master, 2011) </P>

<A NAME="A4S4"></A>
<H5 class="section">Section 4 - Petitioner</H5>

<P class="byLawsLeft">A petitioner elected and failing to present himself for initiation within three months after having been requested to do so shall forfeit said election unless by a majority vote of the Lodge taken previously to the expiration of such period the time shall be extended.</P>

<A NAME="A4S5"></A>
<H5 class="section">Section 5 - Renewal of Petition</H5>
<P class="byLawsLeft">Any applicant whose petition shall have been rejected may not renew such petition until at least three months shall have elapsed from the date of the rejection.</P>

<HR>
<DIV ALIGN="center"><A NAME="ARTICLE-V"></A>
<H5>ARTICLE V.<BR>AMENDMENTS</H5></DIV>

<P class="byLawsLeft">These by-laws shall not be altered or amended unless such proposed alteration or amendment shall be submitted in writing at a regular communication of the Lodge and action thereon postponed until the next stated communication and all members have been notified thereof. A majority of the members present favoring the alteration or amendment shall be necessary for adoption.</P>
<HR>





