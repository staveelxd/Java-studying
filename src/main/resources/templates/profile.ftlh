<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 class="text-center my-4">Личный кабинет</h1>
    <hr>
    <div class="d-flex flex-column align-items-center">
        <img src="/static/images/avatar.png" alt="avatar"
             class="rounded-circle border border-2 border-dark mb-3" height="120">
        <h2 class="mb-2">${user.name}</h2>

        <p class="text-muted mb-1">Электронная почта: <b>${user.email}</b></p>
        <p class="text-muted mb-4">Номер телефона: <b>${user.phoneNumber}</b></p>

        <div class="d-grid gap-2 col-12 col-md-6">
            <#if user.isAdmin()>
                <a class="btn btn-primary" href="/admin">
                    Панель администратора
                </a>
            </#if>

            <a class="btn btn-success" href="/my/products">
                Мои товары
            </a>

            <form action="/logout" method="post" class="d-grid">
                <button type="submit" class="btn btn-danger">
                    Выйти из аккаунта
                </button>
            </form>
        </div>
    </div>
</@t.template>