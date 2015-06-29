<?php
	header("Access-Control-Allow-Origin: *");
	if(isset($_POST['action'])) {
		if($_POST['action']=='add')
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
		switch($_POST["songType"]){
			case "1":
				$sql_dataTable="english_fashion";
			break;
			case "2":
				$sql_dataTable="english_oldies";
			break;
			case "3":
				$sql_dataTable="chineese_fashion";
			break;
			case "4":
				$sql_dataTable="chineese_oldies";
			break;
			case "5":
				$sql_dataTable="classical";	
			break;
			default:
				$sql_dataTable="english_fashion";
		}
		$sql_query = "INSERT INTO ".$sgl_dataTable." (`questionDescription` ,`preview_url`,`choice0` ,`choice1` ,`choice2` ,`choice3` ,`correctChoice`) VALUES (";
		$sql_query .= "'".$_POST["questionDescription"]."',";
		$sql_query .= "'".$_POST["preview_url"]."',";
		$sql_query .= "'".$_POST["choice0"]."',";
		$sql_query .= "'".$_POST["choice1"]."',";
		$sql_query .= "'".$_POST["choice2"]."',";
		$sql_query .= "'".$_POST["choice3"]."',";
		$sql_query .= "'".$_POST["correctChoice"]."')";
		$result=mysqli_query($link,$sql_query);
		//重新導向回到主畫面
		//header("Location: data.php");	
		if($result==false){
			echo "false";
			printf("Errormessage: %s\n", mysqli_error($link));
		}
		else
			echo "true";
		echo("<script>console.log('PHP:'); </script>");
	}
	function getQuestion(){
		include("connMysql.php");
		header('Content-Type:application/json; charset=utf-8');
		switch($_GET["songType"]){
			case "1":
				$sql_dataTable="english_fashion";
			break;
			case "2":
				$sql_dataTable="english_oldies";
			break;
			case "3":
				$sql_dataTable="chineese_fashion";
			break;
			case "4":
				$sql_dataTable="chineese_oldies";
			break;
			case "5":
				$sql_dataTable="classical";
			break;
			default:
				$sql_dataTable="english_fashion";
		}
		$sql_query="SELECT * FROM ".$sql_dataTable." WHERE `questionID`="."'".$_GET["questionID"]."'";
		$result=mysqli_query($link,$sql_query);
		$questionArray=array();
		while($row=mysqli_fetch_assoc($result)){
			$questionArray=$row;
		}
		$json=json_encode($questionArray);
		echo $json;
	}
	function get3Question(){
		include("connMysql.php");
		header('Content-Type:application/json; charset=utf-8');
		switch($_POST["songType"]){
			case "1":
				$sql_dataTable="english_fashion";
			break;
			case "2":
				$sql_dataTable="english_oldies";
			break;
			case "3":
				$sql_dataTable="chineese_fashion";
			break;
			case "4":
				$sql_dataTable="chineese_oldies";
			break;
			case "5":
				$sql_dataTable="classical";
			break;
			default:
				$sql_dataTable="english_fashion";
		}
		$sql_query1="SELECT * FROM ".$sql_dataTable." WHERE `questionID`="."'".$_GET["questionID1"]."'";
		$sql_query2="SELECT * FROM ".$sql_dataTable." WHERE `questionID`="."'".$_GET["questionID2"]."'";
		$sql_query3="SELECT * FROM ".$sql_dataTable." WHERE `questionID`="."'".$_GET["questionID3"]."'";
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

