package com.charity.service;

import com.charity.entity.Authority;
import java.util.List;
import java.util.Map;

/**
 * (Authority)表服务接口
 *
 * @author hhp
 * @since 2020-05-29 19:20:51
 */
public interface AuthorityService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Authority queryById(Integer id);

    Authority queryByUserId(Integer id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Authority> queryAllByLimit(int offset, int limit);

    List<Map<String,Object>> queryAll(Authority authority);


    List<Map<String,Object>> queryByName(String name);

    /**
     * 新增数据
     *
     * @param authority 实例对象
     * @return 实例对象
     */
    Authority insert(Authority authority);

    /**
     * 修改数据
     *
     * @param authority 实例对象
     * @return 实例对象
     */
    Authority update(Authority authority);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    //计算总用户量
    int count();

    double totalFound();
}