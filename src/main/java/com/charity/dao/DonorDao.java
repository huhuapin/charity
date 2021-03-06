package com.charity.dao;

import com.charity.entity.Donor;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (Donor)表数据库访问层
 *
 * @author hhp
 * @since 2020-05-11 18:33:47
 */
public interface DonorDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Donor queryById(Integer id);

    Donor queryByUserId(Integer id);
    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Donor> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param donor 实例对象
     * @return 对象列表
     */
    List<Donor> queryAll(Donor donor);

    /**
     * 新增数据
     *
     * @param donor 实例对象
     * @return 影响行数
     */
    int insert(Donor donor);

    /**
     * 修改数据
     *
     * @param donor 实例对象
     * @return 影响行数
     */
    int update(Donor donor);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    int count();

}