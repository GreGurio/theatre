<#import "parts/common.ftlh" as c>
<#import "functoins/dataFormat.ftlh" as df>
<#import "functoins/descrFormat.ftlh" as def>

<@c.page>
    <div>Hello, my name is Andrey</div>
    <div>
        <#assign i = 0>
        <#list concerts as concert>


            <div style="border: solid 1px #000">
                <a href="/concert/${concert.id}">
                <div>${concert.name}</div>
                <div>${def.descrFormat(concert.description)}</div>
                <div>${concert.id}</div>
                <div>${df.dataDormat(concert.date)}</div>
                <#if concert.filename??>
                    <div><img src="/img/${concert.filename}" style="width: 100px; height: 100px;"  alt=""></div>
                </#if>
                <#assign j = 0>
                <#list prices as price>
                    <#if i = j>
                        <div>
                            ${price}
                        </div>
                    </#if>
                    <#assign j += 1>
                </#list>

                </a>
            </div>
            <#assign i += 1>


            <#else>
            No concerts

        </#list>

    </div>

</@c.page>
<#include "parts/footer.ftlh">