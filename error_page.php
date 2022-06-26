<?php
include_once('templates/header.php');
?>

<div class="error">
	<p>Произошла ошибка, <?php echo $_SESSION['error']; ?></p>
	<a href="index.php">На главную</a>
</div>

<?php
include_once('templates/footer.php');
?>