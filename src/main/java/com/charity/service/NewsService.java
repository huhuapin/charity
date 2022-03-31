package com.charity.service;

import com.charity.entity.News;
import java.util.List;

/**
 * (News)表服务接口
 *
 * @author hhp
 * @since 2020-05-10 21:32:40
 */
public interface NewsService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    News queryById(Integer id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<News> queryAllByLimit(int offset, int limit);

    List<News> queryAll(News news);
    /**
     * 新增数据
     *
     * @param news 实例对象
     * @return 实例对象
     */
    News insert(News news);

    /**
     * 修改数据
     *
     * @param news 实例对象
     * @return 实例对象
     */
    News update(News news);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    List<News> search(String title,News news);

}