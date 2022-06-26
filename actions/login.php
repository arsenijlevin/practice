<?php
session_start();
include_once('../core/connection.php');

if (isset($_POST['login'])) {
    $username = $_POST['login'];
    $password = $_POST['password'];
    $hashed_password = "";
    $roleid = -1;

    $stmt = $conn->prepare("SELECT login, password, roleid FROM user WHERE login=?");
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($username, $hashed_password, $roleid);
    $stmt->fetch();
    if ($stmt->num_rows > 0 and password_verify($password, $hashed_password)) {
        $name = "";
        $description = "";

        $stmt2 = $conn->prepare("SELECT name, description FROM role WHERE roleid=?");
        $stmt2->bind_param('i', $roleid);
        $stmt2->execute();
        $stmt2->store_result();
        $stmt2->bind_result($name, $description);
        $stmt2->fetch();
        $_SESSION['login'] = $username;
        $_SESSION['role'] = $name;
        $_SESSION['description'] = $description;
        header("location:../dashboard.php");
    } else {
        $_SESSION['error'] = "Неправильное имя пользователя или пароль!";
        header('location:../error_page.php');
    }

    $stmt->close();
}
