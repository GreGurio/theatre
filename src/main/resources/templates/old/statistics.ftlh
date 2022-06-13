<#include "admin-panel.ftlh">



<#assign i = 0>
<#list concerts as concert>
    <div style="border: solid 1px #000">
    <div>
        <div>${concert.name}</div>
        <div>${concert.date}</div>
    </div>
    <#assign j = 0>
    <#list prices as price>
        <#if i = j>
            <div>${price}</div>
        </#if>
        <#assign j += 1>
    </#list>
    <#assign j = 0>
    <#list tickets as num>
        <#if i = j>
            <div>${num}</div>
        </#if>
        <#assign j += 1>
    </#list>
    <#assign i += 1>
    </div>
</#list>



