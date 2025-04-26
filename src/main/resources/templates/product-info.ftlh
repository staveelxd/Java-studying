<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="container mt-4">
    <div class="card shadow-sm">
    <div class="card-body">

    <h1 class="text-center mb-4">${product.name} |
        <span class="text-success">${product.price} ₽</span></h1>

    <div class="row justify-content-center mb-4">
        <#list images as image>
            <div class="col-8 col-md-6 col-lg-4 mb-3">
                <a href="/images/${image.id}">
                    <img src="/images/${image.id}" class="img-fluid rounded shadow-sm" alt="Product Image">
                </a>
            </div>
        </#list>
    </div>
    <p class="text-center fs-5">${product.description}</p>
    <p class="text-center mt-4">
        <span class="fw-bold">Телефон продавца:</span> <a href="tel:${product.user.phoneNumber}" class="text-decoration-none">${product.user.phoneNumber}</a>
    </p>

    <hr>
    <div class="text-center">
        <a href="/user/${product.user.id}" class="d-inline-flex align-items-center text-decoration-none">
            <img src="/static/images/avatar.png" alt="avatar" width="48" height="48" class="rounded-circle me-2">
            <span class="fw-bold">${product.user.name}</span>
        </a>
    </div>
    </div>
    </div>
    </div>
</@t.template>