<?php
include("connMysql.php");

//if (!@mysql_select_db("class")) die("資料庫選擇失敗！");
if(isset($_POST["action"])&&($_POST["action"]=="update")){	
	$sql_query = "UPDATE `main` SET ";
	$sql_query .= "`questionDescription`='".$_POST["questionDescription"]."',";
  $sql_query .= "`trackID`='".$_POST["trackID"]."',";
	$sql_query .= "`choice0`='".$_POST["choice0"]."',";
	$sql_query .= "`choice1`='".$_POST["choice1"]."',";
	$sql_query .= "`choice2`='".$_POST["choice2"]."',";
	$sql_query .= "`choice3`='".$_POST["choice3"]."',";
	$sql_query .= "`correctChoice`='".$_POST["correctChoice"]."' ";
	$sql_query .= "WHERE `questionID`=".$_POST["questionID"];	
	mysqli_query($link,$sql_query);
	//重新導向回到主畫面
	header("Location: data.php");
}
$sql_db = "SELECT * FROM `main` WHERE `questionID`=".$_GET["id"];
$result = mysqli_query($link,$sql_db);
$row_result=mysqli_fetch_assoc($result);

?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>猜歌王資料管理系統</title>
</head>
<body>
<h1 align="center">猜歌王資料管理系統 - 修改資料</h1>
<p align="center"><a href="data.php">回主畫面</a></p>
<form action="" method="post" name="formFix" id="formFix">
  <table border="1" align="center" cellpadding="4">
    <tr>
      <th>欄位</th><th>資料</th>
    </tr>
    <tr>
      <td>題目編號</td><td><?php echo $row_result["questionID"];?></td>
    </tr>
    <tr>
      <td>題目敘述</td><td><input type="text" name="questionDescription" id="questionDescription" value="<?php echo $row_result["questionDescription"];?>"></td>
    </tr>
    <tr>
      <td>歌曲代號</td><td><input type="text" name="trackID" id="trackID" value="<?php echo $row_result["trackID"];?>"></td>
      </td>
    </tr>
    <tr>
      <td>選項0</td><td><input type="text" name="choice0" id="choice0" value="<?php echo $row_result["choice0"];?>"></td>
    </tr>
    <tr>
      <td>選項1</td><td><input type="text" name="choice1" id="choice1" value="<?php echo $row_result["choice1"];?>"></td>
    </tr>
    <tr>
      <td>選項2</td><td><input type="text" name="choice2" id="choice2" value="<?php echo $row_result["choice2"];?>"></td>
    </tr>
    <tr>
      <td>選項3</td><td><input type="text" name="choice3"  id="choice3" value="<?php echo $row_result["choice3"];?>"></td>
    </tr>
    <tr>
      <td>正確選項</td><td><input type="text" name="correctChoice" id="correctChoice" value="<?php echo $row_result["correctChoice"];?>"></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
      <input name="cID" type="hidden" value="<?php echo $row_result["questionID"];?>">
      <input name="action" type="hidden" value="update">
      <input type="submit" name="button" id="button" value="更新資料">
      <input type="reset" name="button2" id="button2" value="重新填寫">
      </td>
    </tr>
  </table>
</form>
</body>
</html>