package com.charity.service.impl;

import com.charity.dao.*;
import com.charity.entity.*;
import com.charity.service.DonateService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

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
    @Resource
    private UserDao userDao;
    @Resource
    private AuthorityDao authorityDao;
    @Resource
    private ApplicationDao applicationDao;
    @Resource
    private DonorDao donorDao;
    @Resource
    private DoneeDao doneeDao;

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

    @Override
    public List<Map<String, Object>> queryAll(Donate donate) {
        List<Map<String, Object>> donateList = donateDao.queryAll(donate);
        List<Map<String,Object>> data = new LinkedList<Map<String, Object>>();
        for(Map<String,Object> map: donateList) {
            if (donate.getAuthorityId() ==null) {   //如果不是查询某个机构的捐赠记录需要显示机构名
                Authority authority = authorityDao.queryById((Integer)map.get("authority_id"));
                User user = userDao.queryById(authority.getUserId());
                map.put("authority_name",user.getName());
            }
            if ((Integer) map.get("is_anoymous") == 1) { //匿名则不需查询
                map.put("donor_name","匿名");
            }else{       //如果不是查询某个捐赠人的记录，需要显示捐赠者名
                Donor donor = donorDao.queryById((Integer) map.get("donor_id"));
                User user = userDao.queryById(donor.getUserId());
                map.put("donor_name",user.getName());
            }
            Application application = applicationDao.queryById((Integer)map.get("application_id"));
            map.put("application_name",application.getTitle());
            //查询受赠人姓名
            if (application.getDoneeId() == null) {
                map.put("donee_name","群体");
            }else {
                Donee donee = doneeDao.queryById(application.getDoneeId());
                User user = userDao.queryById(donee.getUserId());
                map.put("donee_name",user.getName());
            }
            data.add(map);
        }
        return data;
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

    @Override
    public int todayPeople(Integer authorityId) {
        List<Map<String, Object>> maps = donateDao.todayDonor(authorityId);
        return maps.size();
    }

    @Override
    public int queryTimesAll(Donate donate) {
        return this.donateDao.queryTimesAll(donate);
    }

    @Override
    public List<Map<String, Object>> queryAllByDoneeId(Integer doneeId) {
        List<Map<String,Object>> donateList = donateDao.queryAllByDoneeId(doneeId);
        List<Map<String,Object>> data = new LinkedList<Map<String, Object>>();
        for(Map<String,Object> map: donateList) {
            if ((Integer) map.get("is_anoymous") == 1) { //匿名则不需查询
                map.put("donor_name","匿名");
            }else{       //如果不是查询某个捐赠人的记录，需要显示捐赠者名
                Donor donor = donorDao.queryById((Integer) map.get("donor_id"));
                User user = userDao.queryById(donor.getUserId());
                map.put("donor_name",user.getName());
            }
            data.add(map);
        }
        return data;
    }
}