<#include "copyright.ftl"/>
package ${basePackage}.${moduleName}.mapper;

import java.util.List;
import ${basePackage}.${moduleName}.entity.${table.className};
import com.kang.ats.common.SqlMapper;
/**
 * <p>Mapper接口</p>
 * <p>Table: ${table.tableName} - ${table.remarks}</p>
 * @since ${.now}
 */

public interface ${table.className}Mapper {
	/**
	 *保存,未经校验,禁止直接调用
	 */
	void save(${table.className} model);
	
	/**
	 *获取单个对象,未经校验,禁止直接调用
	 */
	${table.className} getByCondition(${table.className} model);
	
	/**
	 *查询多个对象,未经校验,禁止直接调用
	 */
	List<${table.className}> getListByCondition(${table.className} model);
	
	/**
	 *修改,未经校验,禁止直接调用
	 */
	Integer update(${table.className} model);

	/**
	 *分页查询,未经校验,禁止直接调用
	 */
	List<${table.className}> getPageList(RequestModel<${table.className}> model);

	/**
	 *获取总记录数,未经校验,禁止直接调用
	 */
	Long totalSize(RequestModel<${table.className}> model);
}