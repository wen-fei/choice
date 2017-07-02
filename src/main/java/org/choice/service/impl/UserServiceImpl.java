package org.choice.service.impl;

import org.choice.dao.UserDao;
import org.choice.entity.UserInfo;
import org.choice.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by user on 2017/4/23.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Resource
    private UserDao userDao;

    @Override
    public UserInfo getUserInfoById(Long userId) {
        return userDao.queryUserById(userId);
    }

    @Override
    public Long getUserCounts() {
        return userDao.getUserCounts();
    }

    @Override
    public List<UserInfo> getUserList() {
        return userDao.getUserList();
    }

    @Override
    public List<UserInfo> getUserListByTime(Long startTime, Long endTime) {
        return userDao.getUserListByTime(startTime,endTime);
    }

    @Override
    public List<UserInfo> getUserListBySchoolId(int schoolId) {
        return userDao.getUserListBySchoolId(schoolId);
    }

    @Override
    public List<UserInfo> getUserListByWantSchoolId(int schoolId) {
        return userDao.getUserListByWantSchoolId(schoolId);
    }

    @Override
    public List<UserInfo> getUserListByExamYear(int year) {
        return userDao.getUserListByExamYear(year);
    }

    @Override
    public List<UserInfo> getUserListByArea(String home) {
        return userDao.getUserListByArea(home);
    }

    @Override
    public UserInfo getLoginInfo(String username, String password) {
        return userDao.getLoginInfo(username,password);
    }

    @Override
    public int insertOneUser(String userName, String pwd, String email) {
        //int bkSchool_no = userDao.getSchoolNo(bk).getSchool_id();
        //int wantSchool_no = userDao.getSchoolNo(want).getSchool_id();
        Long registTime = (new Date()).getTime();
        return userDao.insertOne(userName, pwd, email, registTime);
    }

    @Override
    public UserInfo checkUserName(String userName) {
        return userDao.checkUser_name(userName);
    }

    @Override
    public int updateUserInfo(long user_info_id, String name, String user_email, int exam_year, int user_gender, String user_home_province, String user_home_city, String user_ben_school, String user_want_school) {
        return userDao.updateUserInfo(user_info_id,name,user_email,exam_year,user_gender,user_home_province,user_home_city,user_ben_school,user_want_school);
    }

    @Override
    public int insertToUserRecord_click(long uid, long aid) {
        long time = (new Date()).getTime();
        return userDao.insertToUserArticleRecords_click(uid, aid,time) ;
    }

    @Override
    public int setController(int forum_or_module_id, long user_id, int type) {
        return userDao.setController(forum_or_module_id, user_id, type);
    }
}
