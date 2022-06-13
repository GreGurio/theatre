<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<#import "functoins/numFormat.ftlh" as nf>

<@c.page>


    <main class="spectacle-main">
        <h1 class="main-header">${concert.name}</span></h1>
        <hr>

        <!-- SEATS -->

        <article class="seats-container">
            <img src="/static/img/icons/arc.png">
            <div class="seats">
                <div >

                    <#assign i = 1>
                    <#list hall as place>
                        <#if i < 12>
                            <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}"><button class="seat" id="btn2" onclick="" <#if place.isOwned()>style="background: #D62020"</#if>><p class="p-spectacle">${place.place_num}<p></button></a>
                        </#if>
                        <#assign i += 1>
                    </#list>
                </div>
                <div>
                    <#assign i = 1>
                    <#list hall as place>
                        <#if 11 < i>
                            <#if i < 29>
                                <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}"><button class="seat" id="btn2" onclick="" <#if place.isOwned()>style="background: #D62020"</#if>><p class="p-spectacle">${place.place_num}<p></button></a>
                            </#if>
                        </#if>
                        <#assign i += 1>
                    </#list>
                </div>
                <div>
                    <#assign i = 1>
                    <#list hall as place>
                        <#if 28 < i>
                            <#if i < 46>
                                <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}"><button class="seat" id="btn2" onclick="" <#if place.isOwned()>style="background: #D62020"</#if>><p class="p-spectacle">${place.place_num}<p></button></a>
                            </#if>
                        </#if>
                        <#assign i += 1>
                    </#list>
                </div>
                <div>
                    <#assign i = 1>
                    <#list hall as place>
                        <#if 45 < i>
                            <#if i < 63>
                                <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}"><button class="seat" id="btn2" onclick="" <#if place.isOwned()>style="background: #D62020"</#if>><p class="p-spectacle">${place.place_num}<p></button></a>
                            </#if>
                        </#if>
                        <#assign i += 1>
                    </#list>
                </div>
                <div>
                    <#assign i = 1>
                    <#list hall as place>
                        <#if 62 < i>
                            <#if i < 80>
                                <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}"><button class="seat" id="btn2" onclick="" <#if place.isOwned()>style="background: #D62020"</#if>><p class="p-spectacle">${place.place_num}<p></button></a>
                            </#if>
                        </#if>
                        <#assign i += 1>
                    </#list>
                </div>
                <div>
                    <#assign i = 1>
                    <#list hall as place>
                        <#if 79 < i>
                            <#if i < 97>
                                <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}"><button class="seat" id="btn2" onclick="" <#if place.isOwned()>style="background: #D62020"</#if>><p class="p-spectacle">${place.place_num}<p></button></a>
                            </#if>
                        </#if>
                        <#assign i += 1>
                    </#list>
                </div>
                <div>
                    <#assign i = 1>
                    <#list hall as place>
                        <#if 96 < i>
                            <#if i < 114>
                                <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}"><button class="seat" id="btn2" onclick="" <#if place.isOwned()>style="background: #D62020"</#if>><p class="p-spectacle">${place.place_num}<p></button></a>
                            </#if>
                        </#if>
                        <#assign i += 1>
                    </#list>
                </div>
                <div>
                    <#assign i = 1>
                    <#list hall as place>
                        <#if 113 < i>
                            <#if i < 133>
                                <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}"><button class="seat" id="btn2" onclick="" <#if place.isOwned()>style="background: #D62020"</#if>><p class="p-spectacle">${place.place_num}<p></button></a>
                            </#if>
                        </#if>
                        <#assign i += 1>
                    </#list>
                </div>
            </div>
        </article>

        <!-- SLIDER WITH SPECTACLES -->



        <article class="slider-container">
            <div class="actor-slider-wrapper-1">
                <div class="slider multiple-items">
                    <#list gallery as gallery>
                        <div><img src="/static/img/gallery/${gallery.filename}"></div>
                    </#list>
                </div>
            </div>

        </article>

        <!-- DESCRIPTION OF SPECTACLE -->

        <article class="description">
            <h1 class="headers">ОПИ<span class="spacing-correction">С</span></h1>
            <p>${concert.description}
            </p>
        </article>

        <!-- ACTORS -->


        <article class="slider-container actors">
            <h1 class="headers">АКТОР<span class="spacing-correction">И</span></h1>
            <div class="actor-slider-wrapper-2">
                <div class="slider multiple-items2">
                    <#list actors as actor>
                        <div><img src="/static/img/actors/${actor.filename}"><h4 class="slider-header">${actor.name} ${actor.surname}</h4></div>
                    </#list>


                </div>
            </div>
        </article>

        <!-- BEHIND THE SCENES -->


        <article class="behind">
            <h1 class="headers">ЗА КУЛІСАМ<span class="spacing-correction">И</span></h1>
            <div class="behind-container">
                <#list workers as worker>
                    <div class="behind-block">
                        <img src="/static/img/workers/${worker.filename}">
                        <div class="bh-cont-wrapper">
                            <h1>${worker.name}<span>${worker.surname}</span></h1>
                            <p>${worker.position}</p>
                        </div>
                    </div>
                </#list>
            </div>
        </article>
    </main>






</@c.page>

<#include "parts/footer.ftlh">


<div class="booking-form-container " id="booking-form-container-user">
    <form action="" method="POST" class="booking-form" id="booking-form-user">
        <a href="/concert/${nf.numFormat(concert.id)}"><button class="booking-form-close-btn" disabled><img src="/static/img/icons/close-icon.png"></button></a>
        <h1>&#9135 Місце ${num} &#9135</h1>
        <div class="booking-content admin">
            <p>
                <label for="price">Ціна:</label>
                <input type="text" name="price" placeholder="${price} ГРН" <#if !isAdmin>disabled<#else></#if> style="margin-bottom: 5px">
                <#if !isAdmin>
                    <input type="hidden" name="price" id="" value="">
                </#if>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
            </p>
            <#if isAdmin>
            <p>
                <p>Власник:</p>
                <p>${username}</p>
            </p>
            </#if>
            <#if isRegistered>
                <#if !isowned>
            <p class="for-button">
                <input type="submit" value="Забронювати" id="booking-form-btn">
            </p>
                </#if>
                <#if isAdmin>
                    <#if isowned>
                        <a href="/concert/${nf.numFormat(concert.id)}/${nf.numFormat(place.statement_id)}/unown" style="border: solid 1px #000; margin-top: 5px" >
                            ЗНЯТИ БРОНЬ
                        </a>
                    </#if>
                </#if>
            </#if>
        </div>
    </form>
</div>