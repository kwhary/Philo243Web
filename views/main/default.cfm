<cfscript>
  quotesData = rc.quotes.getData();
  writeDump(var=quotesData, expand=false)
</cfscript>

<cfoutput>Hello #rc.name#!</cfoutput>

<!--- Three-up Content Blocks --->

<!--- <cfinclude template="../../layouts/main/contentBlocks.cfm"> --->
<div class="row">
  <div class="four columns mobile-two">
    <!--- <img class="hide-for-small" src="assets/images/columnHeader1-400x209.png" /> --->
    <img class="hide-for-small" src="assets/images/columnHeader7-400x209.png" />
    <h5 class="index">Upcoming Events &nbsp;&nbsp;<i class="foundicon-calendar" style="color:white"></i></h5>
    <!--- <cfinclude template="UpcomingEvents.cfm">--->
    <!--- <script type="text/javascript" src="https://apis.google.com/js/client.js?onload=buildCalendar(6,'#application.calendarID#','main')"> --->
    <!--- <cfinclude template="UpcomingEventsIframe.cfm"> --->
    <cfoutput>#view('events/upcoming/UpcomingEventsIframe')#</cfoutput>
  </div>

  <div class="four columns hide-for-small">
    <div id="ProfileFader" class="hide-for-small">
      <img src="assets/images/blankProfile400x209.jpg" /><!--- background image with no profile image --->

      <a data-caption="#profile2" href="default.cfm?pageType=p&profile=2"><img src="assets/images/JohnDProfile400x209.jpg" /></a>
      <a data-caption="#profile5" href="default.cfm?pageType=p&profile=5"><img src="assets/images/SocialTraditions400x209.jpg" /></a>
      <a data-caption="#profile6" href="default.cfm?pageType=p&profile=6"><img src="assets/images/JTothProfile400x209.jpg" /></a>
      <a data-caption="#profile7" href="default.cfm?pageType=p&profile=7"><img src="assets/images/MikeAProfile400x209.jpg" /></a>
      <a data-caption="#profile8" href="default.cfm?pageType=p&profile=8"><img src="assets/images/BWharyProfile400x209.jpg" /></a>
      <a data-caption="#profile9" href="default.cfm?pageType=p&profile=9"><img src="assets/images/DavieProfile400x209.jpg" /></a>
      <a data-caption="#profile10" href="default.cfm?pageType=p&profile=10"><img src="assets/images/BudProfile400x209.jpg" /></a>

      <a data-caption="#profile1" href="default.cfm?pageType=p&profile=1"><img src="assets/images/KWharyProfile400x209.jpg" /></a>

      <!--- <img data-caption="#profile3" src="http://placehold.it/400x209&text=[profile 3]" /> --->

      <span class="orbit-caption" id="profile1">Read about Kevin</span>
      <span class="orbit-caption" id="profile2">Read about Johnny D</span>
      <span class="orbit-caption" id="profile5">Philo's Social Traditions</span>
      <span class="orbit-caption" id="profile6">Read about Jim</span>
      <span class="orbit-caption" id="profile7">Read about Michael</span>
      <span class="orbit-caption" id="profile8">Read about Brian</span>
      <span class="orbit-caption" id="profile9">Read about Dave</span>
      <span class="orbit-caption" id="profile10">Read about Bud</span>
    </div>

    <h5 align="center" class="hide-for-small"><a href="default.cfm?pageType=pi">Member Profiles</a> <i class="foundicon-page" style="color:white"></i></h5>

    <!--- NOTE: Rotate the quotations --->
    <div id="quoteSlider" class="panel radius hide-for-small">

    <!--- // NOTE: Random Quotes --->
    <cfloop from="1" to="10" index="quote">
        <cfoutput><div>
        <blockquote>
          <p class="profileLeft">#rc.quotes.random()#</p>
        </blockquote>
      </div>
      </cfoutput>
    </cfloop>

    </div>

    <div class="panel radius hide-for-small">
      <!--- Call to Action Panel --->
      <h5 class="indexSub">Interested in Membership ?</h5>

      <p align="center" class="index">Find out more.&nbsp;&nbsp;</p>
      <!--- http://vimeo.com/55453612 --->
      <!--- <div class="flex-video widescreen vimeo">
        <iframe src="http://player.vimeo.com/video/55453612?title=0&amp;byline=0&amp;portrait=0" width="400" height="225" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
      </div>--->
      <p><a href="mailto:secretary@philolodge.net?subject=From The Website [Membership Inquiry]">Contact Us&nbsp;&nbsp;<i class="foundicon-mail" style="color:white"></i></a>
      </p>
    </div>

    <div class="panel radius hide-for-small">
      <h5 class="indexSub">Why Freemasonry ?</h5>
      <ul class="none">
        <li><a href="default.cfm?pageType=religion">Statement on Freemasonry and Religion</a></li>
        <li><a href="default.cfm?pageType=reasons">Should I join ?</a></li>
        <li><a href="default.cfm?pageType=because">I am a Freemason because...</a></li>
      </ul>
    </div>

    <div class="panel radius hide-for-small">
      <h5 class="indexSub">Follow Us on Facebook<a target="_blank" href="http://www.facebook.com/pages/Philo-Lodge-No-243-FAM/104775649554798"><IMG src="assets/images/facebook.jpg" alt="follow on facebook"/></a></h5>
    </div>

    <div class="panel radius hide-for-small">
      <cfset ThisMonth = #DateFormat("#Now()#","mmmm yyyy")#>
      <h5 class="indexSub">Philo's Masonic Birthdays<br>for <cfoutput>#ThisMonth#</cfoutput>
      <font style="font-size:small;"><br />(Raised as a Master Mason)</font></h5>
      <!--- <cfinclude template="ThisMonthsMasonicBirthdays.cfm"> --->
      <!--- <cfoutput>#view('events/ThisMonthsMasonicBirthdays')#</cfoutput> --->

    </div>
  </div>

  <div class="four columns mobile-two">
    <img class="hide-for-small" src="assets/images/columnHeader9-400x209.png" />
    <h5  class="index">Items of Note &nbsp;&nbsp;<i class="foundicon-calendar" style="color:white"></i></h5>

    <!--- <cfinclude template="LevelClubCalendarIframe.cfm"> --->
    <cfoutput>#view('events/LevelClubCalendarIframe')#</cfoutput>

  </div>
</div>
