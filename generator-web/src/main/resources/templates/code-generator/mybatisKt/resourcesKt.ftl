package  ${packageName}.admin.web.resources

import io.javalin.Context
import ${packageName}.admin.BizCodes
import ${packageName}.admin.server.beans
import ${packageName}.admin.service.${classInfo.className}Service
import ${packageName}.core.BizCodeException
import ${packageName}.core.web.*
import ${packageName}.entity.${classInfo.className}
import org.springframework.stereotype.Component
/**
*@description ${classInfo.classComment}
*/
@Component
class ${classInfo.className}Resource(
    private val ${classInfo.className?uncap_first}Service: ${classInfo.className}Service
) {

    //插入数据
    fun insert(ctx: Context) {
        val ${classInfo.className?uncap_first} = ctx.bodyAsClass(${classInfo.className}::class.java)
        ${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first}, ctx.reqUserLog())
        ctx.status(204)
    }

    //删除
    fun delete(ctx: Context) {
        val id = ctx.pathInt("id")
        ${classInfo.className?uncap_first}Service.delete(id, ctx.reqUserLog())
        ctx.status(204)
    }

    //更新数据
    fun update(ctx: Context) {
        val ${classInfo.className?uncap_first} = ctx.bodyAsClass(${classInfo.className}::class.java)
        ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first},ctx.reqUserLog())
        ctx.status(204)
    }

    //查询
    fun findById(ctx: Context) {
        val id = ctx.pathInt("id")
        val ${classInfo.className?uncap_first} = ${classInfo.className?uncap_first}Service.find(id,ctx.reqUserLog()) ?: throw BizCodeException(BizCodes.C_10001)
        ctx.json(${classInfo.className?uncap_first})
    }

}
