<#include "security.ftlh">
<#import "login.ftlh" as l>

<!-- HEADER -->
<header>
    <div class="logo-container">
        <a href="/" class="nav-bar__main-link">
            <img src="/static/img/logo/LogoTextBlack.png">
        </a>
    </div>
    <ul>
        <#if isAdmin>
            <li class="el-with-after nav-bar__link"><a href="/admin-panel">ПАНЕЛЬ АДМІНІСТРАТОРА</a></li>
        </#if>
        <li class="nav-bar__link"><a href="/my-tickets">МОЇ КВИТКИ</a></li>
        <li class="el-with-before nav-bar__link"><a href="/contacts">КОНТАКТИ</a></li>
        <#if isRegistered>
            <li><@l.logout /></li>
        <#else>
            <li><a href="../login"><button class="register-btn" id="register-btn">АВТОРИЗУВАТИСЬ</button></a></li>
        </#if>
    </ul>
</header>