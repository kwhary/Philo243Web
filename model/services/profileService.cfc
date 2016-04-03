component accessors=true {
  function getAll() {
    // NOTE: Hard code our quote data since there's no table for it.
    data = arrayNew(1);

    data[1] = {'id':1,'name':'Johnny D.', 'image':'/assets/images/profiles/JohnDProfile400x209.jpg'};
    data[2] = {'id':2,'name':'Jim Thoth.', 'image':'/assets/images/profiles/JTothProfile400x209.jpg'};
    // data[n] = {'id':n,'name':'full name', 'image':'path/to/image'};

    return data;
  }

  function random() {
    quotes = getAll();
    return quotes[randRange(1, arrayLen(quotes))];
  }

  function getJSON() {
    return renderData( 'json', getAll() );
  }

  function getJXML() {
    return renderData( 'xml', getAll() );
  }

}
