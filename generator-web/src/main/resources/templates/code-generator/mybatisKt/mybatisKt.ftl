<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${packageName}.mapper.${classInfo.className}Mapper">

    <insert id="insert" useGeneratedKeys="true" keyProperty="id">
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            INSERT INTO gopro_nete.t_${classInfo.tableName}
            <trim prefix="(" suffix=")" suffixOverrides=",">
                <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                    <#list classInfo.fieldList as fieldItem >
                        <#if fieldItem.columnName != "id" >
                            ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
                        </#if>
                    </#list>
                </#if>
            </trim>
            <trim prefix="values (" suffix=")" suffixOverrides=",">
                <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                    <#list classInfo.fieldList as fieldItem >
                        <#if fieldItem.columnName != "id" >
                            ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>
                        </#if>
                    </#list>
                </#if>
            </trim>
        </#if>
    </insert>

    <delete id="delete" >
        DELETE FROM gopro_nete.t_${classInfo.tableName}
        WHERE id = ${r"#{id}"}
    </delete>

    <update id="update" parameterType="${packageName}.entity.${classInfo.className}">
        UPDATE gopro_nete.t_${classInfo.tableName}
        <set>
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id" && fieldItem.columnName != "AddTime" && fieldItem.columnName != "UpdateTime" >
                    ${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>
                </#if>
            </#list>
        </set>
        WHERE id = ${r"#{"}id${r"}"}
    </update>


    <select id="findById" resultType="${packageName}.entity.${classInfo.className}">
        select * from gopro_nete.t_${classInfo.tableName} where id = ${r"#{id}"}
    </select>


    <select id="findPage" resultType="${packageName}.entity.${classInfo.className}">
        select * from gopro_nete.t_${classInfo.tableName}
        <foreach collection="items" index="key" item="value" separator=" AND " open="WHERE (" close=")">
            <if test="value != null">
                ${r"${"}key${r"}"}  ${r"${"}value${r"}"}
            </if>
        </foreach>
        <if test="sort.size > 0">
            ORDER BY
            <foreach collection="sort" item="item" separator=",">
                ${r"${"}item.name${r"}"} ${r"${"}item.direction${r"}"}
            </foreach>
        </if>
    </select>

</mapper>
