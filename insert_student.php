<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

include 'db_connect.php';

$name = $_POST['name'];
$roll = $_POST['roll'];
$email = $_POST['email'];
$cgpa = $_POST['cgpa'];

$stmt = $conn->prepare(
"INSERT INTO students(name, roll_number, email, cgpa)
VALUES (?, ?, ?, ?)"
);

$stmt->bind_param("ssss", $name, $roll, $email, $cgpa);

if($stmt->execute()){
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "failed"]);
}
?>