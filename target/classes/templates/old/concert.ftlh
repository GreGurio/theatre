<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <div>${concert.name}</div>
    <div>${concert.description}</div>
    <div>${concert.date}</div>
    <div>${concert.filename}</div>

    <#list hall as place>
        <div>${place.place_num}</div>
        <div>${place.price}</div>
        <#if place.isOwned()>
            <div>1</div>
            <#else>
            <div>0</div>
        </#if>
        <#if isAdmin>
            <div>${place.ownerName}</div>
        </#if>
    </#list>


    <s>images</s>
    <#list gallery as gallery>
        <div>
            <img src="/img/${gallery.filename}" alt="" style="width: 100px; height: 100px">
            ${gallery.concertid}
            ${gallery.filename}
        </div>
    </#list>
    
    <#list actors as actor>
        <div>${actor.name}</div>
        <div>${actor.surname}</div>
        <div><img src="/img/actors/${actor.filename}" alt=""></div>
    </#list>

    <#list workers as worker>
        <div>${worker.name}</div>
        <div>${worker.surname}</div>
        <div>${worker.position}</div>
        <div><img src="/img/workers/${worker.filename}" alt=""></div>
    </#list>
</@c.page>