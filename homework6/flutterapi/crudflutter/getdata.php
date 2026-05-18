<?php
include 'conn.php';

$result = $connect->query("SELECT * FROM mahasiswa ORDER BY id DESC");

$data = array();
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>
