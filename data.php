<?php 
	header("Content-Type: text/html; charset=utf-8");
	include("connMysql.php");
//	$seldb = @mysql_select_db("question_list");
//	if (!$seldb) die("資料庫選擇失敗！");	
	$sql_query = "SELECT * FROM `main`";
	$result = mysqli_query($link,$sql_query);
	$total_records = mysqli_num_rows($result);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>猜歌王資料管理系統</title>
</head>
<body>
<h1 align="center">猜歌王資料管理系統</h1>
<p align="center">目前資料筆數：<?php echo $total_records;?>,<a href="index.html">新增歌曲資料</a>。</p>
	<!--<a href="add.php">新增歌曲資料</a>。</p>-->
<table border="1" align="center">
  <!-- 表格表頭 -->
  <tr>
    <th>題目編號</th>
    <th>題目敘述</th>
    <th>歌曲代號</th>
    <th>選項0</th>
    <th>選項1</th>
    <th>選項2</th>
    <th>選項3</th>
    <th>正確選項</th>
    <th>功能</th>
  </tr>
  <!-- 資料內容 -->
<?php
	while($row_result=mysqli_fetch_assoc($result)){
		echo "<tr>";
		echo "<td>".$row_result["questionID"]."</td>";
		echo "<td>".$row_result["questionDescription"]."</td>";
		echo "<td>".$row_result["trackID"]."</td>";
		echo "<td>".$row_result["choice0"]."</td>";
		echo "<td>".$row_result["choice1"]."</td>";
		echo "<td>".$row_result["choice2"]."</td>";
		echo "<td>".$row_result["choice3"]."</td>";
		echo "<td>".$row_result["correctChoice"]."</td>";
		echo "<td><a href='update.php?id=".$row_result["questionID"]."'>修改</a> ";
		echo "<a href='delete.php?id=".$row_result["questionID"]."'>刪除</a></td>";
		echo "</tr>";
	}
?>
</table>
</body>
</html>