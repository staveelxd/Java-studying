<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 class="text-center my-4">Поиск товаров</h1><hr>
    <form method="get" action="/">
        <div class="row g-3 align-items-end">
            <div class="col-md-10">
                <label for="searchWord" class="form-label">Поиск по объявлениям</label>
                <input
                        type="text"
                        id="searchWord"
                        name="searchWord"
                        class="form-control"
                        value="${searchWord!}"
                placeholder="Введите название товара">
            </div>
            <div class="col-md-2 d-grid">
                <button type="submit" class="btn btn-primary">Поиск</button>
            </div>
        </div>
    </form>
    <hr>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
        <#list products as product>
            <a href="/product/${product.id}" class="text-decoration-none">
                <div class="card h-100 bg-light border-0 shadow-sm">
                    <img  src="/images/${product.previewImageId}"
                          class="card-img-top"
                          alt="${product.name}">
                    <div class="card-body text-center">
                        <h5 class="card-title text-dark">${product.name}</h5>
                        <p class="card-text text-success fw-bold">${product.price} ₽</p>
                    </div>
                </div>
            </a>
        <#else>
    <div class="col-12">
            <h2 class="text-center my-5 text-muted">Не найдено</h2>
    </div>
        </#list>
    </div>
</@t.template>