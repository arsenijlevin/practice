<?php
session_start();
include_once('../core/connection.php');
include_once('../core/utils.php');

$ADMIN_CODE = "1234567890"; // FIXME: Сменить код администрации!!!

if (is_data_null_or_empty($_POST['login']) or is_data_null_or_empty(($_POST['password']))) {
    $_SESSION['error'] = "Введите корректные логин и пароль!";
    header('location:../error_page.php');
    die();
}

$username = $_POST['login'];
$password = $_POST['password'];
$post_admin_code = $_POST['admin_code'];

if ($post_admin_code !== $ADMIN_CODE) {
    $_SESSION['error'] = "Введите корректный код админа!";
    header('location:../error_page.php');
    die();
}

$hashed_password = password_hash($_POST['password'], PASSWORD_DEFAULT);
$default_roleid = 2;
$name = "";
$description  = "";
$user = "";

// Проверка на существование пользователя с заданным логином.
$existing_user_query = $conn->prepare("SELECT login FROM user WHERE login = ?");
$existing_user_query->bind_param('s', $username);
$existing_user_query->execute();
$existing_user_query->bind_result($user);
$existing_user_query->fetch();

if (!is_data_null_or_empty($user)) {
    $_SESSION['error'] = "Пользователь с таким именем уже существует!";
    header('location:../error_page.php');
    $existing_user_query->close();
    die();
}

$register_user_query = $conn->prepare("INSERT INTO user (login, password, roleid) VALUES (?, ?, ?)");

$register_user_query->bind_param('ssi', $username, $hashed_password, $default_roleid);
$register_user_query->execute();
$register_user_query->store_result();

$role_query = $conn->prepare("SELECT name, description FROM role WHERE roleid=?");
$role_query->bind_param('i', $default_roleid);
$role_query->execute();
$role_query->store_result();
$role_query->bind_result($name, $description);
$role_query->fetch();

$_SESSION['login'] = $username;
$_SESSION['role'] = $name;
$_SESSION['description'] = $description;

$_SESSION['login'] = $username;

header("location:../dashboard.php");

$role_query->close();
$register_user_query->close();
$existing_user_query->close();
