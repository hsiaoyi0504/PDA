<?php
if(isset($_POST["databases"])){
	header("Content-Type: text/html; charset=utf-8");
	include("connMysql.php");
//	$seldb = @mysql_select_db("question_list");
//	if (!$seldb) die("資料庫選擇失敗！");	
	$sql_query = "SELECT * FROM ".$_POST["databases"];
	$result = mysqli_query($link,$sql_query);
	$total_records = mysqli_num_rows($result);
	while($row_result=mysqli_fetch_assoc($result)){
				echo "<tr>";
				echo "<td>".$row_result["questionID"]."</td>";
				echo "<td>".$row_result["questionDescription"]."</td>";
				echo "<td>".$row_result["preview_url"]."</td>";
				echo "<td>".$row_result["choice0"]."</td>";
				echo "<td>".$row_result["choice1"]."</td>";
				echo "<td>".$row_result["choice2"]."</td>";
				echo "<td>".$row_result["choice3"]."</td>";
				echo "<td>".$row_result["correctChoice"]."</td>";
				echo "<td><a href='update.php?id=".$row_result["questionID"]."'>修改</a> ";
				echo "<a href='delete.php?id=".$row_result["questionID"]."'>刪除</a></td>";
				echo "</tr>";
	}
}
			
?>