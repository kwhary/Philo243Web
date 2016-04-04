<cfinclude TEMPLATE="includes/CheckAuthority.cfm">

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
	
	<H5>Constitution - The Level Club of South River</H5>
	<HR><BR>	
	
</cfif>


<DIV CLASS="CENTER">
<H5>Table of Contents </H5>

<FONT SIZE=2>
<P>(Click on a link below to jump to that section of document)</P></FONT>

<BR>

<UL CLASS="LEFT">
		<LI><A HREF="#ARTICLE-I">Article I - Name </A> </LI> 
		<LI><A HREF="#ARTICLE-II">Article II - Purpose </A></LI>
		<LI><A HREF="#ARTICLE-III">Article III - Membershp  </A></LI>
		<LI><A HREF="#ARTICLE-IV">Article IV - Officers </A></LI>
		<LI><A HREF="#ARTICLE-V">Article V - Meetings  </A></LI>
		<LI><A HREF="#ARTICLE-VI">Article VI - Amendments   </A></LI>
		<LI><A HREF="#ARTICLE-VII">Article VII - DISSOLUTION   </A></LI>
</UL>	
<BR>
</DIV>
<HR>
<DIV ALIGN="center">
<A NAME="ARTICLE-I"></A>
<H5>ARTICLE I. - NAME</H5><BR>
<P>This Club shall be known as and called ;<br>
<EM><STRONG>THE LEVEL CLUB of SOUTH RIVER, N.J.</STRONG></EM></P>
</DIV>

<DIV ALIGN="center">
<A NAME="ARTICLE-II"></A>
<H5>ARTICLE II. - PURPOSE</H5><BR>
<P align="left">	The purpose of this club shall be to promote social activities among Freemasons and as set forth in the papers of incorporation.</P>
</DIV>

<DIV ALIGN="center">
<A NAME="ARTICLE-III"></A>
<H5>ARTICLE III. - MEMBERSHIP</H5><BR>
<H5 class="section">Section 1.</H5><P align="left"> Membership shall consist of all members in good standing of <br>Philo Lodge No. 243 F. & A.M..  Each member shall be entitled to one vote.</P>

<H5 class="section">Section 2.</H5> <P align="left">Associate membership may be granted by majority ballot to any sojourning Mason in good standing.  Associate membership will carry no voting privilege. </P>

</DIV>

<DIV ALIGN="center">
<A NAME="ARTICLE-IV"></A>
<H5>ARTICLE IV. - OFFICERS</H5><BR>
<H5 class="section">Section 1.</H5> <P align="left">The Officers of the Level Club shall consist of a President, First Vice President, Second Vice President, Secretary, Treasurer, and five Trustees.  All officers and one trustee shall be elected by ballot at each annual January meeting.</P>

<H5 class="section">Section 2.</H5> <P align="left">All elected officers are to serve a term of one year, except the trustee, who is elected to a term of five years.</P>

<H5 class="section">Section 3.</H5> <P align="left">The President, First Vice President, Second Vice President, and Trustee can serve only two consecutive elected terms in the same office.  Thereafter he must be elected to a different office or drop out for a least one year, after which he is eligible for election to any office.</P>

<P align="left">The Secretary and Treasurer, after each term of office, may seek re-election to that office indefinitely.</P>

<H5 class="section">Section 4.</H5><P align="left"> In the event of a vacancy in the office of President, the First Vice President automatically becomes President; a vacancy in the office of First Vice President is filled by the Second Vice President automatically.  A vacancy in any other office shall be filled by Presidential appointment, until the next annual election.</P>

<H5 class="section">Section 5.</H5><P align="left"> "THE HOUSE COMMITTEE" shall be comprised of the President, First Vice President, Second Vice President, Secretary, Treasurer, Trustees, Chairman of the Beverage Committee, Auditorium Chairman and Kitchen Manager. </P>
<P>( Amended April 20, 1971 to include Auditorium and Kitchen manager)</P>

</DIV>

<DIV ALIGN="center">
<A NAME="ARTICLE-V"></A>
<H5>ARTICLE V. - MEETINGS</H5><BR>
<H5 class="section">Section 1</H5><P align="left"> The Club shall meet regularly on the third Tuesday of each month at 8:00 P.M.</P>

<H5 class="section">Section 2.</H5> <P align="left">The regular meeting in January shall be the Annual Meeting to hear reports of all officers and standing committees, and for the election of officers.</P>
<H5 class="section">Section 3.</H5><P align="left"> Regular meetings of "THE HOUSE COMMITTEE" shall be held at 7:00 P.M. on the third Tuesday of every month prior to the Level Club Meeting, and special meetings shall be held at such times as the President may deem necessary.</P>
<P>( Amended May 18 1999 to move meeting to Third Tuesday @ 7pm )</P>

</DIV>

<DIV ALIGN="center">
<A NAME="ARTICLE-VI"></A>
<H5>ARTICLE VI. - AMMENDMENTS</H5><BR>
	<P align="left">Proposed amendments to the Constitution and / or it's supporting By-laws must be submitted in writing at any regular meeting of the Club.  These proposed amendments shall be submitted to the Trustees for study and consideration.

	The Trustees must report their recommendations at the next regular meeting, and at the next subsequent meeting the recommendations must be announced again, then voted upon.

	Should the Trustees fail to report at the next regular meeting, the President must read the proposed amendment or amendments at that meeting and the next subsequent meeting, and then put it to vote.

Approval requires two-thirds majority or the members present.</P>
 
</DIV>

<DIV ALIGN="center">
<A NAME="ARTICLE-VII"></A>
<H5>ARTICLE VII. - DISSOLUTION</H5><BR>
<P align="left">Be it resolved that upon the dissolution of the Level Club of South River, or sale of such property held by the Level Club of South River, said Club, or it's successor, shall repay Philo Lodge No. 243 F. & A.M. (or the Grand Lodge 
F. & A.M. of New Jersey, if Philo Lodge is non-existent) such proportion of the then total assets of said Club as the assets received from Philo Lodge bore to the assets received from all sources.
</P>
</DIV>




