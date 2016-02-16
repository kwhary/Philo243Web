<!--- <cfinclude TEMPLATE="includes/CheckAuthority.cfm"> --->

<!--- Check to make sure that the user was verified --->
<!--- <cfset bLoggedIn = False> --->
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
	
	<H5>Level Club By-Laws</H5>
	<HR><BR>	
	
</cfif>

<DIV CLASS="CENTER">
<H5>Table of Contents </H5>

<FONT SIZE=2>
<P>(Click on a link below to jump to that section of document)</P></FONT>

<BR>

<UL CLASS="LEFT">
		<LI><A HREF="#ARTICLE-I">Article I - Membership </A> </LI> 
		<LI><A HREF="#ARTICLE-II">Article II - Dues,Fees and Bank Accounts </A></LI>
		<LI><A HREF="#ARTICLE-III">Article III - Duties of Officers  </A></LI>
		<LI><A HREF="#ARTICLE-IV">Article IV - Quorum </A></LI>
		<LI><A HREF="#ARTICLE-V">Article V - Order of Business  </A></LI>
		<LI><A HREF="#ARTICLE-VI">Article VI - PARLIMENTARY AUTHORITY   </A></LI>
</UL>	
<BR>
</DIV>
<HR>
<DIV ALIGN="center">
<A NAME="ARTICLE-I"></A>
<H5>ARTICLE I. - MEMBERSHIP</H5><BR>
</DIV>
<DIV ALIGN="Left">

	<H5 class="section">Section 1.</H5><P>Membership shall consist of all members in good standing of Philo Lodge No. 243 F. & A.M..  Each member shall be entitled to one vote.</P>
	<H5 class="section">Section 2.</H5><P>Associate non-voting memberships may be granted to any sojourning Masons in good standing by majority vote of the Club.</P>
	
</DIV>
<BR><HR>
<DIV ALIGN="center">
<A NAME="ARTICLE-II"></A>
<H5>ARTICLE II. - Dues Fees and Bank Accounts</H5>
</DIV>
<DIV ALIGN="Left">


		<H5 class="section">Section 1.</H5><P>There shall be no initiation fee.</P>
		<H5 class="section">Section 2.</H5> <P>Annual dues are determined to be the Temple Assessment collected from Philo Lodge No. 243 F&AM.
								( Amended May 18 1999 to include Temple Assessment )</P>
		<H5 class="section">Section 3.</H5><P>An interest bearing SAVINGS ACCOUNT and a CHECKING ACCOUNT shall be established in a local bank.</P>
			<OL type=a>
				<LI><P>Deposited into these accounts will be the Temple Assessment collected from Philo Lodge No. 243 F&AM, donations toward the building from Philo Lodge, Phila Chapter, the Level Club, and other moneys received from individuals or groups which are designated as Temple funds.
						( Amended May 18 1999 to include Temple Assessment )</P></LI>
				<LI> <P>The amount of the maximum balance in the checking account shall be established by the HOUSE COMMITTEE.  All excess money shall be deposited in the interest bearing account.</P></LI>
				<LI> <P>All checks must be signed by the President and Treasurer.</P></LI>
				<LI><P> By consent of the HOUSE COMMITTEE, special bank accounts may be opened and maintained by various committees.  These special accounts shall be the responsibility of the Level Club, and any withdrawals from such accounts must be co-signed by the President.  
				Upon dissolution of any committee with a special bank account, all records and moneys of that committee must be turned over to the Level Club.</P></LI>
				<LI> <P>All Special Books and Bank Accounts must be audited at the end of each calendar year and before the next annual January meeting.  ( amended July 18, 1972 )</P>
			</OL>
		<H5 class="section">Section 4.</H5><P>A Temple Assessment shall be generated and sent to the Treasurer of Philo Lodge No. 243 F&AM on a
 				"Quarterly Basis"  for the purpose of helping to defray the Temple Expenses. </P>
			<OL type=a>
				<LI><P>The amount of the Temple Assessment shall be determined by the "House Committee". </P></LI>
				<LI><P>The Temple Assessment shall be generated and sent to the Treasurer of Philo Lodge No. 243 F&AM on a 
					"Quarterly Basis" in the following months;<BR>
						March, June, September December<BR>
						( Article II - Section 4 - Added May 18 1999 )</P></LI>
			</OL>
	

