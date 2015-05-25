var spotifyApi = new SpotifyWebApi();
spotifyApi.setPromiseImplementation(Q);
document.getElementById("search-buttons").addEventListener("click", myFunction);

function search() {
  var q = $('#query').val();
  // search tracks whose name, album or artist contains 'Love'
  spotifyApi.searchTracks(q,{limit: 5})
  .then(function(data) {
    console.log('Search by'+q, data);
  }, function(err) {
    console.error(err);
  });
/*
  request.execute(function(response) {
    var str = JSON.stringify(response.result);
    $('#search-container').html('<pre>' + str + '</pre>');
  });
*/
}