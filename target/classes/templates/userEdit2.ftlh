<#import "admin-panel2.ftlh" as admin>

<@admin.adminpanel2>


    <form action="/admin-panel/users" method="POST" class="reg-form" id="register-form">
        <!--<div class="form-logo"><img src=/static/img/logo/logo-black.png"></div>-->
        <div class="inputs-cont" style="margin-top: 40px">


            <p>
                <label for="name">ПІБ</label>
                <input type="text" name="name">
            </p>

            <p class="nickname">
                <label for="username">Нікнейм</label>
                <input type="text" name="username" value="${user.username}" required>
            </p>

            <p class="nickname">
                <label for="userId">ID</label>
                <input type="text" name="userId" required value="${user.userid}" required>
            </p>

            <p>
                <label for="email1">E-mail</label>
                <input type="email" name="email1">
            </p>

            <p>
                <label for="password">Пароль</label>
                <input type="text" name="password" value="${user.password}" required>
            </p>

            <p>
                <label for="birthday">Дата народження</label>
                <input type="date" name="birthday">
            </p>

            <#list roles as role>
            <p class="for-admin">
                <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                <label for="${role}">${role}</label>
            </p>
            </#list>
            <input type="hidden" value="${_csrf.token}" name="_csrf">

            <p class="for-button">
                <input type="submit" name="" value="Підтвердити" id="form-btn">
            </p>
        </div>
    </form>


</@admin.adminpanel2>