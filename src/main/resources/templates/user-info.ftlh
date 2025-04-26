<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <div class="container my-5">
    <h1 class="text-center mb-4">Информация о пользователе</h1>
    <hr class="mb-5">
    <div class="text-center">
        <img src="/static/images/avatar.png" alt="Аватар пользователя"
             class="rounded-circle border border-dark mb-3" height="120">
        <h2 class="mt-3">${user.name}</h2>
        <p class="text-muted">Номер телефона: <strong>${user.phoneNumber}</strong></p>
    </div>
    <hr class="my-5">
    <h1 class="text-center mb-4">Товары пользователя ${user.name}</h1>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
        <#list products as product>
            <div class="col">
                <a href="/product/${product.id}" class="text-decoration-none">
                    <div class="card h-100 bg-light border-0 shadow-sm">
                        <img src="/images/${product.previewImageId}" class="card-img-top" alt="${product.name}">
                        <div class="card-body text-center">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text fw-bold text-success">${product.price} ₽</p>
                        </div>
                    </div>
                </a>
            </div>
        <#else>
            <div class="col-12">
                <h2 class="text-center text-muted my-5">Не найдено</h2>
            </div>
        </#list>
    </div>
    </div>
</@t.template>