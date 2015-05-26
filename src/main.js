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
//    console.log('Search by ',data);
    for(i=0;i<tracksMaxNum;i++){
      document.getElementById("player"+i).innerHTML=
//      '<pre>'+
            '完整版:'+'<br>'
             +'<iframe src="https://embed.spotify.com/?uri=spotify:track:'+data.tracks.items[i].id+'"'+'width="250" height="80" frameborder="0" allowtransparency="true"></iframe><br>'
             +'專輯名稱:'+data.tracks.items[i].album.name+'<br>'
             +'歌曲名稱:'+data.tracks.items[i].name+'<br>'
             +'試聽版(30秒版本):'+'<a target="_blank" href="'+data.tracks.items[i].preview_url+'">'+'試聽按此'+'</a>';
      }
  }, function(err) {
    console.error(err);
  });
}

function send() {

}

function clear() {
  document.getElementById("choice0").value = "";
  document.getElementById("choice1").value = "";
  document.getElementById("choice2").value = "";
  document.getElementById("choice3").value = "";
  document.getElementById("question").value = "";
  document.getElementById("query").value = "";
}