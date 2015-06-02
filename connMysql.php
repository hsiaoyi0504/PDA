<?php
 //database configuration
 $db_host="localhost";
 $db_username="root";
 $db_password="1234";
 $db_dbname="question_list";
 //connect server
 $link=mysqli_connect($db_host,$db_username,$db_password,$db_dbname);
 if(!$link)
 {
 	echo "0.0";
 	die("Database coonect failed");
 }
 if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: ".mysqli_connect_error();
    //you need to exit the script, if there is an error
    exit();
}
 //set character set and validate connection
 mysqli_set_charset($link, "utf8");
?>