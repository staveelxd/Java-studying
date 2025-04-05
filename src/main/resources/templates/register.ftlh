<!DOCTYPE html>
<html>
<head>
    <title>MAGNIT</title>
</head>
<body>
<h1>MAGNIT</h1><hr>
<h2>Регистрация</h2>
<form action="/login" method="post">
    Имя пользователя: <input type="text" name="name"><br><br>
    Эл. почта: <input type="email" name="username"><br><br>
    Номер телефона: <input type="text" name="phoneNumber"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Регистрация">
</form>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
<hr>
<a href="/login">Уже есть аккаунт? Войти</a>
</body>
</html>