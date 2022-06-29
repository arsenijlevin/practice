<?php
include_once('templates/header.php');
if (!array_key_exists('error', $_SESSION)) {
	die();
}
?>

<div class="error">
	<p>Произошла ошибка, <?php echo $_SESSION['error']; ?></p>
	<a href="index.php">Вернуться на страницу входа</a>
</div>

<?php
include_once('templates/footer.php');
?>