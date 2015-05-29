<?php
 //database configuration
 $db_host="localhost";
 $db_username="root";
 $db_password="1234";
 //connect server
 $db_link=@mysql_connect( $db_host, $db_username, $db_password);
 if($db_link) die("Database coonect failed");
 //set character set and validate connection
 mysql_query("SET NAMES 'uft8'");
?>