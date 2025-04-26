<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-body">
                    <h2 class="text-center mb-4">Авторизация</h2>
                    <form action="/login" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Электронная почта</label>
                        <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username" required>
                <div id="email" class="invalid-feedback">
                Неверная электронная почта
            </div>
        </div>
    <div class="mb-3">
        <label for="password" class="form-label">Пароль</label>
        <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password" required>
        <div id="password" class="invalid-feedback">
            Неверный пароль
        </div>
    </div>
    <button type="submit" class="btn btn-dark w-100">Войти</button>
</form>
<hr>
    <h5 class="text-center">
        <a href="/register" class="text-decoration-none">Зарегистрироваться</a>
    </h5>
    </div>
    </div>
    </div>
    </div>
    </div>
</@t.template>