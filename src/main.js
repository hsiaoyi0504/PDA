var spotifyApi = new SpotifyWebApi();
spotifyApi.setPromiseImplementation(Q);
document.getElementById("search-button").addEventListener("click", search);
document.getElementById("query").addEventListener("click",hide);
var haveClicked=false;
//document.getElementById("send-button").addEventListener("click", send);
//document.getElementById("clear-button").addEventListener("click", clear);

var searchResult;
function search() {
  var q = $('#query').val();
  // search tracks whose name, album or artist contains 'Love'
  const tracksMaxNum=6;
  spotifyApi.searchTracks(q,{limit: tracksMaxNum})
  .then(function(data) {
//    console.log('Search by ',data);
    for(i=0;i<tracksMaxNum;i++){
      document.getElementById("player"+i).innerHTML=
 //           '完整版:'+'<br>'
 //            +'<iframe src="https://embed.spotify.com/?uri=spotify:track:'+data.tracks.items[i].id+'"'+'width="250" height="80" frameborder="0" allowtransparency="true"></iframe><br>'
             '歌曲'+i+':'+'<br>'
             +'專輯名稱:'+data.tracks.items[i].album.name+'<br>'
             +'歌曲名稱:'+data.tracks.items[i].name+'<br>'
             +'歌曲作者:'+data.tracks.items[i].artists.name+'<br>'
             +'試聽版(30秒版本):'+'<a target="_blank" href="'+data.tracks.items[i].preview_url+'">'+'試聽按此'+'</a>'+'<br>'
             +'試聽版網址:'+'<input id="input'+i+'" value="'+data.tracks.items[i].preview_url+'">'+'</input>'
          //   +'<button id="button'+i+'"'+'onclick="copy('+i+')">Copy</button>'
             +'<br>'+'<br>';
      }
      searchResult=data;
    //  console.log(data);
  }, function(err) {
    console.error(err);
  });
}

function hide(){
  if(haveClicked==false){
    document.getElementById("query").value="";
    haveClicked=true;
  }
}

function send() {
  $.ajax({
    type: "POST",
    url: 'http://140.112.18.201/action.php',
    crossDomain: true,
    data:{
      action:'add',
      songType:document.getElementById("song-type-choice").value,
      questionDescription:document.getElementById("question").value,
      preview_url:searchResult.tracks.items[(document.getElementById("song-choice").value)].preview_url,
      choice0:document.getElementById("choice0").value,
      choice1:document.getElementById("choice1").value,
      choice2:document.getElementById("choice2").value,
      choice3:document.getElementById("choice3").value,
      correctChoice:document.getElementById("correct-choice").value
    },
    success:function(html) {
      alert("Add Data Success");
      history.go(0);
    }
    });
}

function clear() {
  document.getElementById("choice0").value = "";
  document.getElementById("choice1").value = "";
  document.getElementById("choice2").value = "";
  document.getElementById("choice3").value = "";
  document.getElementById("question").value = "";
  document.getElementById("query").value = "";
}

function copy(p){
   // Select the preview link anchor text 
  var copyPreviewLinkBtn = document.querySelector('#button'+p);  
  var previewLink = document.querySelector('#input'+p);  
  var range = document.createRange();  
  range.selectNode(previewLink);  
  window.getSelection().addRange(range);  
    
  //try {  
    // Now that we've selected the anchor text, execute the copy command  
    var successful = document.execCommand('copy');  
    var msg = successful ? 'successful' : 'unsuccessful';  
  //  console.log('Copy previewLink command was ' + msg);  
  //} catch(err) {  
  //  console.log('Oops, unable to copy');  
  //}  
    
  // Remove the selections - NOTE: Should use   
  //removeRange(range) when it is supported
  //removeRange(range);  
  window.getSelection().removeAllRanges();

  //document.getElementById("input"+p).value)
}