<#function descrFormat description>
    <#local str = "">
    <#local l = description?length>
    <#if l gt 80>
        <#local str += description?substring(0, 77)>
        <#local str += "...">
        <#return str>
    <#else>
        <#return description>
    </#if>
</#function>