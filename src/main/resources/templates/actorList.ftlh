<#import "admin-panel2.ftlh" as admin>
<#import "functoins/numFormat.ftlh" as nf>

<@admin.adminpanel2>

    <main class="admin-spectacle-main">
        <a href="/admin-panel/actors/create"><button id="add-spectacle-btn" class="add-spectacle-btn"><img src="/static/img/icons/cross-vertical.png"></button></a>
        <table class="admin-spectacle-table">
            <caption class="admin-spectacle-caption">Керування акторами</caption>
            <thead>
            <tr>
                <th>Ім'я<img src="/static/img/icons/list-icon.png" alt="list icon"></th>
                <th>Прізвище</th>
                <th>Дія</th>
            </tr>
            </thead>
            <tbody>
            <#list actors as actor>
                <tr id="record1">
                    <td>${actor.name}</td>
                    <td>${actor.surname}</td>
                    <td class="with-btn">
                        <a href="/admin-panel/actors/edit/${nf.numFormat(actor.actorid)}">
                            <button id="change-btn1">
                                <img class="change" src="/static/img/icons/change-icon.png" alt="delete icon">
                            </button>
                        </a>
                        <a href="/admin-panel/actors/delete/${nf.numFormat(actor.actorid)}">
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