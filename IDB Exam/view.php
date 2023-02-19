<?php
$db = new mysqli('localhost','root','','idb54');

$result = $db->query("SELECT id, product_name, mfg_name FROM v_product_list1");

while(list($id,$product_name,$mfg_name) = $result->fetch_row())
{
	echo $id." ".$product_name." ".$mfg_name."<br>";
}

?>