<?php
include("connMysql.php");

if(isset($_POST["action"])&&($_POST["action"]=="delete")){	
	$sql_query = "DELETE FROM `english_fashion` WHERE `questionID`=".$_POST["questionID"];
	mysqli_query($link,$sql_query);
	//重新導向回到主畫面
	header("Location: data.php");

}
$sql_db = "SELECT * FROM `english_fashion` WHERE `questionID`=".$_GET["id"];
$result = mysqli_query($link,$sql_db);
$row_result=mysqli_fetch_assoc($result);

?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>猜歌王資料管理系統</title>
</head>
<body>
<h1 align="center">猜歌王資料管理系統 - 刪除資料</h1>
<p align="center"><a href="data.php">回主畫面</a></p>
<form action="" method="post" name="formDel" id="formDel">
  <table border="1" align="center" cellpadding="4">
    <tr>
      <th>欄位</th><th>資料</th>
    </tr>
    <tr>
      <td>題目代號</td><td><?php echo $row_result["questionID"];?></td>
    </tr>
    <tr>
      <td>題目敘述</td><td><?php echo $row_result["questionDescription"];?></td>
    </tr>
    <tr>
      <td>歌曲代號</td><td><?php echo $row_result["trackID"];?></td>
    </tr>
    <tr>
      <td>選項0</td><td><?php echo $row_result["choice0"];?></td>
    </tr>
    <tr>
      <td>選項1</td><td><?php echo $row_result["choice1"];?></td>
    </tr>
    <tr>
      <td>選項2</td><td><?php echo $row_result["choice2"];?></td>
    </tr>
    <tr>
      <td>選項3</td><td><?php echo $row_result["choice3"];?></td>
    </tr>
    <tr>
      <td>正確選項</td><td><?php echo $row_result["correctChoice"];?></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
      <input name="questionID" type="hidden" value="<?php echo $row_result["questionID"];?>">
      <input name="action" type="hidden" value="delete">
      <input type="submit" name="button" id="button" value="確定刪除這筆資料嗎？">
      </td>
    </tr>
  </table>
</form>
</body>
</html>