<#macro template user>
    <!doctype html>
    <html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
    <title>MAGNIT</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark border-bottom shadow-sm">
    <div class="container-fluid">
        <a href="/" class="navbar-brand fw-bold fs-4">MAGNIT</a>


        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>


        <div class="collapse navbar-collapse justify-content-end" id="navbarContent">


        <#if user.email??>
            <div class="dropdown">
                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="/static/images/avatar.png" alt="avatar" width="32" height="32" class="rounded-circle me-2">
                    <strong>${user.name}</strong>
                </a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark text-small" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="/profile">Профиль</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/logout">Выход</a></li>
                </ul>
            </div>
        <#else>
            <button class="btn btn-light" type="button" onclick="window.location.href='/login'">
                Войти
            </button>
        </#if>
    </div>
    </div>
</nav>
<div class="container mt-4">
    <#nested/>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</#macro>
