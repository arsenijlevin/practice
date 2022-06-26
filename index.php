<?php include_once('templates/header.php'); ?>

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
</div>

<?php include_once('templates/footer.php'); ?>