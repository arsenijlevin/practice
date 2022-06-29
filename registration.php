<?php include_once('templates/header.php'); ?>

<div class="registration">
	<h4>Регистрация</h4>
	<form action="actions/registration.php" method="POST">
		<div class="form-group">
			<label>Логин:</label>
			<input name="login" class="form-control" required>
		</div>
		<div class="form-group">
			<label>Пароль:</label>
			<input type="password" name="password" class="form-control" required>
		</div>
		<input type="submit" class="btn btn-submit" value="Зарегистрироваться">

	</form>
	<a href="index.php">Вернуться на страницу входа</a>
</div>

<?php include_once('templates/footer.php'); ?>