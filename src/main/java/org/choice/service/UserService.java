package org.choice.service;

import org.choice.entity.UserInfo;

import java.util.List;

/**
 * Created by user on 2017/4/23.
 */
public interface UserService {

    /**
     * 通过用户ID查找用户信息
     * @param userId
     * @return
     */
    UserInfo getUserInfoById(Long userId);

    /**
     * 统计会员数量
     * @return
     */
    Long getUserCounts();

    /**
     * 得到用户信息列表
     * @return
     */
    List<UserInfo> getUserList();

    /**
     * 查询某时间段内注册的用户
     * @param startTime  开始时间
     * @param endTime    结束时间
     * @return
     */
    List<UserInfo> getUserListByTime(Long startTime, Long endTime);

    /**
     * 查询某本科学校的用户信息列表
     * @param schoolId
     * @return
     */
    List<UserInfo> getUserListBySchoolId(int schoolId);

    /**
     * 查询报考某学校用户信息列表
     * @param schoolId
     * @return
     */
    List<UserInfo> getUserListByWantSchoolId(int schoolId);

    /**
     * 按考研年份查询
     * @param year
     * @return
     */
    List<UserInfo> getUserListByExamYear(int year);


    /**
     * 通过学生家乡所在省份查找学生
     * @param home 家乡关键子
     * @return
     */
    List<UserInfo> getUserListByArea(String home);

    /**
     * dneglu yanzheng
     * @param username
     * @param password
     * @return
     */
    UserInfo getLoginInfo(String username,String password);

    /**
     *
     * @return
     */
    int insertOneUser(String userName, String pwd, String email);

    /**
     * 检查用户名唯一性
     * @param userName
     * @return
     */
    UserInfo checkUserName(String userName);

    /**
     * 更新用户信息
     * @param user_info_id 用户id
     * @param name        昵称
     * @param user_email    邮箱
     * @param exam_year 考研年份
     * @param user_gender  性别
     * @param user_home_province    家乡省份
     * @param user_home_city        家乡城市
     * @param user_ben_school       本科学校
     * @param user_want_school      报考学校
     * @return
     */
    int updateUserInfo(long user_info_id, String name, String user_email,
                       int exam_year, int user_gender, String user_home_province,
                       String user_home_city, String user_ben_school, String user_want_school);

    /**
     * 日志记录, 用户点击了一次页面
     * @param uid
     * @param aid
     * @return
     */
    int insertToUserRecord_click(long uid, long aid);

    /**
     * 设置管理员
     * @param forum_or_module_id
     * @param user_id
     * @param type
     * @return
     */
    int setController(int forum_or_module_id, long user_id, int type);
}

