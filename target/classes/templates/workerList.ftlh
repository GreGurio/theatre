<#import "admin-panel2.ftlh" as admin>
<#import "functoins/numFormat.ftlh" as nf>

<@admin.adminpanel2>

    <main class="admin-spectacle-main">
        <a href="/admin-panel/workers/create"><button id="add-spectacle-btn" class="add-spectacle-btn"><img src="/static/img/icons/cross-vertical.png"></button></a>
        <table class="admin-spectacle-table">
            <caption class="admin-spectacle-caption">Керування працівниками</caption>
            <thead>
            <tr>
                <th>Ім'я<img src="/static/img/icons/list-icon.png" alt="list icon"></th>
                <th>Прізвище</th>
                <th>Посада</th>
                <th>Дія</th>
            </tr>
            </thead>
            <tbody>
            <#list workers as worker>
                <tr id="record1">
                    <td>${worker.name}</td>
                    <td>${worker.surname}</td>
                    <td>${worker.position}</td>
                    <td class="with-btn">
                        <a href="/admin-panel/workers/edit/${nf.numFormat(worker.workerid)}">
                            <button id="change-btn1">
                                <img class="change" src="/static/img/icons/change-icon.png" alt="delete icon">
                            </button>
                        </a>
                        <a href="/admin-panel/workers/delete/${nf.numFormat(worker.workerid)}">
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