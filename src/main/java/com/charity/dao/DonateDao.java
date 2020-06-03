package com.charity.dao;

import com.charity.entity.Donate;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * (Donate)表数据库访问层
 *
 * @author hhp
 * @since 2020-05-11 18:47:13
 */
public interface DonateDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Donate queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Donate> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param donate 实例对象
     * @return 对象列表
     */
    List<Donate> queryAll(Donate donate);

    /**
     * 新增数据
     *
     * @param donate 实例对象
     * @return 影响行数
     */
    int insert(Donate donate);

    /**
     * 修改数据
     *
     * @param donate 实例对象
     * @return 影响行数
     */
    int update(Donate donate);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    /**
     * 通过donorId查询数据
     *
     * @param donorId  捐赠者id
     * @return 对象列表
     */
    List<Donate> queryByDonorId(int donorId);

    double queryMoneyAll(@Param("donate") Donate donate, @Param("startDate")Date startDate,@Param("endDate") Date endDate);

    List<Map<String,Object>> queryMoneyDay(Donate donate);
}