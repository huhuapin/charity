package com.charity;
import com.charity.dao.ApplicationDao;
import com.charity.dao.DonateDao;
import com.charity.dao.DonorDao;
import com.charity.dao.UserDao;
import com.charity.entity.Application;
import com.charity.entity.Donate;
import com.charity.entity.Donor;
import com.charity.service.UserService;
import org.apache.commons.lang.RandomStringUtils;
import com.charity.entity.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Random;

public class seedData {
    @Test
    public void seedData(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserDao userService = (UserDao) ac.getBean("userDao");
        for (int i = 0; i < 15; i++) {
            User user = new User();
            user.setName(RandomStringUtils.random(10));
            user.setUsername(RandomStringUtils.random(10));
            user.setPassword(RandomStringUtils.random(12));
            user.setCreateTime(new Date());
            user.setLastLogin(new Date());
            user.setRole((i/5)+1);
            userService.insert(user);
        }
    }
    @Test
    public void seedDonor(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        DonorDao donorDao = (DonorDao) ac.getBean("donorDao");
        for (int i = 7; i < 12; i++) {
            Donor donor = new Donor();
            donor.setAddress(RandomStringUtils.random(10));
            System.out.println(donor.getAddress());
            donor.setBirthday(new Date());
            donor.setCareer("工人");
            donor.setSex((int)Math.random()*10 % 2);
            donor.setUserId(i);
            donorDao.insert(donor);
        }
    }

    @Test
    public void seedApplication() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        ApplicationDao applicationDao = (ApplicationDao) ac.getBean("applicationDao");
        for (int i = 0; i < 5; i++) {
            Application application = new Application();
            application.setAutorityId(1);
            application.setCategoryId(1);
            application.setDescription("请帮帮我");
            application.setDoneeId(1);
            application.setDonoorNum(0);
            application.setStart(new Date());
            application.setEnd(new Date());
            application.setTarget(Math.random()*10000);
            application.setTitle("求助！");
            application.setStatus(0);
            applicationDao.insert(application);
        }
    }
    
    @Test
    public void seedDonate() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        DonateDao donateDao = (DonateDao)ac.getBean("donateDao");
        int [][] a = new int[7][7];
        a[1][2] = 1;
        for (int i = 0; i <20 ; i++) {
            //生成2-6的字符串
            int applicationId = (int)(Math.random()*5)+2;
            int donorId = (int)(Math.random()*4)+1;
            if (a[donorId][applicationId] == 1) {
                continue;
            }
            a[donorId][applicationId] = 1;
            Donate donate = new Donate();
            donate.setApplicationId(applicationId);
            donate.setDonorId(donorId);
            donate.setIsAnoymous((int)(Math.random()*10) %2);
            donate.setMessage("希望一切安好");
            donate.setMoney(Math.random()*10000);
            donate.setProve("这里存收据图片");
            System.out.println("D_Id:"+donate.getDonorId()+";A_id"+donate.getApplicationId());
            donateDao.insert(donate);
        }
    }
}
