package org.choice.entity;

/**
 * Created by user on 2017/4/22.
 */
public class Module {

    private int module_id;


    private String module_name;

    private long module_controller_id;

    private int module_belong_forum_id;

    private long module_article_count;

    private long module_read_count;

    private long module_reply_count;

    private  String module_post;

    private long module_article_count_closedDay;
    private long module_article_count_closedWeek;
    private long module_article_count_closedMonth;
    private long module_article_count_closedYear;

    private long module_read_count_closedDay;
    private long module_read_count_closedWeek;
    private long module_read_count_closedMonth;
    private long module_read_count_closedYear;

    private long module_reply_count_closedDay;
    private long module_reply_count_closedWeek;
    private long module_reply_count_closedMonth;
    private long module_reply_count_closedYear;

    private Forum forum;            //多对一

    private Article article;        //一对多

    private UserInfo userInfo;      //一对一

    private School school;          //一对一


    public String getModule_post() {
        return module_post;
    }

    public void setModule_post(String module_post) {
        this.module_post = module_post;
    }

    public Forum getForum() {
        return forum;
    }

    public void setForum(Forum forum) {
        this.forum = forum;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public int getModule_id() {
        return module_id;
    }

    public void setModule_id(int module_id) {
        this.module_id = module_id;
    }

    public String getModule_name() {
        return module_name;
    }

    public void setModule_name(String module_name) {
        this.module_name = module_name;
    }

    public long getModule_controller_id() {
        return module_controller_id;
    }

    public void setModule_controller_id(long module_controller_id) {
        this.module_controller_id = module_controller_id;
    }

    public int getModule_belong_forum_id() {
        return module_belong_forum_id;
    }

    public void setModule_belong_forum_id(int module_belong_forum_id) {
        this.module_belong_forum_id = module_belong_forum_id;
    }

    public long getModule_article_count() {
        return module_article_count;
    }

    public void setModule_article_count(long module_article_count) {
        this.module_article_count = module_article_count;
    }

    public long getModule_read_count() {
        return module_read_count;
    }

    public void setModule_read_count(long module_read_count) {
        this.module_read_count = module_read_count;
    }

    public long getModule_article_count_closedDay() {
        return module_article_count_closedDay;
    }

    public void setModule_article_count_closedDay(long module_article_count_closedDay) {
        this.module_article_count_closedDay = module_article_count_closedDay;
    }

    public long getModule_article_count_closedWeek() {
        return module_article_count_closedWeek;
    }

    public void setModule_article_count_closedWeek(long module_article_count_closedWeek) {
        this.module_article_count_closedWeek = module_article_count_closedWeek;
    }

    public long getModule_article_count_closedMonth() {
        return module_article_count_closedMonth;
    }

    public void setModule_article_count_closedMonth(long module_article_count_closedMonth) {
        this.module_article_count_closedMonth = module_article_count_closedMonth;
    }

    public long getModule_article_count_closedYear() {
        return module_article_count_closedYear;
    }

    public void setModule_article_count_closedYear(long module_article_count_closedYear) {
        this.module_article_count_closedYear = module_article_count_closedYear;
    }

    public long getModule_read_count_closedDay() {
        return module_read_count_closedDay;
    }

    public void setModule_read_count_closedDay(long module_read_count_closedDay) {
        this.module_read_count_closedDay = module_read_count_closedDay;
    }

    public long getModule_read_count_closedWeek() {
        return module_read_count_closedWeek;
    }

    public void setModule_read_count_closedWeek(long module_read_count_closedWeek) {
        this.module_read_count_closedWeek = module_read_count_closedWeek;
    }

    public long getModule_read_count_closedMonth() {
        return module_read_count_closedMonth;
    }

    public void setModule_read_count_closedMonth(long module_read_count_closedMonth) {
        this.module_read_count_closedMonth = module_read_count_closedMonth;
    }

    public long getModule_read_count_closedYear() {
        return module_read_count_closedYear;
    }

    public void setModule_read_count_closedYear(long module_read_count_closedYear) {
        this.module_read_count_closedYear = module_read_count_closedYear;
    }

    public long getModule_reply_count_closedDay() {
        return module_reply_count_closedDay;
    }

    public void setModule_reply_count_closedDay(long module_reply_count_closedDay) {
        this.module_reply_count_closedDay = module_reply_count_closedDay;
    }

    public long getModule_reply_count_closedWeek() {
        return module_reply_count_closedWeek;
    }

    public void setModule_reply_count_closedWeek(long module_reply_count_closedWeek) {
        this.module_reply_count_closedWeek = module_reply_count_closedWeek;
    }

    public long getModule_reply_count_closedMonth() {
        return module_reply_count_closedMonth;
    }

    public void setModule_reply_count_closedMonth(long module_reply_count_closedMonth) {
        this.module_reply_count_closedMonth = module_reply_count_closedMonth;
    }

    public long getModule_reply_count_closedYear() {
        return module_reply_count_closedYear;
    }

    public void setModule_reply_count_closedYear(long module_reply_count_closedYear) {
        this.module_reply_count_closedYear = module_reply_count_closedYear;
    }

    public long getModule_reply_count() {
        return module_reply_count;
    }

    public void setModule_reply_count(long module_reply_count) {
        this.module_reply_count = module_reply_count;
    }

    @Override
    public String toString() {
        return "Module{" +
                "module_id=" + module_id +
                ", module_name='" + module_name + '\'' +
                ", module_controller_id=" + module_controller_id +
                ", module_belong_forum_id=" + module_belong_forum_id +
                ", module_article_count=" + module_article_count +
                ", module_read_count=" + module_read_count +
                '}';
    }
}
