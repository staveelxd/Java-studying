<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="container my-5" style="max-width: 500px;">
    <h1 class="text-center mb-4">Регистрация</h1>
    <form action="/register" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Имя пользователя</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Электронная почта</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="phoneNumber" class="form-label">Номер телефона</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Пароль</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-dark w-100">Зарегистрироваться</button>
    </form>
    <#if errorMessage??>
        <div class="alert alert-danger text-center mt-4" role="alert">
            ${errorMessage}
        </div>
    </#if>
    </div>
</@t.template>