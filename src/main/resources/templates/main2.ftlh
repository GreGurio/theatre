<#import "parts/common.ftlh" as c>
<#import "functoins/dataFormat.ftlh" as df>
<#import "functoins/descrFormat.ftlh" as def>
    <#import "functoins/numFormat.ftlh" as nf>

<@c.page>
<!-- MAIN -->

<main class="main">

    <h1 class="main-header">АФІШ<span class="spacing-correction">А</span></h1>
    <article>
    <#assign i = 0>
    <#list concerts as concert>
        <div class="spectacle sp1">
            <a href="/concert/${nf.numFormat(concert.id)}">
                <#if concert.filename??>
                    <img class="spectacle-image" src="/static/img/gallery/${concert.filename}" alt="${concert.name}">
                </#if>
                <div>
                    <h2 class="spectacle-header">${concert.name}</h2>
                    <#assign j = 0>
                    <#list prices as price>
                        <#if i == j>
                            <h3><span class="spectacle-price">${price}</span><span>${df.dataDormat(concert.date)}</span></h3>
                        </#if>
                        <#assign j += 1>
                    </#list>
                    <p>${def.descrFormat(concert.description)}</p>
                </div>
            </a>
        </div>
        <#assign i += 1>
    <#else>
        No concerts

    </#list>

    </article>
</main>



</@c.page>
<#include "parts/footer.ftlh">