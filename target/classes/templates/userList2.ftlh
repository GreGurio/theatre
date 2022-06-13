<#import "admin-panel2.ftlh" as admin>
<#import "functoins/numFormat.ftlh" as nf>

<@admin.adminpanel2>

    <!-- MAIN -->

    <main class="admin-panel">
        <table class="admin-panel-table">

            <caption class="admin-panel-caption">Керування користувачами</caption>

            <thead>
            <tr>
                <th>ПІБ<img src="/static/img/icons/list-icon.png" alt="list icon"></th>
                <th>Нікнейм</th>
                <th>E-mail</th>
                <th>День народження</th>
                <th>Роль</th>
                <th>Дія</th>
            </tr>
            </thead>

            <tbody>

            <#list users as user>
                <tr id="record1">
                    <td><div class="pib"><img class="user-img" src="/static/img/icons/user.png"></div>Іванов Іван  Іванович</td>
                    <td>${user.username}</td>
                    <td>ivanov@mail.com</td>
                    <td>13.07.1987</td>
                    <td>
                        <#list user.roles as role>
                            <#if role == "ADMIN">
                                <span class="admin">Адміністратор</span>
                            <#elseif role == "USER">
                                <span class="user">Користувач</span>
                            </#if>
                            <#sep>
                        </#list>
                    </td>
                    <td class="with-btn">
                        <a href="/admin-panel/users/${nf.numFormat(user.userid)}">
                            <button id="change-btn1">
                                <img class="change" src="/static/img/icons/change-icon.png" alt="delete icon">
                            </button>
                        </a>
                        <a href="/admin-panel/users/delete/${nf.numFormat(user.userid)}">
                            <button id="trash-btn1" >
                                <img class="trash" src="/static/img/icons/trash.png" alt="delete icon">
                            </button>
                        </a>
                    </td>
                </tr>
            </#list>


            </tbody>
        </table>
    </main>



</@admin.adminpanel2>