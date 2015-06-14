var dataSent={
    "action":"get",
    "questionID":"0002"
}
 var url = "http://140.112.18.201/action.php";

  $.getJSON( url, dataSent)
   .done(function(data) {
        console.log(data);
    });

/*
 $.ajax({
        　　type: "GET",
        　　url: "http://140.112.18.201/action.php",
        　　contentType: "application/json",
        　　dataType: "json",
        　　success: function(output){
                        var str = output.price + "//" + output.note;
        　　　　window.alert(str);
        　　},
        　　error: function(){
        　　　　window.alert("error");
        　　}
 });
*/
function myGetTest(arr){
    var out = "";
    var i;
    for(i = 0; i < arr.length; i++) {
        out += '<a href="' + arr[i].url + '">' + arr[i].display + '</a><br>';
    }
    document.getElementById("id01").innerHTML = out;
}