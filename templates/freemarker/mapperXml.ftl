<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${basePackage}.${moduleName}.mapper.${table.className}Mapper">
	<sql id="Base_Column_List">
		<#list table.baseColumns as column>
			${column.columnName},
		</#list>
		<#list table.primaryKeys as column>
			${column.columnName}
		</#list>
	</sql>
	
	<update id="update" parameterType="${basePackage}.${moduleName}.entity.${table.className}">
	    update ${table.tableName} 
	    <set>
			<#list table.baseColumns as column>
				<if test="null != ${column.javaProperty}"> ${column.columnName} = # { ${column.javaProperty} ,jdbcType = ${column.jdbcTypeName }},</if>
			</#list>
			<#list table.primaryKeys as column>
				<if test="null != ${column.javaProperty}"> ${column.columnName} = # { ${column.javaProperty} ,jdbcType = ${column.jdbcTypeName }}</if>
			</#list>
	    </set>
	    where ID = # {id,jdbcType=NUMERIC}
	</update>
	
	
	<insert id="save" parameterType="${basePackage}.${moduleName}.entity.${table.className}">
		<selectKey resultType="int" keyProperty="id" order="AFTER">
			SELECT
			LAST_INSERT_ID()
		</selectKey>
		insert into ${table.tableName} (
	               <include refid="Base_Column_List"/>
		) VALUES (
			<#list table.baseColumns as column>
				# {${column.javaProperty},jdbcType=${column.jdbcTypeName}},
			</#list>
			<#list table.primaryKeys as column>
				# {${column.javaProperty},jdbcType=${column.jdbcTypeName}}
			</#list>
		)
	</insert>
	
	<select id="getByCondition" parameterType="${basePackage}.${moduleName}.entity.${table.className}" resultMap="BaseResultMap">
		select <include refid="Base_Column_List"/> 
		  from ${table.tableName}
		 <where>
			<#list table.baseColumns as column>
				<if test="null != ${column.javaProperty}"> and ${column.columnName}=# {${column.javaProperty},jdbcType=${column.jdbcTypeName}}</if>
			</#list>
			<#list table.primaryKeys as column>
				<if test="null != ${column.javaProperty}"> and ${column.columnName}=# {${column.javaProperty},jdbcType=${column.jdbcTypeName}}</if>
			</#list>
		 </where>
	</select>
	
	<select id="getListByCondition" parameterType="${basePackage}.${moduleName}.entity.${table.className}" resultMap="BaseResultMap">
		select <include refid="Base_Column_List"/> 
		  from ${table.tableName}
		 <where>
			<#list table.baseColumns as column>
				<if test="null != ${column.javaProperty}"> and ${column.columnName}=# {${column.javaProperty},jdbcType=${column.jdbcTypeName}}</if>
			</#list>
			<#list table.primaryKeys as column>
				<if test="null != ${column.javaProperty}"> and ${column.columnName}=# {${column.javaProperty},jdbcType=${column.jdbcTypeName}}</if>
			</#list>
		 </where>
	</select>

	<select id="getPageList"  resultMap="BaseResultMap" parameterType="com.yizuanbao.cms.bean.RequestModel">
		select <include refid="Base_Column_List"/> 
		  from ${table.tableName}
		<if test="null != model">
		 <where>
			<#list table.baseColumns as column>
				<if test="null != model.${column.javaProperty}"> and ${column.columnName}=# {model.${column.javaProperty},jdbcType=${column.jdbcTypeName}}</if>
			</#list>
			<#list table.primaryKeys as column>
				<if test="null != model.${column.javaProperty}"> and ${column.columnName}=# {model.${column.javaProperty},jdbcType=${column.jdbcTypeName}}</if>
			</#list>
		 </where>
		</if>
		 LIMIT # {pageNo},# {pageSize}
	</select>

	<select id="totalSize"  resultType="java.lang.Long" parameterType="com.yizuanbao.cms.bean.RequestModel">
		select 
			count(1)
		  from ${table.tableName}
		<if test="null != model">
		 <where>
			<#list table.baseColumns as column>
				<if test="null != model.${column.javaProperty}"> and ${column.columnName}=# {model.${column.javaProperty},jdbcType=${column.jdbcTypeName}}</if>
			</#list>
			<#list table.primaryKeys as column>
				<if test="null != model.${column.javaProperty}"> and ${column.columnName}=# {model.${column.javaProperty},jdbcType=${column.jdbcTypeName}}</if>
			</#list>
		 </where>
		</if>
	</select>
	
	<resultMap type="${basePackage}.${moduleName}.entity.${table.className}" id="BaseResultMap">
			<#list table.baseColumns as column>
				<result column="${column.columnName}" property="${column.javaProperty}" jdbcType="${column.jdbcTypeName}" />
			</#list>
			<#list table.primaryKeys as column>
				<result column="${column.columnName}" property="${column.javaProperty}" jdbcType="${column.jdbcTypeName}" />
			</#list>
	</resultMap>
	
</mapper>
