<?php
$db = new mysqli('localhost','root','','phpexam');

$result = $db->query("SELECT id, product_name, company_name FROM view_product");

while(list($id,$product_name,$mfg_name) = $result->fetch_row())
{
	echo $id." ".$product_name." ".$mfg_name."<br>";
}

?>