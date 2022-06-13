<#import "parts/common.ftlh" as c>

<@c.page>
    <#assign i = 0>
    <#list places as place>
        <div style = "border: solid 1px #000">
        <#assign j = 0>
        <#list concerts as concert>
            <#if i = j>
                <div>
                    <div>${concert.name}</div>
                    <div>${concert.date}</div>
                </div>
            </#if>
            <#assign j += 1>
        </#list>
        <div>
            <div>${place.place_num}</div>
            <div>${place.price}</div>
            <div>${place.ownerName}</div>
        </div>
        <#assign i += 1>
        </div>
    </#list>



</@c.page>