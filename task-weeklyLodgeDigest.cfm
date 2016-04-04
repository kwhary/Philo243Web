<!-- This sets the initial task, if your just wanting to set the schedule -->
<cfschedule action = "update"
    task = "weeklyLodgeDigest" 
    operation = "HTTPRequest"
    url = "http://www.philolodge.net/theDigest.cfm"
    startDate = "5/19/2012"
    startTime = "11:59 PM"
    interval = "Weekly"
    resolveURL = "Yes"
    requestTimeOut = "600">

<!---- url = "http://www.philolodge.net/LodgeDigest.cfm" ---->
<!-- This allows for the task created to be deleted, just uncomment and change the task name. -->
<!-- cfschedule action = "delete"
    task = "LodgeDigest"-->

<!-- This allows for the task to be paused, just uncomment and change the task name. -->
<!-- cfschedule action = "pause"
    task = "LodgeDigest"-->

<!-- This allows for the task resumed if paused, just uncomment and change the task name. -->
<!-- cfschedule action = "resume"
    task = "LodgeDigest"-->
