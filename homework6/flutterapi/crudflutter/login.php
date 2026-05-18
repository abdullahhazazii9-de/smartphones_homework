<?php
include 'conn.php';

$email    = $_POST['email'];
$password = $_POST['password'];

$query = $connect->query("SELECT * FROM users WHERE email='$email' AND password='$password'");

if ($query->num_rows > 0) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false]);
}
?>
