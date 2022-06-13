<#import "admin-panel2.ftlh" as admin>
<#import "functoins/numFormat.ftlh" as nf>

<@admin.adminpanel2>

    <main class="admin-spectacle-main">
        <a href="/admin-panel/concerts/add"><button id="add-spectacle-btn" class="add-spectacle-btn"><img src="/static/img/icons/cross-vertical.png"></button></a>
        <table class="admin-spectacle-table">
            <caption class="admin-spectacle-caption">Керування спектаклями</caption>
            <thead>
            <tr>
                <th>Назва<img src="/static/img/icons/list-icon.png" alt="list icon"></th>
                <th>Дата проведення</th>
                <th>Мінімальна ціна</th>
                <th>Дія</th>
            </tr>
            </thead>
            <tbody>
            <#assign i = 0>
            <#list concerts as concert>
                <tr id="record1">
                    <td>${concert.name}</td>
                    <td>${concert.date}</td>
                    <td>
                        <#assign j = 0>
                        <#list prices as price>
                            <#if i = j>
                            <span class="price">${price} ГРН</span>
                            </#if>
                            <#assign j += 1>
                        </#list>
                    </td>
                    <td class="with-btn">
                        <a href="/admin-panel/concerts/edit/${nf.numFormat(concert.id)}">
                            <button id="change-btn1">
                                <img class="change" src="/static/img/icons/change-icon.png" alt="delete icon">
                            </button>
                        </a>
                        <a href="/admin-panel/concerts/delete/${nf.numFormat(concert.id)}">
                            <button id="trash-btn1" >
                                <img class="trash" src="/static/img/icons/trash.png" alt="delete icon">
                            </button>
                        </a>
                    </td>
                </tr>
                <#assign i += 1>
            </#list>
            </tbody>
        </table>
    </main>

</@admin.adminpanel2>