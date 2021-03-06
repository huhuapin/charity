package com.charity.service;

import com.charity.entity.Application;
import java.util.List;
import java.util.Map;

/**
 * (Application)表服务接口
 *
 * @author hhp
 * @since 2020-05-11 18:46:37
 */
public interface ApplicationService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Application queryById(Integer id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Application> queryAllByLimit(int offset, int limit);

    /**
     * 查询所有申请
     * @param application
     * @return
     */
    List<Map<String, Object>> queryAll(Application application);


    List<Map<String, Object>> queryRunOrderByUrgent(Application application);

    /**
     * 新增数据
     *
     * @param application 实例对象
     * @return 实例对象
     */
    Application insert(Application application);

    /**
     * 修改数据
     *
     * @param application 实例对象
     * @return 实例对象
     */
    Application update(Application application);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    int count(Application application);

    int setPriority(Application application);

    List<Map<String,Object>> search(Integer authorityId,String title,Integer status);


    List<Map<String,Object>> queryRun(Application application,Integer limit);

    List<Map<String, Object>> queryApplicationList(Application application, String keywords);


}