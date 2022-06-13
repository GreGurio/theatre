<#function dataDormat data>
    <#local str = "">
    <#local counter = 0>
    <#list data?split(" ") as nums>
        <#if counter == 1>
            <#local counter_2 = 0>
            <#list nums?split(":") as nums2>
                <#if counter_2 == 0>
                    <#local str += nums2>
                    <#local str += ":">
                <#elseif counter_2 == 1>
                    <#local str += nums2>
                </#if>
                <#local counter_2 += 1>
            </#list>
        </#if>
        <#local counter += 1>
    </#list>
    <#return str>
</#function>