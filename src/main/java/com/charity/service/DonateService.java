package com.charity.service;

import com.charity.entity.Donate;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * (Donate)表服务接口
 *
 * @author hhp
 * @since 2020-05-11 18:47:14
 */
public interface DonateService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Donate queryById(Integer id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Donate> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param donate 实例对象
     * @return 实例对象
     */
    Donate insert(Donate donate);

    /**
     * 修改数据
     *
     * @param donate 实例对象
     * @return 实例对象
     */
    Donate update(Donate donate);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    double queryMoneyAll(Donate donate, Date startDate, Date endDate);

    List<Map<String,Object>> queryMoneyDay(Donate donate);
}