</DIV><BR>
<HR>
<DIV ALIGN="center">
<A NAME="ARTICLE-III"></A>
<H5>ARTICLE III. - Duties of Officers</H5>
</DIV>
<DIV ALIGN="Left">

		<H5 class="section">Section 1. -  President</H5>
			<P> The President shall preside at all meetings of the Club and the "HOUSE COMMITTEE" at which he is present.  He shall exercise a general supervision over the affairs and activities of the Club, and shall serve as an ex officio member of all committees he may appoint to serve the Club.</P>
		<H5 class="section">Section 2. - Vice President</H5>
			<P>The First Vice President shall assume all the duties of the President during his absence or inability to serve, and shall be Chairman of the Entertainment Committee.
													<BR><BR>
												 The Second Vice President shall assume the duties of the President in his absence if the First Vice President  is not present, and shall be Chairman of the Membership Committee.  The duties of this committee shall be to explain the Level Club to all newly raised brethren.</P>
		<H5 class="section">Section 3. - Secretary</H5>
			<P>The Secretary shall keep full and accurate minutes of all the meeting of the club and 'HOUSE COMMITTEE", and shall conduct all correspondence in the name of the Club.</P>
			
		<H5 class="section">Section 4. - Treasurer </H5>
				<UL>
					<LI><P CLASS="full">The Treasurer shall receive and deposit all moneys of the Club and pay all bills.  He must be prepared to give a full and accurate report of all transactions at each regular meeting and when requested to do so by the President.</P>
					<LI><P CLASS="full">All mandatory utilities and maintenance bills in connection with the property shall be paid without the necessary vote of the Club.  All other bills need the consent of the Club before payment. </P> 
					<LI><P CLASS="full">All books and bank accounts must be audited at the end of each calendar year and before the next annual January meeting.<BR>
					(amended July 18, 1972)</P>
				</UL><BR>
		<H5 class="section">Section 5. - Trustees</H5>
				<UL>
					<LI><P CLASS="full">The five Trustees serve as a board for the consideration and recommendation of changes to our Constitution and By-laws, and also to act on any special assignments given them by the President.</P>
					<LI><P CLASS="full">As members of "THE HOUSE COMMITTEE", they will act as a steering committee and assist in the general planning and management of the Club.</P>
				</UL><BR>
		<H5 class="section">Section 6. - House Committee</H5>
				<UL>
					<LI><P CLASS="full">It is the duty of the HOUSE COMMITTEE to manage the affairs of the Level Club and the Temple.  The President, or presiding officer, shall give a resume of its meeting at the succeeding regular meeting of the Club.</P>
				</UL>
	
</DIV>
<HR>
<DIV ALIGN="center">
<A NAME="ARTICLE-IV"></A>
<H5>ARTICLE IV. - Quorum</H5>
</DIV>
<DIV ALIGN="Left">
		<H5 class="section">Section 1.</H5>
				<P>The President, or the First Vice President, or the Second Vice President, and at least eight regular members shall constitute a quorum for the transaction of business at a regular meeting of the Club.<BR><BR></P>
		<H5 class="section">Section 2.</H5>
				<P>A majority of the members shall constitute a quorum for a meeting of the HOUSE COMMITTEE.</P>
</DIV>
<HR>
<DIV ALIGN="center">
<A NAME="ARTICLE-V"></A>
<H5>ARTICLE V. - Order of Business</H5>
</DIV>
<DIV ALIGN="Left">

	<UL><P>The order of business at all regular meetings shall be as follows:</P>
		<OL>
			<LI><P CLASS="FULL">Call to Order.</P></LI>
			<LI><P CLASS="FULL">Reading of the minutes of the previous meeting.</P></LI>
			<LI><P CLASS="FULL">Treasurer's report.</P></LI>
			<LI><P CLASS="FULL">Report of other officers and committees.</P></LI>
			<LI><P CLASS="FULL">Bills and Communications.</P></LI>
			<LI><P CLASS="FULL">Unfinished Business.</P></LI>
			<LI><P CLASS="FULL">New Business.</P></LI>
			<LI><P CLASS="FULL">Adjournment.</P></LI>
		</OL>
	</UL>
</DIV>
<HR>
<DIV ALIGN="center">
<A NAME="ARTICLE-VI"></A>
<H5>ARTICLE VI. - PARLIMENTARY AUTHORITY</H5>
</DIV>
<DIV ALIGN="Left">
<P>
	Robert's Rules of Order shall be the parliamentary authority of the Club.
</P>
</DIV>
