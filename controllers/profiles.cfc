component accessors=true {
  property profileService;

  function default( struct rc ) {
    param name='rc.page.title' default='Meet our Members' type='string';

    // NOTE: Add Profiles service to the request context.
    rc.profiles = variables.profileService;

    // NOTE: Get all profiles
    rc.allMembers = rc.profiles.getAll();

    // NOTE: Get active profiles.
    rc.activeMembers = rc.profiles.getActive();
  }

}
