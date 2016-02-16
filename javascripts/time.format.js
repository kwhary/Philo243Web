
function formatTimeHHMMA(d) {  // convert the date formatting
	  function z(n){return (n<10?'0':'')+n}
	  var h = d.getHours();
	  return (h%12 || 12) + ':' + z(d.getMinutes()) + ' ' + (h<12? 'AM' :'PM');
}