package com.charity.service.impl;

import com.charity.entity.Authority;
import com.charity.dao.AuthorityDao;
import com.charity.service.AuthorityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * (Authority)表服务实现类
 *
 * @author hhp
 * @since 2020-05-29 19:20:52
 */
@Service("authorityService")
public class AuthorityServiceImpl implements AuthorityService {
    @Resource
    private AuthorityDao authorityDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Authority queryById(Integer id) {
        return this.authorityDao.queryById(id);
    }

    @Override
    public Authority queryByUserId(Integer id) {
        return this.authorityDao.queryByUserId(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Authority> queryAllByLimit(int offset, int limit) {
        return this.authorityDao.queryAllByLimit(offset, limit);
    }

    @Override
    public List<Map<String, Object>> queryAll(Authority authority) {
        return this.authorityDao.queryAll(authority);
    }

    @Override
    public List<Map<String, Object>> queryByName(String name) {
        return this.authorityDao.queryByName(name);
    }

    /**
     * 新增数据
     *
     * @param authority 实例对象
     * @return 实例对象
     */
    @Override
    public Authority insert(Authority authority) {
        this.authorityDao.insert(authority);
        return authority;
    }

    /**
     * 修改数据
     *
     * @param authority 实例对象
     * @return 实例对象
     */
    @Override
    public Authority update(Authority authority) {
        this.authorityDao.update(authority);
        return this.queryById(authority.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.authorityDao.deleteById(id) > 0;
    }

    @Override
    public int count() {
        return this.authorityDao.count();
    }


    @Override
    public double totalFound() {
        return this.authorityDao.totalFound();
    }
}