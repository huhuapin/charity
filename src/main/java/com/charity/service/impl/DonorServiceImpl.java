package com.charity.service.impl;

import com.charity.entity.Donor;
import com.charity.dao.DonorDao;
import com.charity.service.DonorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Donor)表服务实现类
 *
 * @author hhp
 * @since 2020-05-11 18:33:47
 */
@Service("donorService")
public class DonorServiceImpl implements DonorService {
    @Resource
    private DonorDao donorDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Donor queryById(Integer id) {
        return this.donorDao.queryById(id);
    }

    @Override
    public Donor queryByUserId(Integer id){
        return this.donorDao.queryByUserId(id);
    }


    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Donor> queryAllByLimit(int offset, int limit) {
        return this.donorDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param donor 实例对象
     * @return 实例对象
     */
    @Override
    public Donor insert(Donor donor) {
        this.donorDao.insert(donor);
        return donor;
    }

    /**
     * 修改数据
     *
     * @param donor 实例对象
     * @return 实例对象
     */
    @Override
    public Donor update(Donor donor) {
        this.donorDao.update(donor);
        return this.queryById(donor.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.donorDao.deleteById(id) > 0;
    }

    @Override
    public int count() {
        return this.donorDao.count();
    }
}