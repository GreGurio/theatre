<#function dateTime str>
    <#assign new_str = str?replace(" ", "T")>
    <#assign final_str = new_str?substring(0, 16)>
    <#return final_str>
</#function>