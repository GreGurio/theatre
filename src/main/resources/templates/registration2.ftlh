<#import "parts/login-common.ftlh" as c>
<#import "parts/login2.ftlh" as l>
<@c.logintemplate>
    <a href="/">
        <div class="form-logo"><img src="/static/img/logo/logo-white.png"></div>
    </a>
    <!-- REGISTRATION FORM -->
    <h1 class="main-header">РЕЄСТРАЦІ<span class="spacing-correction">Я</span></h1>

    ${message?ifExists}
    <@l.login "/registration" true/>
</@c.logintemplate>