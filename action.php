<?php
	header("Access-Control-Allow-Origin: *");
	if($_POST['action'] == 'add') {
		add();
	}
	if($_POST['action'] == 'delete') {
		delete();
	}
	function add(){
		//header("Access-Control-Allow-Origin: *");
		include("connMysql.php");
//		if (!@mysql_select_db("class")) die("資料庫選擇失敗！");
		$sql_query = "INSERT INTO `main` (`questionDescription` ,`trackID`,`choice0` ,`choice1` ,`choice2` ,`choice3` ,`correctChoice`) VALUES (";
		$sql_query .= "'".$_POST["questionDescription"]."',";
		$sql_query .= "'".$_POST["trackID"]."',";
		$sql_query .= "'".$_POST["choice0"]."',";
		$sql_query .= "'".$_POST["choice1"]."',";
		$sql_query .= "'".$_POST["choice2"]."',";
		$sql_query .= "'".$_POST["choice3"]."',";
		$sql_query .= "'".$_POST["correctChoice"]."')";
		echo $_POST["questionDescription"];
		echo $_POST["trackID"];
		echo $sql_query;
		$result=mysqli_query($link,$sql_query);
		//重新導向回到主畫面
		//header("Location: data.php");	
		if($result==false){
			echo "false";
			printf("Errormessage: %s\n", mysqli_error($link));
		}
	//	else
	//		echo "true";
		//echo "add";
		//echo $_POST['question'];
	}
	function delete(){
		echo "delete";
	}
?>

