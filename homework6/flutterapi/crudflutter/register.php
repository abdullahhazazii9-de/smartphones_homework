<?php
include 'conn.php';

$email    = $_POST['email'];
$password = $_POST['password'];

$check = $connect->query("SELECT * FROM users WHERE email='$email'");

if ($check->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "Email already exists"]);
    exit();
}

$query = $connect->query("INSERT INTO users (email, password) VALUES ('$email', '$password')");

if ($query) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false]);
}
?>
