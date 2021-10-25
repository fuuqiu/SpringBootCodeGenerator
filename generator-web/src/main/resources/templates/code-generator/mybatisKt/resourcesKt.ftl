package  ${packageName}.admin.web.resources

import io.javalin.http.Context
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

    //分页查询
    fun findPage(ctx: Context) {
        val rb = ctx.rowBounds()
        val sp = ctx.sortParam()
        val ps = ctx.pageFilterParams(${classInfo.className}::class.java)
        val list = ${classInfo.className?uncap_first}Service.page(rb, sp, ps, ctx.reqUserLog())
        ctx.json(list)
    }

/**
//${classInfo.classComment} 路由
path("/${classInfo.className?uncap_first}s") {
    post("/", security(${classInfo.className?uncap_first}Resource::insert))
    get("/:id", ${classInfo.className?uncap_first}Resource::findById)
    delete("/:id", security(${classInfo.className?uncap_first}Resource::delete))
    put("/:id", security(${classInfo.className?uncap_first}Resource::update))
    get("/", ${classInfo.className?uncap_first}Resource::findPage)
}
**/

}
