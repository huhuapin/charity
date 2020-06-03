package com.charity.dao;

import com.charity.entity.Trace;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (Trace)表数据库访问层
 *
 * @author hhp
 * @since 2020-05-10 21:32:54
 */
public interface TraceDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Trace queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Trace> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param trace 实例对象
     * @return 对象列表
     */
    List<Trace> queryAll(Trace trace);

    /**
     * 新增数据
     *
     * @param trace 实例对象
     * @return 影响行数
     */
    int insert(Trace trace);

    /**
     * 修改数据
     *
     * @param trace 实例对象
     * @return 影响行数
     */
    int update(Trace trace);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

}