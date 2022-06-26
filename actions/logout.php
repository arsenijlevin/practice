<?php
session_start();
unset($_SESSION['login']);
unset($_SESSION['error']);
unset($_SESSION['role']);
unset($_SESSION['description']);
session_destroy();
header("location:../index.php");
