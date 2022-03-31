package com.charity.util;

import com.charity.dao.*;
import com.charity.entity.*;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.lang.reflect.InvocationTargetException;
import java.util.*;

public class Recommend {


    public List<Map<String, String>> recommend(int id) {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        DonorDao donorDao = (DonorDao)ac.getBean("donorDao");
        ApplicationDao applicationDao = (ApplicationDao)ac.getBean("applicationDao");
        DonateDao donateDao = (DonateDao)ac.getBean("donateDao");
        AuthorityDao authorityDao = (AuthorityDao)ac.getBean("authorityDao");
        UserDao userDao = (UserDao)ac.getBean("userDao");

        List<Donate> donates; //某一用户的捐赠历史

        List<Donor> donors = donorDao.queryAll(new Donor());   //查询所有的捐赠者
        List<Application> applications = applicationDao.query();  //查询所有的捐赠请求

        int arrMax = applicationDao.queryMaxId()+2;

        //申请矩阵 行列均为捐赠申请 comMatrix[i][j]表示同时捐赠了申请i和申请j的用户数
        int comMatrix[][] = new int[arrMax][arrMax];
        //申请数组  N[i]表示捐赠了此申请的用户数
        int N[] = new int[arrMax];

        //遍历除了此推荐用户外的所有用户
        for(Donor donor:donors) {

            if (donor.getId() == id) {
                continue;
            }

            //遍历用户捐赠的历史
            donates = donateDao.queryByDonorId(donor.getId());
            for (int i = 0; i < donates.size(); i++) {
                int id1 = donates.get(i).getApplicationId();
                N[id1]++;       //
                //同时捐助了项目i和项目j  加入捐赠向量
                for (int j = i+1;j<donates.size();j++) {
                    int id2 = donates.get(j).getApplicationId();
                    comMatrix[id1][id2]++;
                    comMatrix[id2][id1]++;
                }
            }
        }

        //计算相似度
        //相似度矩阵 simArr[i][j]表示 捐赠申请i 和j的相似度
        double [][]simArr = new double[arrMax][arrMax];
        for (int i=0;i<applications.size();i++) {
            int id1 = applications.get(i).getId();
            for (int j=i+1;j<applications.size();j++) {
                int id2 = applications.get(j).getId();
                if (N[id1] == 0||N[id2] == 0) {
                    simArr[id1][id2] = 0;
                    simArr[id2][id1] = 0;
                }else {
                    simArr[id1][id2] = (double) comMatrix[id1][id2] / Math.sqrt(N[id1]*N[id2]);
                    simArr[id2][id1] = simArr[id1][id2];
                }
            }
        }


        //查询该用户的捐赠历史 将捐赠的事件id集合成数组
        donates = donateDao.queryByDonorId(id);
        Set<Integer> applicationIds = new HashSet<Integer>();
        for (Donate donate:donates) {
            applicationIds.add(donate.getApplicationId());
        }
        //计算推荐度（相加）
        Map<Integer,Double> res = new HashMap<Integer, Double>();

        TreeSet<Application> preList = new TreeSet<Application>(new Comparator<Application>(){
            @Override
            public int compare(Application o1,Application o2) {
                if (Math.abs(o1.getW()-o2.getW())<0.001) {
                    return o1.getId() - o2.getId();
                }else {
                    int x = (int) ((o1.getW() - o2.getW())*1000);
                    return x;
                }
            }
        });
        System.out.println("总项目数:" + applications.size());
        for (Application application: applications) {
            //如果该用户捐赠过这个项目  则不进行推荐
            if (applicationIds.contains(application.getId())) {
                System.out.println("包含的id:" + application.getId());
                continue;
            }
            double simNum = 0.0;
            for (Donate donate:donates) {
                //推荐度相加
                simNum+=simArr[application.getId()][donate.getApplicationId()];
            }
            application.setW(simNum);
            preList.add(application);

        }


//        System.out.println("推荐数"+preList.size());
        List<Map<String,String>> mapList = new LinkedList<>();
        while (preList.size()>0) {
            Application application = preList.pollLast();
            if (application.getW()<0.00001) {
                break;
            }
            try {
                Map<String,String> map =  BeanUtils.describe(application);
                Authority authority = authorityDao.queryById(application.getAuthorityId());
                User user = userDao.queryById(authority.getUserId());
                map.put("end",application.getEndString());
                map.put("authority_name",user.getName());
                mapList.add(map);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
            System.out.println("推荐的项目id= " + application.getId() + " and 相似度= " + application.getW());
            if (mapList.size() == 5) {
                break;
            }
        }
        return mapList;
    }

}
