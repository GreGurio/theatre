<#import "admin-panel2.ftlh" as admin>

<@admin.adminpanel2>

<!-- MAIN -->

<main class="statistics-main">
    <table class="statistics-table">
        <caption class="statistics-caption">Статистика популярності спектаклів</caption>
        <thead>
        <tr>
            <th>Назва<img src="/static/img/icons/list-icon.png" alt="list icon"></th>
            <th>Дата проведення</th>
            <th>Мінімальна ціна</th>
            <th>Кількість проданих білетів</th>
        </tr>
        </thead>
        <tbody>

        <#assign i = 0>
        <#list concerts as concert>
            <tr id="record1">
                <td>${concert.name}</td>
                <td>${concert.date}</td>
                <#assign j = 0>
                <#list prices as price>
                    <#if i = j>
                    <td><span class="price">${price} ГРН</span></td>
                    </#if>
                    <#assign j += 1>
                </#list>
                <#assign j = 0>
                <#list tickets as num>
                    <#if i = j>
                <td><span class="sold">${num}</span></td>
                    </#if>
                    <#assign j += 1>
                </#list>
            </tr>
            <#assign i += 1>
        </#list>


        </tbody>
    </table>

</main>

</@admin.adminpanel2>