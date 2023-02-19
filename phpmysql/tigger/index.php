<?php 

	$db = new mysqli("localhost","root","","phpexam");

	if(isset($_POST['btnSubmit']))
	{
		$mfg_id = $_POST['cmbmfg'];
		$db->query("DELETE from company where id='$mfg_id'");
		echo "Deleted Successfully";
	}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Delete Product</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="row mx-auto p-3 mb-2 bg-dark text-white">
			<form action="#" method="POST">
				<div>Company Name<br>
				<select name="cmbmfg">
					<?php

							$result = $db->query("SELECT id, name FROM company");
							while(list($id,$name) = $result->fetch_row())
							{
								echo "<option value='$id'>$name</option>";
							}
					?>
				</select>
				</div>
				<div>
				<input type="submit" class="btn btn-success" name="btnSubmit" value="Delete">
				</div>
			</form>
		</div>
		<div class="row mx-auto p-3 mb-2 bg-info text-white">
			<?php

					$result = $db->query("SELECT name,price FROM product");
					while(list($name,$price) = $result->fetch_row())
					{
						echo $name." ".$price."<br>";
					}
			?>
		</div>
	</div>
</body>
</html>