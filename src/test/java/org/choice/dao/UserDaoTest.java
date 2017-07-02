package org.choice.dao;

import org.choice.entity.UserInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by user on 2017/5/2.
 */
@RunWith(SpringJUnit4ClassRunner.class)
/**告诉junit spring的配置文件*/
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserDaoTest {


    @Autowired
    private UserDao userDao;


    @Test
    public void getUserList() throws Exception {
        List<UserInfo> userInfoList = userDao.getUserList();
        for (UserInfo userInfo : userInfoList)
            System.out.println(userInfo);
    }

    @Test
    public void insertOne() throws Exception {
        String user_name = "admin3";
        String password = "123456";
        String email = "123@qq.com";
        Long now = (new Date()).getTime();
        int re = userDao.insertOne(user_name,password,email,now);
        System.out.println(re);
    }

    @Test
    public void checkUser_name() throws Exception {
        String username = "admin2";
        UserInfo userInfo = userDao.checkUser_name(username);
        if (userInfo == null){
            System.out.println("合法的用户名");
        }
        else{
            System.out.println("用户名已经存在");
        }

    }
    @Test
    public void updateUserInfo() throws Exception {
        long user_info_id = 2;
        String name = "腾云";
        int exam_year = 2017;
        int user_gender = 1;
        String user_ben_school = "清华大学";
        String user_want_school= "东南大学";
        String user_home_province = "江苏";
        String user_home_city = "徐州";
        String user_email = "qq2826@email.com";
        int result = userDao.updateUserInfo(user_info_id,name,user_email,exam_year,user_gender,
                user_home_province,user_home_city,user_ben_school,user_want_school);
        System.out.println(result);
    }

    @Test
    public void insertToUserArticleRecords() throws Exception {
    }


}