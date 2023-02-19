<?php 

	$db = new mysqli("localhost","root","","idb54");

	if(isset($_POST['btnSubmit']))
	{
		$mfg_id = $_POST['cmbmfg'];
		$db->query("DELETE from manufacturer where id='$mfg_id'");
		echo "Deleted Successfully";
	}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Delete Product</title>
</head>
<body>

	<form action="#" method="POST">
		<div>Manufacturer<br>
		<select name="cmbmfg">
			<?php

					$result = $db->query("SELECT id, name FROM manufacturer");
					while(list($id,$name) = $result->fetch_row())
					{
						echo "<option value='$id'>$name</option>";
					}

			?>
		</select>
		</div>
		<div>
		<input type="submit" name="btnSubmit" value="Delete">
		</div>
	</form>
<?php

		$result = $db->query("SELECT name,price FROM product");
		while(list($name,$price) = $result->fetch_row())
		{
			echo $name." ".$price."<br>";
		}
?>
</body>
</html>