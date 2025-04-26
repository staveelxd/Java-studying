<#import "blocks/template.ftlh" as t>
<@t.template user>
<h1 style="text-align: center">Панель администратора</h1>
<table class="table table-hover table-dark" >
    <tr>
        <th scope="col">Email</th>
        <th scope="col">Номер телефона</th>
        <th scope="col">Активен</th>
        <th scope="col">Роли</th>
        <th scope="col">Бан</th>
        <th scope="col">Редактирование</th>
        <th scope="col">Подробнее</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th>${user.phoneNumber}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>
                    ${role}<#sep>,
                </#list></th>
            <th><form action="/admin/user/ban/${user.id}" method="post">
                    <input type="submit" value="Бан">
                </form> </th>
            <th><a href="admin/user/edit/${user.id}">Редактировать</a></th>
            <th><a href="user/${user.id}">Подробнее</a></th>
        </tr>
        <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
</@t.template>