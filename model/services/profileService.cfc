component accessors=true {
  function getAll() {
    // NOTE: Hard code our quote data since there's no table for it.
    data = arrayNew(1);

    data[1] = {
        'id':1,
        'active':1,
        'bio':'Lorem ipsum Dolor dolore ullamco exercitation voluptate dolor sint sint non reprehenderit eu minim reprehenderit veniam irure do dolore exercitation mollit dolore et ut aliquip dolore enim pariatur laborum dolore.',
        'image':'/assets/images/profiles/JohnDProfile400x209.jpg',
        'name':'Johnny D.',
        'teaser':'Our ritual, which has a special place in our Craft, does teach important lessons to those who exemplify it and those who witness it. There are also important lessons that a Brother would learn if he was so inclined to be able to become an officer of the Lodge.'
    };
    data[2] = {
        'id':2,
        'active':1,
        'bio':'Lorem ipsum Dolor dolore ullamco exercitation voluptate dolor sint sint non reprehenderit eu minim reprehenderit veniam irure do dolore exercitation mollit dolore et ut aliquip dolore enim pariatur laborum dolore.',
        'image':'/assets/images/profiles/JTothProfile400x209.jpg',
        'name':'Jim Thoth.',
        'teaser':'Many go through life wondering what it''s all about. Freemasons just get the opportunity to discover more of the answers.'
    };
    data[3] = {
        'id':3,
        'active':0,
        'bio':'Lorem ipsum Dolor dolore ullamco exercitation voluptate dolor sint sint non reprehenderit eu minim reprehenderit veniam irure do dolore exercitation mollit dolore et ut aliquip dolore enim pariatur laborum dolore.',
        'image':'/assets/images/profiles/JTothProfile400x209.jpg',
        'name':'Jim Thoth (Inactive)',
        'teaser':'Many go through life wondering what it''s all about. Freemasons just get the opportunity to discover more of the answers.'
    };
    // data[n] = {
    //     'id':n,
    //     'active':1,
    //     'bio':'Lorem ipsum Dolor dolore ullamco exercitation voluptate dolor sint sint non reprehenderit eu minim reprehenderit veniam irure do dolore exercitation mollit dolore et ut aliquip dolore enim pariatur laborum dolore.',
    //     'image':'/assets/images/profiles/n-profile400x209.jpg',
    //     'name':'Name n',
    //     'teaser':'Lorem ipsum Dolore ut exercitation in sit qui enim commodo ea velit culpa officia ut in esse laboris eu laboris.'
    // };

    return data;
  }

  function getActive() {
    profiles = getAll();
    active = [];

    // NOTE: Loop over all profiles to find the active ones.
    // FIXME: This should be a query to a db.
    for ( i=1; i lte arrayLen(profiles); i++ ) {
        if ( profiles[i].active ) {
            arrayAppend(active, profiles[i]);
        }
    }

    // NOTE: Return only active profiles.
    return active;
  }

  function random() {
    profiles = getAll();
    return profiles[randRange(1, arrayLen(profiles))];
  }

  function getJSON() {
    return renderData( 'json', getAll() );
  }

  function getJXML() {
    return renderData( 'xml', getAll() );
  }

}
