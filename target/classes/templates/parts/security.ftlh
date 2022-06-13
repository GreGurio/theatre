<#assign known = Session.SPRING_SECURITY_CONTEXT?? >

<#if known>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isAdmin = user.isAdmin()
        isRegistered = user.isRegistered()
    >
<#else>
    <#assign
        name = "unknown"
        isAdmin = false
        isRegistered = false
    >
</#if>