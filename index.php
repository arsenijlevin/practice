<?php 
include_once('templates/header.php');
include_once('core/utils.php')
?>

<div class="login">
	<h4>Вход:</h4>
	<form action="actions/login.php" method="POST">
		<div class="form-group">
			<label>Логин:</label>
			<input id="login" name="login" class="form-control" required>
		</div>
		<div class="form-group">
			<label>Пароль:</label>
			<input id="password" type="password" name="password" class="form-control" required>
		</div>
		<a href="registration.php">Регистрация</a>
		<a href="admin_registration.php">Регистрация для администрации</a>
		<input type="submit" class="btn btn-submit" value="Войти">
	</form>
	<?php if (array_key_exists('login', $_SESSION) and !is_data_null_or_empty($_SESSION['login'])) : ?>
		<a href="dashboard.php">Личный кабинет</a>
	<?php endif; ?>
</div>

<?php include_once('templates/footer.php'); ?>