<cfscript>

	function rotate_Quote() {
		quoteArray = ArrayNew(1);
		
		quoteArray[1] = "No power on Earth can stop an idea whose time has come.  <cite>Victor Hugo</cite>";
		quoteArray[2] = "Freemasonry A beautiful system of morality, veiled in allegory, and illustrated with symbols...";
		quoteArray[3] = "The Fatherhood of GOD.....The Brotherhood of Man";
		quoteArray[4] = "Religious Acceptance, Political Freedom, Personal Integrity...Freemasonry, It's not for everybody.";
		quoteArray[5] = "The most solemn truths, in the midst of the most innocent social pleasures.";
		quoteArray[6] = "Be the change you want to see in the world.  <cite>Mahatma Gandhi</cite>";
		quoteArray[7] = "No power on Earth can stop an idea whose time has come.  <cite>Victor Hugo</cite>";
		quoteArray[8] = "Ultimately, the only power to which man should aspire is that which he exercises over himself.  <cite>Elie Wiesel - writer and Nobel Peace Prize winner</cite>";
		quoteArray[9] = "We must be willing to give up what we are, for what we can become.... <cite>II Corinthians 5:17</cite>";
		quoteArray[10] = "Associate yourself with men of good quality if you esteem your own reputation. For Tis better be alone than in bad company.<cite>Bro. George Washington</cite>";
		quoteArray[11] ="Let your heart feel for the afflictions and distress of everyone, and let your hand give in proportion to your purse.<cite>Bro. George Washington</cite>";
		quoteArray[12] = "An investment in knowledge pays the best interest. <cite>Bro. Benjamin Franklin</cite>";
		quoteArray[13] = "Be at war with your vices, at peace with your neighbors, and let every new year find you a better man. <cite>Bro. Benjamin Franklin</cite>";
		quoteArray[14] = "Beer is living proof that GOD loves us and wants us to be happy. <cite>Bro. Benjamin Franklin</cite>";
		quoteArray[15] = "I look upon death to be as necessary to our constitution as sleep. We shall rise refreshed in the morning. <cite>Bro. Benjamin Franklin</cite>";
		quoteArray[16] = "All the religions of the world, while they may differ in other respects,unitedly proclaim that nothing lives in this world but Truth.<cite>Mahatma Gandhi</cite>";
		quoteArray[17] = "Each one prays to GOD according to his own light. <cite>Mahatma Gandhi</cite>";
		quoteArray[18] = "One's own religion is after all a matter between oneself and one's Maker and no one else's. <cite>Mahatma Gandhi</cite>";
		quoteArray[19] = "Freemasonry embraces the highest moral laws and will bear the test of any system of ethics or philosophy ever promulgated for the uplift of man. <cite>Bro. General Douglas MacArthur</cite>";
		quoteArray[20] = "The purpose of life is a life of purpose.  <cite>Robert Byrne, author</cite>";
		quoteArray[21] = "Freemasonry is simply a fraternity-an organization of men banded together to further improve themselves ethically and morallyand to benefit the community at large.";
		quoteArray[22] = "When the power of love overcomes the love of power, the world will know peace.<cite>Jimi Hendrix</cite>";
		quoteArray[23] = "Never doubt that a small group of citizens can change the world. Indeed it is the only thing that ever has.  <cite>Margaret Mead</cite>";
		quoteArray[24] = "Tell me, and I'll forget.  Show me, and I may remember.  Involve me, and I'll understand.  <cite>American Indian saying</cite>";
		quoteArray[25] = "Power to do good is the true and lawful end of aspiring.  <cite>Sir Francis Bacon</cite>";
		quoteArray[26] = "When he took time to help the man up the mountain, lo, he scaled it himself.  <cite>Tibetan Proverb</cite>";
		quoteArray[27] = "The discipline of desire is the background of character.  <cite>John Locke</cite>";
		quoteArray[28] = "Labour to keep alive in your breast that little spark of celestial fire,--conscience. <cite>Bro. George Washington</cite>";
		quoteArray[29] = "In matters of style, swim with the current; in matters of principle, stand like a rock.  <cite>Thomas Jefferson</cite>";
		quoteArray[30] = "A difference of opinion does not mean a difference of principles.  <cite>Thomas Jefferson</cite>";
		quoteArray[31] = "The founding principles are the road which alone leads to peace, liberty, and safety. <cite>Thomas Jefferson</cite>";
		quoteArray[32] = "The Tree of Liberty must be refreshed from time to time with the blood of patriots and tyrants  <cite>Thomas Jefferson</cite>";
		quoteArray[33] = "Take away hatred from some people, and you have men without faith. <cite>Eric Hoffer (1902-83), U.S. philosopher.</cite>";
		quoteArray[34] = "Those who would sacrifice liberty for security deserve neither. <cite>Bro. Benjamin Franklin</cite>";
		quoteArray[35] = "Man is his own star; and the soul that can render an honest and a perfect man, commands all light, all influence, all fate....  <cite> John Fletcher (1579-1625)</cite>";
		quoteArray[36] = "Let Go and Let GOD...";
		quoteArray[37] = "What luck for the rulers that men do not think. <cite>Adolf Hitler - Anti-Mason</cite>";
		quoteArray[38] = "The longest journey is the journey inward..... <cite>Dag Hammarskjold, former Secretary-General of the United Nations</cite>";
		quoteArray[39] = "Be a simple kind of man..... <cite>Lynyrd Skynyrd</cite>";
		quoteArray[40] = "The clash of ideas is the sound of Freedom...<cite>Fortune Cookie</cite>";
		quoteArray[41] = "Be still, and know that I am God.....<cite>Psalm 46</cite>";
		quoteArray[42] = "In GOD, all things are possible..<cite>Matthew 19:26</cite>";
		quoteArray[43] = "The invention of the word 'philosophy' is attributed to Pyhtagoras.  He was once asked, 'Are you wise?' and he is said to have answered, 'No, but I am a lover of wisdom'.";
		quoteArray[44] = "The Greek word 'Philo' means love and the word 'sophia' means 'wisdom', Thus 'Philosophy'.";
		quoteArray[45] = "With chiseled touch<br>The stone unhewn and cold<br>Becomes a living mould,<br>The more the marble wastes,<br>The more the statue grows.<cite> Michelangelo</cite>";
		quoteArray[46] = "A man sees in the world what he carries in his heart. <cite>Goethe</cite>";
		quoteArray[47] = "Architecture aims at Eternity. <cite>Sir Christopher Wren</cite>";

		
		//quoteArray[n] = "Bla Bla Bla <cite>Who said that?</cite>";
		
		q = RandRange(1, ArrayLen(quoteArray));

		return quoteArray[q];
	}
</cfscript>