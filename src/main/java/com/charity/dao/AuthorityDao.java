package com.charity.dao;

import com.charity.entity.Authority;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

/**
 * (Authority)表数据库访问层
 *
 * @author hhp
 * @since 2020-05-29 19:20:51
 */
public interface AuthorityDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Authority queryById(Integer id);

    Authority queryByUserId(Integer id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Authority> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param authority 实例对象
     * @return 对象列表
     */
    List<Map<String,Object>> queryAll(Authority authority);

    List<Map<String,Object>> queryByName(String name);


    /**
     * 新增数据
     *
     * @param authority 实例对象
     * @return 影响行数
     */
    int insert(Authority authority);

    /**
     * 修改数据
     *
     * @param authority 实例对象
     * @return 影响行数
     */
    int update(Authority authority);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    /**
     * 计算总机构数
     * @return
     */
    int count();

    double totalFound();



}