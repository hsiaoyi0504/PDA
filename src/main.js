var spotifyApi = new SpotifyWebApi();
spotifyApi.setPromiseImplementation(Q);
document.getElementById("search-button").addEventListener("click", search);
document.getElementById("send-button").addEventListener("click", send);
document.getElementById("clear-button").addEventListener("click", clear);

function search() {
  var q = $('#query').val();
  // search tracks whose name, album or artist contains 'Love'
  const tracksMaxNum=5;
  spotifyApi.searchTracks('name:'+q,{limit: tracksMaxNum})
  .then(function(data) {
    console.log('Search by ',data);
    for(i=0;i<tracksMaxNum;i++){
      console.log(i);
      document.getElementById("track"+i).innerHTML=
      '<pre>'+'ID:'+data.tracks.items[i].id+'\n'
             +'Album:'+data.tracks.items[i].album.name+'\n'
             +'Track:'+data.tracks.items[i].name+'\n'+'</pre>'+'<iframe src="https://embed.spotify.com/?uri=spotify:track:'+data.tracks.items[i].id+'"'+'width="250" height="80" frameborder="0" allowtransparency="true"></iframe>';
      }
  }, function(err) {
    console.error(err);
  });
}

function send() {

}

function clear() {
  
}