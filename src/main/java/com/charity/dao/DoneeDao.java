package com.charity.dao;

import com.charity.entity.Donee;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

/**
 * (Donee)表数据库访问层
 *
 * @author hhp
 * @since 2020-05-10 21:31:55
 */
public interface DoneeDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Donee queryById(Integer id);

    Donee queryByUserId(Integer id);


    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Donee> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param donee 实例对象
     * @return 对象列表
     */
    List<Donee> queryAll(Donee donee);


    List<Map<String,Object>> queryAllInfo(Donee donee);

    /**
     * 新增数据
     *
     * @param donee 实例对象
     * @return 影响行数
     */
    int insert(Donee donee);

    /**
     * 修改数据
     *
     * @param donee 实例对象
     * @return 影响行数
     */
    int update(Donee donee);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    int count();
}