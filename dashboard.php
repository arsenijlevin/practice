<?php
include_once('templates/header.php');
if ($_SESSION['login'] == "") {
	header('location:index.php');
	if (!isset($_POST['login']) or empty($_POST['login'])) {
	
		die();
	}
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