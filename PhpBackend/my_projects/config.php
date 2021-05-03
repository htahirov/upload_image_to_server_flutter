<?php

try{
	$db=new PDO("mysql:hostname=localhost; dbname="your_database_name"; charset=utf8", "phpMyAdmin_username", "phpMyAdmin_password");

} catch(PDOException $e){
	echo $e->getMessage();
	die("OOPs something went wrong!");
}

?>