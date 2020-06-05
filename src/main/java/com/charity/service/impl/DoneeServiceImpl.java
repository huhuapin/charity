package com.charity.service.impl;

import com.charity.entity.Donee;
import com.charity.dao.DoneeDao;
import com.charity.service.DoneeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Donee)表服务实现类
 *
 * @author hhp
 * @since 2020-05-10 21:31:55
 */
@Service("doneeService")
public class DoneeServiceImpl implements DoneeService {
    @Resource
    private DoneeDao doneeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Donee queryById(Integer id) {
        return this.doneeDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Donee> queryAllByLimit(int offset, int limit) {
        return this.doneeDao.queryAllByLimit(offset, limit);
    }

    @Override
    public List<Donee> queryAll(Donee donee) {
        return this.doneeDao.queryAll(donee);
    }

    /**
     * 新增数据
     *
     * @param donee 实例对象
     * @return 实例对象
     */
    @Override
    public Donee insert(Donee donee) {
        this.doneeDao.insert(donee);
        return donee;
    }

    /**
     * 修改数据
     *
     * @param donee 实例对象
     * @return 实例对象
     */
    @Override
    public Donee update(Donee donee) {
        this.doneeDao.update(donee);
        return this.queryById(donee.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.doneeDao.deleteById(id) > 0;
    }

    @Override
    public int count() {
        return this.doneeDao.count();
    }
}