package com.charity.service;

import com.charity.entity.Donor;
import java.util.List;

/**
 * (Donor)表服务接口
 *
 * @author hhp
 * @since 2020-05-11 18:33:47
 */
public interface DonorService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Donor queryById(Integer id);

    Donor queryByUserId(Integer id);


    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Donor> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param donor 实例对象
     * @return 实例对象
     */
    Donor insert(Donor donor);

    /**
     * 修改数据
     *
     * @param donor 实例对象
     * @return 实例对象
     */
    Donor update(Donor donor);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    int count();

}