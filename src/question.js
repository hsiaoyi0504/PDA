var audioPlayer=document.createElement("AUDIO");
document.getElementById("button-1").value="Start";
document.getElementById("button-1").addEventListener("click",start);
for(i=2;i<5;i++){
	document.getElementById("button-"+i).style.visibility="hidden";
}

function start(){
  var dataSent={
    "action":"get",
    "questionID":"0002",
    "songType":"english_fashion"
	}
  var url = "http://140.112.18.201/action.php";

  $.getJSON( url, dataSent)
   .done(function(data) {
   		console.log(data);
   		audioPlayer.src=data.preview_url;
        audioPlayer.load();
   		switch(data.questionDescription){
   			case "1":
   				document.getElementById("question").innerHTML="Which one is the name of this song?";
   			break;
   			case "2":
   			break;
   			case "3":
   			break;
   			default:
   		}
   		document.getElementById("question")
   		for(i=2;i<5;i++){
			document.getElementById("button-"+i).style.visibility="visible";
		}
   		document.getElementById("button-"+1).value=data.choice0;	
        document.getElementById("button-"+2).value=data.choice1;
        document.getElementById("button-"+3).value=data.choice2;
        document.getElementById("button-"+4).value=data.choice3;
        document.getElementById("button-1").removeEventListener("click",start);
        
        audioPlayer.play();
    });
}