<?php
include 'conn.php';

$id     = $_POST['id'];
$nisn   = $_POST['nisn'];
$nama   = $_POST['nama'];
$alamat = $_POST['alamat'];

$query = $connect->query("UPDATE mahasiswa SET nisn='$nisn', nama='$nama', alamat='$alamat' WHERE id='$id'");

if ($query) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false]);
}
?>
