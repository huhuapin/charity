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
                int doneeUserId = (Integer)app.get("donee_user_id");
                User doneeUser = userDao.queryById(doneeUserId);
                app.put("donee_name",doneeUser.getName());
            }else {
                app.put("donee_name","群体");
            }
        }
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

    @Override
    public int setPriority(Application application) {
        return this.applicationDao.setPriority(application);
    }

    @Override
    public List<Map<String, Object>> search(Integer authorityId, String title,Integer status) {
        List<Map<String,Object>> applications = this.applicationDao.search(authorityId,title,status);
        for (Map<String,Object> app: applications) {
            int authorityUserId = (Integer) app.get("authority_user_id");
            User authorityUser = userDao.queryById(authorityUserId);
            app.put("authority_name",authorityUser.getName());
            if (app.get("donee_id") != null) {
                int doneeUserId = (Integer)app.get("donee_user_id");

                User doneeUser = userDao.queryById(doneeUserId);
                app.put("donee_name",doneeUser.getName());
            }else {
                app.put("donee_name","群体");
            }
        }
        return applications;
    }

    @Override
    public List<Map<String, Object>> queryRunOrderByUrgent(Application application) {
        //先查询紧急的
        int status[] = {2};       //正在进行中的项目
        int urgents[] = {2};       //紧急的项目
        List<Map<String,Object>> applications = this.applicationDao.queryRunUrgent(application,status,urgents);
        for (Map<String,Object> app: applications) {
            int authorityUserId = (Integer) app.get("authority_user_id");
            User authorityUser = userDao.queryById(authorityUserId);
            app.put("authority_name",authorityUser.getName());
        }
        if (applications.size()<5) {
            int urgents1[] = {0,1};
            List<Map<String,Object>> applications1 = this.applicationDao.queryRunUrgent(application,status,urgents1);
            for (Map<String,Object> app: applications1) {
                int authorityUserId = (Integer) app.get("authority_user_id");
                User authorityUser = userDao.queryById(authorityUserId);
                app.put("authority_name",authorityUser.getName());
                applications.add(app);
                if (applications.size() == 5) {
                    break;
                }
            }
        }
        return applications;
    }

    /**
     * 按分类查询通过审核的项目 limit限制
     * @param application
     * @param limit
     * @return
     */
    @Override
    public List<Map<String, Object>> queryRun(Application application, Integer limit) {
        List<Map<String,Object>> applications1 = this.applicationDao.queryRun(application,limit);
        for (Map<String,Object> app: applications1) {
            int authorityUserId = (Integer) app.get("authority_user_id");
            User authorityUser = userDao.queryById(authorityUserId);
            app.put("authority_name",authorityUser.getName());
        }
        return applications1;
    }

    /**
     * 按分类、关键词、紧急状态查询通过审核的项目
     * @param application
     * @param keywords
     * @return
     */
    @Override
    public List<Map<String, Object>> queryApplicationList(Application application, String keywords) {
        int urgent[] = {2};
        List<Map<String,Object>> applications = this.applicationDao.queryApplicationList(application,keywords,urgent);
        for (Map<String,Object> app: applications) {
            int authorityUserId = (Integer) app.get("authority_user_id");
            User authorityUser = userDao.queryById(authorityUserId);
            app.put("authority_name",authorityUser.getName());
        }
        int urgent1[] = {0,1};
        List<Map<String,Object>> applications1 = this.applicationDao.queryApplicationList(application,keywords,urgent1);
        for (Map<String,Object> app: applications1) {
            int authorityUserId = (Integer) app.get("authority_user_id");
            User authorityUser = userDao.queryById(authorityUserId);
            app.put("authority_name",authorityUser.getName());
            applications.add(app);
        }
        return applications;
    }
}