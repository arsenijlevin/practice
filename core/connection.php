<?php
$host = "localhost";
$user = "root";
$db_password = "root";
$db_name = "demo";

$conn = mysqli_connect($host, $user, $db_password, $db_name);

if (!$conn) {
    echo "Ошибка при подключении к базе данных!";
}
