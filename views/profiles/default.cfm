<cfoutput><h1>#rc.page.title#</h1>
<section class="profiles">
</cfoutput>

<cfloop from="1" to="#arrayLen(rc.activeMembers)#" index="m">
    <cfoutput><article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="##"><img src="#rc.activeMembers[m].image#" alt="#rc.activeMembers[m].name #"></a>
            </div>
            <div class="ten columns">
                <p>#rc.activeMembers[m].teaser#</br>[ <a href="#buildURL('profiles.profile_1')#">Read more about #rc.activeMembers[m].name# .....  </a>]</p>
            </div>
        </div>
    </article>
</cfoutput>
</cfloop>

<cfoutput>
    <hr>
    <article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="#buildURL('profiles.profile_10')#"><img src="/assets/images/profiles/buddy-thumb.jpg" alt="profile10 image"></a>
            </div>
            <div class="ten columns">
                <p>To me Masonry is so much more then just a title.  It makes you look at life a lot more meaningfully, sort of looking inside oneself and finding the true you. </br>[ <a href="#buildURL('profiles.profile_1')#">Read more about Bud .....  </a>]</p>
            </div>
        </div>
    </article>

    <article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="#buildURL('profiles.profile_9')#"><img src="/assets/images/profiles/davie-thumb.jpg" alt="profile9 image"></a>
            </div>
            <div class="ten columns">
                <p>The ritual works and the lifestyle that comes from giving your word to being a mason has enriched my life.... . [ <a href="#buildURL('profiles.profile_9')#">Read more about Dave .....  </a>]</p>
            </div>
        </div>
    </article>

    <article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="#buildURL('profiles.profile_2')#"><img src="/assets/images/profiles/johnD-thumb.jpg" alt="profile2 image"></a>
            </div>
            <div class="ten columns">
                <p>Our ritual, which has a special place in our Craft, does teach important lessons to those who exemplify it and those who witness it. There are also important lessons that a Brother would learn if he was so inclined to be able to become an officer of the Lodge. [ <a href="#buildURL('profiles.profile_2')#">Read more about John .....  </a>]</p>
            </div>
        </div>
    </article>

    <!---
    <article class="profile panel">
        <div class="row">
            <div class="two columns"><a href="#buildURL('profiles.profile_3')#"><img src="/assets/images/profiles/brianN-thumb.jpg" alt="profile3 image"></a>
            </div>
            <div class="ten columns">
                <p>I try never to forget,  that no matter where I go in life or in the world, I represent the greatest Fraternity in the
    world and will always act accordingly... </br>[ <a href="#buildURL('profiles.profile_3')#">Read more about Brian .....  </a>]</p>
            </div>
        </div>
    </article>
    --->

    <article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="#buildURL('profiles.profile_6')#"><img src="/assets/images/profiles/jim-thumb.jpg" alt="profile6 image"></a>
            </div>
            <div class="ten columns">
                <p>Many go through life wondering what it's all about. Freemasons just get the opportunity to discover more of the answers. [ <a href="#buildURL('profiles.profile_6')#">Read more about Jim .....  </a>]</p>
            </div>
        </div>
    </article>

    <article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="#buildURL('profiles.profile_5')#"><img src="/assets/images/profiles/norm-thumb.jpg" alt="profile5 image"></a>
            </div>
            <div class="ten columns">
                <p>Philo Lodge offers many events to bring in family and friends as well as the necessary funds to support our charitable donations throughout the year
     and support our top notch facilities. [ <a href="#buildURL('profiles.profile_5')#">Read more about Philo Lodge .....  </a>]</p>
            </div>
        </div>
    </article>

    <article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="#buildURL('profiles.profile_7')#"><img src="/assets/images/profiles/mike-thumb.jpg" alt="profile7 image"></a>
            </div>
            <div class="ten columns">
                <p>The remnants of what are presented or left behind can benefit many by uncovering the pieces of wisdom and putting them together.
    No one has all the pieces, but the ones they do have are a special collective meaning that build upon others.</br>[ <a href="#buildURL('profiles.profile_7')#">Read more about Mike.....  </a>]</p>
            </div>
        </div>
    </article>

    <article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="#buildURL('profiles.profile_8')#"></a><img src="/assets/images/profiles/brazil-thumb.jpg" alt="profile8 image"></a>
            </div>
            <div class="ten columns">
                <p>We all bring our special talents,  and these qualities and subtleties reinforce the bonds that build a solid foundation for genuine friendship....</br>[ <a href="#buildURL('profiles.profile_8')#">Read more about Brian .....  </a>]</p>
            </div>
        </div>
    </article>

    <article class="profile panel">
        <div class="row">
            <div class="two columns">
                <a href="#buildURL('profiles.profile_1')#"><img src="/assets/images/profiles/kevin-thumb.jpg" alt="profile1 image"></a>
            </div>
            <div class="ten columns">
                <p>Freemasonry has given me the opportunity to explore the boundaries of my faith by providing practical answers to life's questions.
    It has enhanced and revived my belief in GOD... </br>[ <a href="#buildURL('profiles.profile_1')#">Read more about Kevin .....  </a>]</p>
            </div>
        </div>
    </article>
</section>
</cfoutput>



<!--- NOTE: Profile template
<article class="profile panel">
    <div class="row">
        <div class="two columns">
            <a href="#buildURL('profiles.profile_6')#"><img src="/assets/images/profiles/norm-thumb.jpg" alt="profile6 image"></a>
        </div>
        <div class="ten columns">
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Phasellus commodo pede vel urna. Vivamus adipiscing libero a neque facilisis lobortis. Pellentesque sit amet lectus. Suspendisse potenti.
Suspendisse suscipit aliquam lacus. Cras nec erat non justo hendrerit malesuada. [ <a href="#buildURL('profiles.profile_6')#">More .....  </a>]</p>
        </div>
    </div>
</div>
--->
