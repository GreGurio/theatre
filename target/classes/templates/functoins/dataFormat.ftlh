<#function dataDormat data>
    <#local str = "">
    <#local counter = 0>
    <#list data?split("-") as nums>
        <#if counter == 1>
            <#local str += nums>
            <#local str += "/">
        <#elseif counter == 2>
            <#list nums?split(" ") as nums2>
                <#if counter == 2>
                    <#local str += nums2>
                </#if>
                <#local counter += 1>
            </#list>
        </#if>
        <#local counter += 1>
    </#list>
    <#return str>
</#function>