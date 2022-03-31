package com.charity.service;

import com.charity.entity.Donee;
import java.util.List;
import java.util.Map;

/**
 * (Donee)表服务接口
 *
 * @author hhp
 * @since 2020-05-10 21:31:55
 */
public interface DoneeService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Donee queryById(Integer id);

    Donee queryByUserId(Integer id);


    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Donee> queryAllByLimit(int offset, int limit);

    List<Donee> queryAll(Donee donee);

    List<Map<String,Object>> queryAllInfo(Donee donee);

    /**
     * 新增数据
     *
     * @param donee 实例对象
     * @return 实例对象
     */
    Donee insert(Donee donee);

    /**
     * 修改数据
     *
     * @param donee 实例对象
     * @return 实例对象
     */
    Donee update(Donee donee);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    int count();
}