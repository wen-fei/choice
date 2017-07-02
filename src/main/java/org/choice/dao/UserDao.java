package org.choice.dao;

import org.apache.ibatis.annotations.Param;
import org.choice.entity.School;
import org.choice.entity.UserInfo;

import java.util.List;

/**
 * Created by user on 2017/4/23.
 */
public interface UserDao {

    /**
     * 根据用户ID查询用户信息
     * @param userID
     * @return
     */
    UserInfo queryUserById(Long userID);

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
    List<UserInfo> getUserListByTime(@Param("startTime") Long startTime,
                                     @Param("endTime") Long endTime);

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
     * @param home
     * @return
     */
    List<UserInfo> getUserListByArea(String home);

    /**
     * 用户登录验证
     * @param userName  用户名
     * @param password  密码
     * @return
     */
    UserInfo getLoginInfo(@Param("userName") String userName,
                           @Param("password") String password);

    /**
     * 通过学校名称得到学校ID
     * @param schoolKey
     * @return
     */
    School getSchoolNo(String schoolKey);

    int insertOne(@Param("userName") String userName,
                  @Param("pwd") String pwd,
                  @Param("email") String email,
                  @Param("registerTime") Long registerTime);

    /**
     * 判断用户名是否唯一
     * @param userName
     * @return
     */
    UserInfo checkUser_name(String userName);

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
    int updateUserInfo(@Param("user_info_id") Long user_info_id,
                       @Param("name")String name,
                       @Param("user_email") String user_email,
                       @Param("exam_year") int exam_year,
                       @Param("user_gender") int user_gender,
                       @Param("user_home_province") String user_home_province,
                       @Param("user_home_city") String user_home_city,
                       @Param("user_ben_school") String user_ben_school,
                       @Param("user_want_school") String user_want_school);

    /**
     * 日志记录，用户点击一篇主题以后记录到数据库中
     * @param userId
     * @param articleId
     * @param click
     * @param time
     * @return
     */
    int insertToUserArticleRecords_click(@Param("userId") Long userId,
                                   @Param("articleId") Long articleId,
                                   @Param("time") Long time);

    /**
     * 设置管理员
     * @param forum_or_module_id
     * @param user_id
     * @param type
     * @return
     */
    int setController(@Param("forum_or_module_id") int forum_or_module_id,
                      @Param("user_id") long user_id,
                      @Param("type") int type);
}
