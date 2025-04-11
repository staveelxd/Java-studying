<!DOCTYPE html>
<html>
<head>
    <title>MAGNIT</title>
</head>
<body>
<h1>MAGNIT</h1><hr>
<h2>Подробная информация о товаре</h2>
<#list images as img>
    <img src="/images/${img.id}" height="100px" alt="Фото товара"><br><br>
</#list>
<b>Название: </b>${product.name}<br>
<b>Описание: </b>${product.description}<br>
<b>Цена: </b>${product.price}<br>
<b>Количество: </b>${product.quantity}<br>
<hr>
<form action="/product/remove/${product.id}" method="post">
    <input type="submit" value="Удалить товар"/>
</form>
</body>
</html>