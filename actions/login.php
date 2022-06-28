<?php
session_start();
include_once('../core/connection.php');
include_once('../core/utils.php');

if (!is_data_null_or_empty(($_POST['login']))) {
    $username = $_POST['login'];
    $password = $_POST['password'];
    $hashed_password = "";
    $roleid = -1;

    $user_query = $conn->prepare("SELECT login, password, roleid FROM user WHERE login=?");
    $user_query->bind_param('s', $username);
    $user_query->execute();
    $user_query->store_result();
    $user_query->bind_result($username, $hashed_password, $roleid);
    $user_query->fetch();

    // Если найден пользователь и пароль верен
    if ($user_query->num_rows > 0 and password_verify($password, $hashed_password)) {
        $name = "";
        $description = "";

        $role_query = $conn->prepare("SELECT name, description FROM role WHERE roleid=?");
        $role_query->bind_param('i', $roleid);
        $role_query->execute();
        $role_query->store_result();
        $role_query->bind_result($name, $description);
        $role_query->fetch();

        $_SESSION['login'] = $username;
        $_SESSION['role'] = $name;
        $_SESSION['description'] = $description;
        
        header("location:../dashboard.php");
    } else {
        $_SESSION['error'] = "Неправильное имя пользователя или пароль!";
        header('location:../error_page.php');
    }

    $user_query->close();
    $role_query->close();
}
