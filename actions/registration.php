<?php
session_start();
include_once('../core/connection.php');
include_once('../core/utils.php');

if (is_data_null_or_empty($_POST['login']) or is_data_null_or_empty(($_POST['password']))) {
    $_SESSION['error'] = "Введите корректные логин и пароль!";
    header('location:../error_page.php');
    die();
}

$username = $_POST['login'];
$password = $_POST['password'];
$hashed_password = password_hash($_POST['password'], PASSWORD_DEFAULT);
$default_roleid = 3;
$name = "";
$description  = "";
$user = "";

$user_query = $conn->prepare("SELECT login FROM user WHERE login = ?");
$user_query->bind_param('s', $username);
$user_query->execute();
$user_query->bind_result($user);
$user_query->fetch();

if (!is_data_null_or_empty($user)) {
    $_SESSION['error'] = "Пользователь с таким именем уже существует!";
    header('location:../error_page.php');
    $user_query->close();
    die();
}

$register_query = $conn->prepare("INSERT INTO user (login, password, roleid) VALUES (?, ?, ?)");

$register_query->bind_param('ssi', $username, $hashed_password, $default_roleid);
$register_query->execute();

$role_query = $conn->prepare("SELECT name, description FROM role WHERE roleid=?");
$role_query->bind_param('i', $default_roleid);
$role_query->execute();
$role_query->bind_result($name, $description);
$role_query->fetch();

$_SESSION['login'] = $username;
$_SESSION['role'] = $name;
$_SESSION['description'] = $description;

$_SESSION['login'] = $username;

header("location:../dashboard.php");

$register_query->close();
$role_query->close();
$user_query->close();