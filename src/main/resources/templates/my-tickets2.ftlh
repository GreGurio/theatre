<#import "parts/common.ftlh" as c>
<#import "functoins/dataFormat2.ftlh" as df2>
<#import "functoins/timeFormat.ftlh" as tf>
<#import "functoins/numFormat.ftlh" as nf>



<@c.page>

<main class="tickets-main">
    <h1 class="main-header">МОЇ КВИТК<span class="spacing-correction">И</span></h1>
    <table class="tickets-table">
        <thead>
        <tr>
            <th>Назва<img src="/static/img/icons/list-icon.png" alt="list icon"></th>
            <th>Дата проведення</th>
            <th>Час проведення</th>
            <th>Номер квитка</th>
            <th>Ціна</th>
            <th>Дія</th>
        </tr>
        </thead>
        <tbody>
        <#assign i = 0>
        <#list places as place>
            <tr id="ticket1">
                <#assign j = 0>
                <#list concerts as concert>
                    <#if i = j>
                        <td>${concert.name}</td>
                        <td>${df2.dataDormat(concert.date)}</td>
                        <td>${tf.dataDormat(concert.date)}</td>
                    </#if>
                    <#assign j += 1>
                </#list>
                <td><span class="ticket-number">${place.place_num}</span></td>
                <td><span class="price">${place.price} ГРН</span></td>
                <td class="with-btn"><a href="/my-tickets/delete/${nf.numFormat(place.statement_id)}"><button id="trash-btn1" onclick="removeTicket(this.id)"><img src="/static/img/icons/trash.png" alt="delete icon"></button></a></td>
            </tr>
            <#assign i += 1>
        </#list>

        </tbody>
    </table>

</main>

</@c.page>
