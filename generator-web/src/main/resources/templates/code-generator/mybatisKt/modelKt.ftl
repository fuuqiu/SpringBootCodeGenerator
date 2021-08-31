package cn.gopro.nete.entity

import java.util.*

/**
<#list classInfo.fieldList as fieldItem >
    <#if isComment?exists && isComment==true>
* @param ${fieldItem.fieldName} ${fieldItem.fieldComment}
    </#if>
</#list>
* @description ${classInfo.classComment}
**/
@Schema(description = "${classInfo.classComment}")
data class ${classInfo.className}(
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >
    @Schema(description = "${fieldItem.fieldComment}")
    val ${fieldItem.fieldName}:${fieldItem.fieldClass} = ${fieldItem.defaults}<#if fieldItem_has_next>,</#if>
</#list>
</#if>

)
