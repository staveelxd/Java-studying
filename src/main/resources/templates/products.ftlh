<!DOCTYPE html>
<html>
<head>
    <title>MAGNIT</title>
</head>
<body>
<h1>MAGNIT</h1><hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="submit" value="Выйти">
    </form>
<#else>
    <a href="/login">Войти</a>
</#if>
<hr>
<h2>Товары:</h2>
<form action="/" method="get">
    Поиск товаров: <input type="text" name="name"><br>
    <input type="submit" value="Поиск">
</form>
<#list products as product>
    <div>
        <p><b>${product.name}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее</a></p>
    </div>
    <#else>
    <h3>Список товаров пуст</h3>
</#list>
<#if user.email??>
<hr>
<h3>Создать новый товар</h3>
<form action="/product/create" method="post" enctype="multipart/form-data">
    Название: <input type="text" name="name"/><br><br>
    Описание: <input type="text" name="description"/><br><br>
    Цена: <input type="number" name="price"/><br><br>
    Количество: <input type="number" name="quantity"/><br><br>
    Фото товара: <input type="file" name="file"/><br><br>
    <input type="submit" value="Добавить товар"/>
</form>
</#if>
</body>
</html>