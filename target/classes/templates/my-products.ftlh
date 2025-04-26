<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 class="text-center my-4">Мои товары</h1>
    <hr>
    <div class="text-center">
        <a class="btn btn-primary mb-4" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Добавить новый товар
        </a>
    </div>
    <div class="collapse mb-4" id="collapseExample">
    <div class="card card-body shadow-sm">
        <form action="/product/create" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="productName" class="form-label">Название товара</label>
                <input type="text" class="form-control" id="productName" name="name" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Цена товара</label>
                <div class="input-group">
                    <input type="number" class="form-control" id="price" name="price" required>
                    <span class="input-group-text">₽</span>
                </div>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Описание товара</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            </div>
            <div class="mb-4">
                <label for="file" class="form-label">Фотография к товару</label>
                <input class="form-control" type="file" id="file" name="file" required>
            </div>

            <button type="submit" class="btn btn-success w-100">Добавить</button>
        </form>
    </div>
    </div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
        <#list products as product>
            <div class="col">
                <div class="card h-100 bg-light shadow-sm">
                    <form action="/product/remove/${product.id}" method="post" class="position-absolute top-0 end-0 m-2">
                        <button type="submit" class="btn btn-sm btn-danger">Удалить</button>
                    </form>
                    <a href="/product/${product.id}" class="text-decoration-none text-dark">
                        <img src="/images/${product.previewImageId}" class="card-img-top" alt="${product.name}">
                        <div class="card-body text-center">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text text-success fw-bold">${product.price} ₽</p>
                        </div>
                    </a>
                </div>
            </div>
        <#else>
            <div class="col-12">
                <h2 class="text-center my-4 text-muted">Товары не найдены</h2>
            </div>
        </#list>
    </div>
</@t.template>