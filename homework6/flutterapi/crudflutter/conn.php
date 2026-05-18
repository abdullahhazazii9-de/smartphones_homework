<?php
$connect = new mysqli("localhost", "root", "", "crudflutter");

if ($connect->connect_error) {
    die("Connection failed: " . $connect->connect_error);
}
?>
