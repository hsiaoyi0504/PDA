<?php
	header("Access-Control-Allow-Origin: *");
	if($_POST['action'] == 'add') {
		add();
	}
	if($_GET['action'] == 'get') {
		getQuestion();
	}
	function add(){
		include("connMysql.php");
		$sql_query = "INSERT INTO `main` (`questionDescription` ,`trackID`,`choice0` ,`choice1` ,`choice2` ,`choice3` ,`correctChoice`) VALUES (";
		$sql_query .= "'".$_POST["questionDescription"]."',";
		$sql_query .= "'".$_POST["trackID"]."',";
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
		$sql_query="SELECT * FROM `main` WHERE `questionID`="."'".$_GET["questionID"]."'";
		$result=mysqli_query($link,$sql_query);
		$questionArray=array();
		while($row=mysqli_fetch_assoc($result)){
			$questionArray=$row;
		}
		$json=json_encode($questionArray);
		echo $json;
	}
?>

