<cfscript>
	// NOTE: views/tests/debug/Session.cfm
	lock timeout=20 scope="session" type="exclusive" {
		session.loggedin = false;
		session.UserID = '';
		session.FName = '';
		session.LName = '';
		session.MST = '';
		session.Password = '';
	};

	writeDump(var=session, expand=false, label='Session Scope');
</cfscript>
