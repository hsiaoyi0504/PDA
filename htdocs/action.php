<?php
	header("Access-Control-Allow-Origin: *");
	if($_POST['action'] == 'add') {
		add();
	}
	function add(){
		echo "add";
	}
?>