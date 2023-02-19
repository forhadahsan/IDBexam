<?php

if(isset($_POST['btnSubmit']))
{
	$db = new mysqli('localhost','root','','idb54');

	$mfg = $_POST['txtMfg'];
	$contact = $_POST['txtContact'];
	$db->query("call add_manufacturer('$mfg','$contact')");
	echo "Successfully Added";
	header('refresh:2');
}


?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert Manufacturer Info</title>
</head>
<body>
	<form action="#" method="post">
		<div>
			<label>Manufacturer</label><br>
			<input type="text" name="txtMfg">
		</div>
		<div>
			<label>Contact</label><br>
			<input type="text" name="txtContact">
		</div>
		<div>
			<input type="submit" name="btnSubmit" value="Submit">
		</div>
	</form>

</body>
</html>