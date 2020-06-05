package com.charity.service.impl;

import com.charity.dao.UserDao;
import com.charity.entity.Application;
import com.charity.dao.ApplicationDao;
import com.charity.entity.User;
import com.charity.service.ApplicationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * (Application)表服务实现类
 *
 * @author hhp
 * @since 2020-05-11 18:46:37
 */
@Service("applicationService")
public class ApplicationServiceImpl implements ApplicationService {
    @Resource
    private ApplicationDao applicationDao;

    @Resource
    private UserDao userDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Application queryById(Integer id) {
        return this.applicationDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Application> queryAllByLimit(int offset, int limit) {
        return this.applicationDao.queryAllByLimit(offset, limit);
    }

    @Override
    public List<Map<String, Object>> queryAll(Application application) {
        List<Map<String,Object>> applications = this.applicationDao.queryAll(application);
        for (Map<String,Object> app: applications) {
            int authorityUserId = (Integer) app.get("authority_user_id");
            User authorityUser = userDao.queryById(authorityUserId);
            app.put("authority_name",authorityUser.getName());
            if (app.get("donee_id") != null) {
                int doneeUserId = (Integer)app.get("donee_id");
                User doneeUser = userDao.queryById(doneeUserId);
                app.put("donee_name",doneeUser.getName());
            }else {
                app.put("donee_name","群体");
            }
        }
        System.out.println(applications.toString());
        return applications;
    }

    /**
     * 新增数据
     *
     * @param application 实例对象
     * @return 实例对象
     */
    @Override
    public Application insert(Application application) {
        this.applicationDao.insert(application);
        return application;
    }

    /**
     * 修改数据
     *
     * @param application 实例对象
     * @return 实例对象
     */
    @Override
    public Application update(Application application) {
        this.applicationDao.update(application);
        return this.queryById(application.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.applicationDao.deleteById(id) > 0;
    }

    @Override
    public int count(Application application) {
        return this.applicationDao.count(application);
    }
}