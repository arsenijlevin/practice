<?php
include_once('templates/header.php');
include_once('core/utils.php');
if (!array_key_exists('login', $_SESSION)) {
	die();
}

?>

<div class="dashboard">
	<h2>
		Здравствуйте, <?php echo $_SESSION['login']; ?>
	</h2>
	<p>
		Вы вошли как: <?php echo $_SESSION['role']; ?> <br><br>
		Описание роли: <?php echo $_SESSION['description']; ?> <br><br>
		<a href="actions/logout.php">Выйти</a>
	</p>
</div>

<?php
include_once('templates/footer.php');
?>