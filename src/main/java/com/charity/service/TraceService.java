package com.charity.service;

import com.charity.entity.Trace;
import java.util.List;

/**
 * (Trace)表服务接口
 *
 * @author hhp
 * @since 2020-05-10 21:32:54
 */
public interface TraceService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Trace queryById(Integer id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Trace> queryAllByLimit(int offset, int limit);

    List<Trace> queryAll(Trace trace);

    /**
     * 新增数据
     *
     * @param trace 实例对象
     * @return 实例对象
     */
    Trace insert(Trace trace);

    /**
     * 修改数据
     *
     * @param trace 实例对象
     * @return 实例对象
     */
    Trace update(Trace trace);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

}