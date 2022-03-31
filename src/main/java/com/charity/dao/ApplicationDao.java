package com.charity.dao;

import com.charity.entity.Application;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * (Application)表数据库访问层
 *
 * @author hhp
 * @since 2020-05-11 18:46:37
 */
public interface ApplicationDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Application queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Application> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);

    List<Application> query();

    /**
     * 通过实体作为筛选条件查询
     *
     * @param application 实例对象
     * @return 对象列表
     */
    List<Map<String,Object>> queryAll(Application application);

    /**
     * 新增数据
     *
     * @param application 实例对象
     * @return 影响行数
     */
    int insert(Application application);

    /**
     * 修改数据
     *
     * @param application 实例对象
     * @return 影响行数
     */
    int update(Application application);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    int count(Application application);

    int setPriority(Application application);

    List<Map<String,Object>> search(@Param("authorityId") Integer authorityId,@Param("title") String title,@Param("status")Integer status);

    /**
     * 按照分类、状态、紧急程度查询
     * @param application
     * @param stauts
     * @param urgents
     * @return
     */
    List<Map<String,Object>> queryRunUrgent(@Param("application") Application application, @Param("status") int stauts[],@Param("urgents") int urgents[]);

    /**
     * 按照分类查询 未开始、进行中、已完成的项目
     * @param application
     * @param limit
     * @return
     */
    List<Map<String,Object>> queryRun(@Param("application") Application application, @Param("limit")Integer limit);


    List<Map<String, Object>> queryApplicationList(@Param("application") Application application, @Param("keywords") String keywords,@Param("urgents") int[] urgents);

    Integer queryMaxId();

    Map<String,Object> queryMapById(Integer id);
}