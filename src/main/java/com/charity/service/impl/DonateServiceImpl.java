package com.charity.service.impl;

import com.charity.entity.Donate;
import com.charity.dao.DonateDao;
import com.charity.service.DonateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * (Donate)表服务实现类
 *
 * @author hhp
 * @since 2020-05-11 18:47:14
 */
@Service("donateService")
public class DonateServiceImpl implements DonateService {
    @Resource
    private DonateDao donateDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Donate queryById(Integer id) {
        return this.donateDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Donate> queryAllByLimit(int offset, int limit) {
        return this.donateDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param donate 实例对象
     * @return 实例对象
     */
    @Override
    public Donate insert(Donate donate) {
        this.donateDao.insert(donate);
        return donate;
    }

    /**
     * 修改数据
     *
     * @param donate 实例对象
     * @return 实例对象
     */
    @Override
    public Donate update(Donate donate) {
        this.donateDao.update(donate);
        return this.queryById(donate.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.donateDao.deleteById(id) > 0;
    }

    @Override
    public double queryMoneyAll(Donate donate, Date startDate, Date endDate) {
        return  this.donateDao.queryMoneyAll(donate,startDate,endDate);
    }

    @Override
    public List<Map<String, Object>> queryMoneyDay(Donate donate) {
        return this.donateDao.queryMoneyDay(donate);
    }
}