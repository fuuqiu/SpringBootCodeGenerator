package cn.gopro.nete.mapper
import cn.gopro.nete.core.domain.Sort
import cn.gopro.nete.entity.${classInfo.className}
import org.apache.ibatis.annotations.Param
import org.apache.ibatis.session.RowBounds

/**
 * @description ${classInfo.classComment}
 */
interface ${classInfo.className}Mapper {

    /**
    * 新增
    **/
    fun insert(${classInfo.className?uncap_first}:${classInfo.className} ):Int

    /**
    * 刪除 By Id
    **/
    fun delete(id:Int):Int;

    /**
    * 更新
    **/
    fun update(${classInfo.className?uncap_first}:${classInfo.className}):Int

    /**
    * 查询 By Id
    **/
    fun find(id:Int):${classInfo.className}

    /**
    * 分页查询
    **/
    fun findPage(rb: RowBounds, @Param("sort") sort: List<Sort.Order>, @Param("items") items: Map<String , Any>): List<${classInfo.className}>

}