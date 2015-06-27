<?php
	header("Access-Control-Allow-Origin: *");
	if($_POST['action'] == 'add') {
		add();
	}
	if($_GET['action'] == 'get') {
		getQuestion();
	}
	else if($_GET['action'] == 'get3'){
		get3Question();
	}
	function add(){
		include("connMysql.php");
		$sql_query = "INSERT INTO `english_fashion` (`questionDescription` ,`preview_url`,`choice0` ,`choice1` ,`choice2` ,`choice3` ,`correctChoice`) VALUES (";
		$sql_query .= "'".$_POST["questionDescription"]."',";
		$sql_query .= "'".$_POST["preview_url"]."',";
		$sql_query .= "'".$_POST["choice0"]."',";
		$sql_query .= "'".$_POST["choice1"]."',";
		$sql_query .= "'".$_POST["choice2"]."',";
		$sql_query .= "'".$_POST["choice3"]."',";
		$sql_query .= "'".$_POST["correctChoice"]."')";
//		echo $_POST["questionDescription"];
//		echo $_POST["trackID"];
//		echo $sql_query;
		$result=mysqli_query($link,$sql_query);
		//重新導向回到主畫面
		//header("Location: data.php");	
		if($result==false){
			echo "false";
			printf("Errormessage: %s\n", mysqli_error($link));
		}
	}
	function getQuestion(){
		include("connMysql.php");
		header('Content-Type:application/json; charset=utf-8');
		$sql_query="SELECT * FROM `english_fashion` WHERE `questionID`="."'".$_GET["questionID"]."'";
		$result=mysqli_query($link,$sql_query);
		$questionArray=array();
		while($row=mysqli_fetch_assoc($result)){
			$questionArray=$row;
		}
//		print_r($questionArray);
		$json=json_encode($questionArray);
		echo $json;
	}
	function get3Question(){
		include("connMysql.php");
		header('Content-Type:application/json; charset=utf-8');
		$sql_query1="SELECT * FROM `english_fashion` WHERE `questionID`="."'".$_GET["questionID1"]."'";
		$sql_query2="SELECT * FROM `english_fashion` WHERE `questionID`="."'".$_GET["questionID2"]."'";
		$sql_query3="SELECT * FROM `english_fashion` WHERE `questionID`="."'".$_GET["questionID3"]."'";
		$result1=mysqli_query($link,$sql_query1);
		$result2=mysqli_query($link,$sql_query2);
		$result3=mysqli_query($link,$sql_query3);
		$questionArray1=array();
		$questionArray2=array();
		$questionArray3=array();
		while($row=mysqli_fetch_assoc($result1)){
			$questionArray1=$row;
		}
		while($row=mysqli_fetch_assoc($result2)){
			$questionArray2=$row;
		}
		while($row=mysqli_fetch_assoc($result3)){
			$questionArray3=$row;
		}
		$result['questions']=array($questionArray1,$questionArray2,$questionArray3);
		$json=json_encode($result);
		echo $json;
	}
?>

