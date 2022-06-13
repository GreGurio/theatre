
<#import "functoins/numFormat.ftlh" as nf>
<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

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
<!--
            <div>
                <button class="seat" id="btn12" onclick=""><p>12<p></button>
                <button class="seat" id="btn13" onclick=""><p>13<p></button>
                <button class="seat" id="btn14" onclick=""><p>14<p></button>
                <button class="seat" id="btn15" onclick=""><p>15<p></button>
                <button class="seat" id="btn16" onclick=""><p>16<p></button>
                <button class="seat" id="btn17" onclick=""><p>17<p></button>
                <button class="seat" id="btn18" onclick=""><p>18<p></button>
                <button class="seat" id="btn19" onclick=""><p>19<p></button>
                <button class="seat" id="btn20" onclick=""><p>20<p></button>
                <button class="seat" id="btn21" onclick=""><p>21<p></button>
                <button class="seat" id="btn22" onclick=""><p>22<p></button>
                <button class="seat" id="btn23" onclick=""><p>23<p></button>
                <button class="seat" id="btn24" onclick=""><p>24<p></button>
                <button class="seat" id="btn25" onclick=""><p>25<p></button>
                <button class="seat" id="btn26" onclick=""><p>26<p></button>
                <button class="seat" id="btn27" onclick=""><p>27<p></button>
                <button class="seat" id="btn28" onclick=""><p>28<p></button>
            </div>

            <div>
                <button class="seat" id="btn29" onclick=""><p>29<p></button>
                <button class="seat" id="btn30" onclick=""><p>30<p></button>
                <button class="seat" id="btn31" onclick=""><p>31<p></button>
                <button class="seat" id="btn32" onclick=""><p>32<p></button>
                <button class="seat" id="btn33" onclick=""><p>33<p></button>
                <button class="seat" id="btn34" onclick=""><p>34<p></button>
                <button class="seat" id="btn35" onclick=""><p>35<p></button>
                <button class="seat" id="btn36" onclick=""><p>36<p></button>
                <button class="seat" id="btn37" onclick=""><p>37<p></button>
                <button class="seat" id="btn38" onclick=""><p>38<p></button>
                <button class="seat" id="btn39" onclick=""><p>39<p></button>
                <button class="seat" id="btn40" onclick=""><p>40<p></button>
                <button class="seat" id="btn41" onclick=""><p>41<p></button>
                <button class="seat" id="btn42" onclick=""><p>42<p></button>
                <button class="seat" id="btn43" onclick=""><p>43<p></button>
                <button class="seat" id="btn44" onclick=""><p>44<p></button>
                <button class="seat" id="btn45" onclick=""><p>45<p></button>
            </div>

            <div>
                <button class="seat" id="btn46" onclick=""><p>46<p></button>
                <button class="seat" id="btn47" onclick=""><p>47<p></button>
                <button class="seat" id="btn48" onclick=""><p>48<p></button>
                <button class="seat" id="btn49" onclick=""><p>49<p></button>
                <button class="seat" id="btn50" onclick=""><p>50<p></button>
                <button class="seat" id="btn51" onclick=""><p>51<p></button>
                <button class="seat" id="btn52" onclick=""><p>52<p></button>
                <button class="seat" id="btn53" onclick=""><p>53<p></button>
                <button class="seat" id="btn54" onclick=""><p>54<p></button>
                <button class="seat" id="btn55" onclick=""><p>55<p></button>
                <button class="seat" id="btn56" onclick=""><p>56<p></button>
                <button class="seat" id="btn57" onclick=""><p>57<p></button>
                <button class="seat" id="btn58" onclick=""><p>58<p></button>
                <button class="seat" id="btn59" onclick=""><p>59<p></button>
                <button class="seat" id="btn60" onclick=""><p>60<p></button>
                <button class="seat" id="btn61" onclick=""><p>61<p></button>
                <button class="seat" id="btn62" onclick=""><p>62<p></button>
            </div>

            <div>
                <button class="seat" id="btn63" onclick=""><p>63<p></button>
                <button class="seat" id="btn64" onclick=""><p>64<p></button>
                <button class="seat" id="btn65" onclick=""><p>65<p></button>
                <button class="seat" id="btn66" onclick=""><p>66<p></button>
                <button class="seat" id="btn67" onclick=""><p>67<p></button>
                <button class="seat" id="btn68" onclick=""><p>68<p></button>
                <button class="seat" id="btn69" onclick=""><p>69<p></button>
                <button class="seat" id="btn70" onclick=""><p>70<p></button>
                <button class="seat" id="btn71" onclick=""><p>71<p></button>
                <button class="seat" id="btn72" onclick=""><p>72<p></button>
                <button class="seat" id="btn73" onclick=""><p>73<p></button>
                <button class="seat" id="btn74" onclick=""><p>74<p></button>
                <button class="seat" id="btn75" onclick=""><p>75<p></button>
                <button class="seat" id="btn76" onclick=""><p>76<p></button>
                <button class="seat" id="btn77" onclick=""><p>77<p></button>
                <button class="seat" id="btn78" onclick=""><p>78<p></button>
                <button class="seat" id="btn79" onclick=""><p>79<p></button>
            </div>

            <div>
                <button class="seat" id="btn80" onclick=""><p>80<p></button>
                <button class="seat" id="btn81" onclick=""><p>81<p></button>
                <button class="seat" id="btn82" onclick=""><p>82<p></button>
                <button class="seat" id="btn83" onclick=""><p>83<p></button>
                <button class="seat" id="btn84" onclick=""><p>84<p></button>
                <button class="seat" id="btn85" onclick=""><p>85<p></button>
                <button class="seat" id="btn86" onclick=""><p>86<p></button>
                <button class="seat" id="btn87" onclick=""><p>87<p></button>
                <button class="seat" id="btn88" onclick=""><p>88<p></button>
                <button class="seat" id="btn89" onclick=""><p>89<p></button>
                <button class="seat" id="btn90" onclick=""><p>90<p></button>
                <button class="seat" id="btn91" onclick=""><p>91<p></button>
                <button class="seat" id="btn92" onclick=""><p>92<p></button>
                <button class="seat" id="btn93" onclick=""><p>93<p></button>
                <button class="seat" id="btn94" onclick=""><p>94<p></button>
                <button class="seat" id="btn95" onclick=""><p>95<p></button>
                <button class="seat" id="btn96" onclick=""><p>96<p></button>
            </div>

            <div>
                <button class="seat" id="btn97" onclick=""><p>97<p></button>
                <button class="seat" id="btn98" onclick=""><p>98<p></button>
                <button class="seat" id="btn99" onclick=""><p>99<p></button>
                <button class="seat" id="btn100" onclick=""><p>100<p></button>
                <button class="seat" id="btn101" onclick=""><p>101<p></button>
                <button class="seat" id="btn102" onclick=""><p>102<p></button>
                <button class="seat" id="btn103" onclick=""><p>103<p></button>
                <button class="seat" id="btn104" onclick=""><p>104<p></button>
                <button class="seat" id="btn105" onclick=""><p>105<p></button>
                <button class="seat" id="btn106" onclick=""><p>106<p></button>
                <button class="seat" id="btn107" onclick=""><p>107<p></button>
                <button class="seat" id="btn108" onclick=""><p>108<p></button>
                <button class="seat" id="btn109" onclick=""><p>109<p></button>
                <button class="seat" id="btn110" onclick=""><p>110<p></button>
                <button class="seat" id="btn111" onclick=""><p>111<p></button>
                <button class="seat" id="btn112" onclick=""><p>112<p></button>
                <button class="seat" id="btn113" onclick=""><p>113<p></button>
            </div>

            <div>
                <button class="seat" id="btn114" onclick=""><p>114<p></button>
                <button class="seat" id="btn115" onclick=""><p>115<p></button>
                <button class="seat" id="btn116" onclick=""><p>116<p></button>
                <button class="seat" id="btn117" onclick=""><p>117<p></button>
                <button class="seat" id="btn118" onclick=""><p>118<p></button>
                <button class="seat" id="btn119" onclick=""><p>119<p></button>
                <button class="seat" id="btn120" onclick=""><p>120<p></button>
                <button class="seat" id="btn121" onclick=""><p>121<p></button>
                <button class="seat" id="btn122" onclick=""><p>122<p></button>
                <button class="seat" id="btn123" onclick=""><p>123<p></button>
                <button class="seat" id="btn124" onclick=""><p>124<p></button>
                <button class="seat" id="btn125" onclick=""><p>125<p></button>
                <button class="seat" id="btn126" onclick=""><p>126<p></button>
                <button class="seat" id="btn127" onclick=""><p>127<p></button>
                <button class="seat" id="btn128" onclick=""><p>128<p></button>
                <button class="seat" id="btn129" onclick=""><p>129<p></button>
                <button class="seat" id="btn130" onclick=""><p>130<p></button>
                <button class="seat" id="btn131" onclick=""><p>131<p></button>
                <button class="seat" id="btn132" onclick=""><p>132<p></button>
            </div>
            -->
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



