package com.charity.service.impl;

import com.charity.entity.Trace;
import com.charity.dao.TraceDao;
import com.charity.service.TraceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Trace)表服务实现类
 *
 * @author hhp
 * @since 2020-05-10 21:32:54
 */
@Service("traceService")
public class TraceServiceImpl implements TraceService {
    @Resource
    private TraceDao traceDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Trace queryById(Integer id) {
        return this.traceDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Trace> queryAllByLimit(int offset, int limit) {
        return this.traceDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param trace 实例对象
     * @return 实例对象
     */
    @Override
    public Trace insert(Trace trace) {
        this.traceDao.insert(trace);
        return trace;
    }

    /**
     * 修改数据
     *
     * @param trace 实例对象
     * @return 实例对象
     */
    @Override
    public Trace update(Trace trace) {
        this.traceDao.update(trace);
        return this.queryById(trace.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.traceDao.deleteById(id) > 0;
    }
}