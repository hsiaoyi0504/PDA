<?php
	header("Access-Control-Allow-Origin: *");
	if($_POST['action'] == 'add') {
		add();
	}
	if($_POST['action'] == 'delete') {
		delete();
	}
	function add(){
		echo "add";
	}
	function delete(){
		echo "delete";
	}
?>