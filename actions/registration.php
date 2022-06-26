<?php
session_start();
include_once('../core/connection.php');

if (!isset($_POST['login']) or !isset($_POST['password']) or empty($_POST['login']) or empty($_POST['password'])) {
    $_SESSION['error'] = "Введите корректные логин и пароль!";
    header('location:../error_page.php');
} else {
    $username = $_POST['login'];
    $password = $_POST['password'];
    $hashed_password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $default_roleid = 3;
    $name = "";
    $description  = "";
    $user = "";

    $stmt3 = $conn->prepare("SELECT login FROM user WHERE login = ?");
    $stmt3->bind_param('s', $username);
    $stmt3->execute();
    $stmt3->bind_result($user);
    $stmt3->fetch();

    if (isset($user) && !empty($user)) {
        $_SESSION['error'] = "Пользователь с таким именем уже существует!";
        header('location:../error_page.php');
    } else {

        $stmt = $conn->prepare("INSERT INTO user (login, password, roleid) VALUES (?, ?, ?)");

        $stmt->bind_param('ssi', $username, $hashed_password, $default_roleid);
        $stmt->execute();

        $stmt2 = $conn->prepare("SELECT name, description FROM role WHERE roleid=?");
        $stmt2->bind_param('i', $default_roleid);
        $stmt2->execute();
        $stmt2->bind_result($name, $description);
        $stmt2->fetch();

        $_SESSION['login'] = $username;
        $_SESSION['role'] = $name;
        $_SESSION['description'] = $description;

        $_SESSION['login'] = $username;

        header("location:../dashboard.php");

        $stmt->close();
    }
}
