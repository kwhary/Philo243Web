// --- Set Dates for Calendar Functions --->
var now = new Date();
var formattedToday = dateFormat(now,'mmddyy');

var tempDte = new Date();
var tomorrow = new Date(tempDte.setDate(tempDte.getDate() + 1));//add a day
var formattedTomorrow = dateFormat(tomorrow,'mmddyy');