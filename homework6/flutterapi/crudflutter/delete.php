<?php
include 'conn.php';

$id = $_POST['id'];

$query = $connect->query("DELETE FROM mahasiswa WHERE id='$id'");

if ($query) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false]);
}
?>
