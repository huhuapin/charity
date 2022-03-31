package com.charity;

import com.charity.dao.ApplicationDao;
import com.charity.dao.DonateDao;
import com.charity.dao.DonorDao;
import com.charity.entity.Application;
import com.charity.entity.Donate;
import com.charity.entity.Donor;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.*;

public class recommend {

    //为某用户推荐
    public TreeSet<Application> recommend(int id) {

        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        DonorDao donorDao = (DonorDao)ac.getBean("donorDao");
        ApplicationDao applicationDao = (ApplicationDao)ac.getBean("applicationDao");
        DonateDao donateDao = (DonateDao)ac.getBean("donateDao");

        List<Donate> donates; //某一用户的捐赠历史

        List<Donor> donors = donorDao.queryAll(new Donor());   //查询所有的捐赠者
        List<Application> applications = applicationDao.query();  //查询所有的捐赠请求

        int arrMax = applicationDao.queryMaxId()+2;
        //申请矩阵 行列均为捐赠申请 comMatrix[i][j]表示同时捐赠了申请i和申请j的用户数
        int comMatrix[][] = new int[arrMax][arrMax]; //此处应该修改为applications id的最大值
        //申请数组  N[i]表示捐赠了此申请的用户数
        int N[] = new int[arrMax];

        //遍历所有用户的捐赠历史
        for(Donor donor:donors) {
            if (donor.getId() == id) {
                continue;
            }

            //获取该用户捐赠的申请
            donates = donateDao.queryByDonorId(donor.getId());
            for (int i = 0; i < donates.size(); i++) {
                int id1 = donates.get(i).getApplicationId();
                N[id1]++;
                //同时捐助了i和j  加入捐赠向量
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
                simArr[id1][id2] = (double) comMatrix[id1][id2] / Math.sqrt(N[id1]*N[id2]);
                simArr[id2][id1] = simArr[id1][id2];
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
        System.out.println("总申请数:" + applications.size());
        for (Application application: applications) {
            //如果该用户捐赠过这个事件  则不进行推荐
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
        while (preList.size()>0) {
            Application application = preList.pollLast();
            System.out.println("推荐的项目id= " + application.getId() + " and 相似度= " + application.getW());
        }
        return preList;
    }
    @Test
    public void testRecommend(){
        recommend(5);
    }

}
