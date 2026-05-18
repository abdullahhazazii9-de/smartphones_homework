<?php
include 'conn.php';

$nisn   = $_POST['nisn'];
$nama   = $_POST['nama'];
$alamat = $_POST['alamat'];

$query = $connect->query("INSERT INTO mahasiswa (nisn, nama, alamat) VALUES ('$nisn', '$nama', '$alamat')");

if ($query) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false]);
}
?>
