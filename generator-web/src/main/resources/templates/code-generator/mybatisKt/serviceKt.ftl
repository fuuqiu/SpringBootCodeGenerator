package ${packageName}.admin.service
import ${packageName}.core.domain.ReqLog
import ${packageName}.core.domain.Sort
import ${packageName}.dao.ArticleDao
import ${packageName}.dao.RichLogDao
import ${packageName}.entity.${classInfo.className}
import ${packageName}.mapper.${classInfo.className}Mapper
import io.lettuce.core.api.StatefulRedisConnection
import org.apache.ibatis.session.RowBounds
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
/**
 * @description ${classInfo.classComment}
 */
class  ${classInfo.className}Service (
        private val ${classInfo.className?uncap_first}Mapper: ${classInfo.className}Mapper,
        private val modelMapper: ModelMapper,
        private val richLogDao: RichLogDao,
        private val bizRedis: StatefulRedisConnection<String, String>
){

    /**
    * 新增
    */
    @Transactional
    fun insert(${classInfo.className?uncap_first} : ${classInfo.className}, reqLog: ReqLog):Int{
        ${classInfo.className}Mapper.insert(${classInfo.className?uncap_first})
    }

    /**
    * 删除
    */
    @Transactional
    fun delete(id:Int, reqLog: ReqLog):${classInfo.className}{
        ${classInfo.className}Mapper.delete(id)
    }

    /**
    * 更新
    */
    @Transactional
    fun update(${classInfo.className} ${classInfo.className?uncap_first}, reqLog: ReqLog):Int{
        ${classInfo.className}Mapper.update(${classInfo.className?uncap_first})
    }

    /**
    * 根据主键 id 查询
    */
    @Transactional(readOnly = true)
    fun ${classInfo.className} find(id:Int, reqLog: ReqLog):${classInfo.className}{
        ${classInfo.className}Mapper.find(id)
    }

    /**
    * 分页查询
    */
    @Transactional(readOnly = true)
    fun page(rb: RowBounds, sort: Sort, items: Map<String , String>, reqLog: ReqLog):List<${classInfo.className}>{
        return articleMapper.findPage(rb, sort.orders, items)
    }

}