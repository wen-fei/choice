package org.choice.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 主题实体
 * Created by user on 2017/4/18.
 */
public class Article {
    private long article_id;

    private int article_counts;

    private String article_title;

    private long article_authorID;

    private String article_content;

    private int article_module_id;

    private int article_comment_number;

    private long article_read_number;

    private int article_forum_id;

    private int article_good_counts;   //帖子点赞次数

    private int article_notgood_counts; // 帖子踩次数

    private int article_share_count;   //分享次数

    private int article_collect_counts; // 收藏次数

    private String article_forum_name;

    private String article_module_name;

    private String article_author_name;

    private String article_author_type_name;

    private String article_type_name;

    private int isJing;

    private int isHot;

    private int isTop;


    private long article_last_reply_userID;

    private String article_last_reply_username;

    private Long article_last_reply_time;

    private String article_last_reply_time_date;

    private Long article_create_time;

    private String article_create_time_date;

    private int article_type_id;

    private int status;

    private String article_status_name;


    //帖子公告
    private String article_post;

    //帖子得分
    private double article_scores;

    //web表单name实体对象
    private String startTime;

    private String endTime;

    private String titleKey;

    private int needId;

    public int getArticle_notgood_counts() {
        return article_notgood_counts;
    }

    public void setArticle_notgood_counts(int article_notgood_counts) {
        this.article_notgood_counts = article_notgood_counts;
    }

    public int getIsJing() {
        return isJing;
    }

    public void setIsJing(int isJing) {
        this.isJing = isJing;
    }


    public int getArticle_good_counts() {
        return article_good_counts;
    }

    public void setArticle_good_counts(int article_good_counts) {
        this.article_good_counts = article_good_counts;
    }


    public int getArticle_share_count() {
        return article_share_count;
    }

    public void setArticle_share_count(int article_share_count) {
        this.article_share_count = article_share_count;
    }

    public int getArticle_collect_counts() {
        return article_collect_counts;
    }

    public void setArticle_collect_counts(int article_collect_counts) {
        this.article_collect_counts = article_collect_counts;
    }

    public int getIsHot() {
        return isHot;
    }

    public void setIsHot(int isHot) {
        this.isHot = isHot;
    }

    public int getIsTop() {
        return isTop;
    }

    public void setIsTop(int isTop) {
        this.isTop = isTop;
    }


    public double getArticle_scores() {
        return article_scores;
    }

    public void setArticle_scores(double article_scores) {
        this.article_scores = article_scores;
    }

    public String getArticle_post() {
        return article_post;
    }

    public void setArticle_post(String article_post) {
        this.article_post = article_post;
    }

    public String getArticle_last_reply_username() {
        return article_last_reply_username;
    }

    public void setArticle_last_reply_username(String article_last_reply_username) {
        this.article_last_reply_username = article_last_reply_username;
    }

    public String getArticle_status_name() {
        return article_status_name;
    }

    public void setArticle_status_name(String article_status_name) {
        this.article_status_name = article_status_name;
    }

    public int getArticle_counts() {
        return article_counts;
    }

    public void setArticle_counts(int article_counts) {
        this.article_counts = article_counts;
    }

    public String getArticle_last_reply_time_date() {
        return article_last_reply_time_date;
    }

    public void setArticle_last_reply_time_date(String article_last_reply_time_date) {
        this.article_last_reply_time_date = article_last_reply_time_date;
    }

    public String getArticle_create_time_date() {
        return article_create_time_date;
    }

    public void setArticle_create_time_date(String article_create_time_date) {
        this.article_create_time_date = article_create_time_date;
    }

    public int getNeedId() {
        return needId;
    }

    public long getArticle_id() {
        return article_id;
    }

    public void setArticle_id(long article_id) {
        this.article_id = article_id;
    }

    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public long getArticle_authorID() {
        return article_authorID;
    }

    public void setArticle_authorID(long article_authorID) {
        this.article_authorID = article_authorID;
    }

    public String getArticle_content() {
        return article_content;
    }

    public void setArticle_content(String article_content) {
        this.article_content = article_content;
    }

    public int getArticle_module_id() {
        return article_module_id;
    }

    public void setArticle_module_id(int article_module_id) {
        this.article_module_id = article_module_id;
    }

    public int getArticle_comment_number() {
        return article_comment_number;
    }

    public void setArticle_comment_number(int article_comment_number) {
        this.article_comment_number = article_comment_number;
    }

    public long getArticle_read_number() {
        return article_read_number;
    }

    public void setArticle_read_number(long article_read_number) {
        this.article_read_number = article_read_number;
    }

    public int getArticle_forum_id() {
        return article_forum_id;
    }

    public void setArticle_forum_id(int article_forum_id) {
        this.article_forum_id = article_forum_id;
    }

    public String getArticle_forum_name() {
        return article_forum_name;
    }

    public void setArticle_forum_name(String article_forum_name) {
        this.article_forum_name = article_forum_name;
    }

    public String getArticle_module_name() {
        return article_module_name;
    }

    public void setArticle_module_name(String article_module_name) {
        this.article_module_name = article_module_name;
    }

    public String getArticle_author_name() {
        return article_author_name;
    }

    public void setArticle_author_name(String article_author_name) {
        this.article_author_name = article_author_name;
    }

    public String getArticle_author_type_name() {
        return article_author_type_name;
    }

    public void setArticle_author_type_name(String article_author_type_name) {
        this.article_author_type_name = article_author_type_name;
    }

    public String getArticle_type_name() {
        return article_type_name;
    }

    public void setArticle_type_name(String article_type_name) {
        this.article_type_name = article_type_name;
    }


    public long getArticle_last_reply_userID() {
        return article_last_reply_userID;
    }

    public void setArticle_last_reply_userID(long article_last_reply_userID) {
        this.article_last_reply_userID = article_last_reply_userID;
    }

    public Long getArticle_last_reply_time() {
        return article_last_reply_time;
    }

    public void setArticle_last_reply_time(Long article_last_reply_time) {
        this.article_last_reply_time = article_last_reply_time;
    }

    public Long getArticle_create_time() {
        return article_create_time;
    }

    public void setArticle_create_time(Long article_create_time) {
        this.article_create_time = article_create_time;
    }

    public int getArticle_type_id() {
        return article_type_id;
    }

    public void setArticle_type_id(int article_type_id) {
        this.article_type_id = article_type_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getTitleKey() {
        return titleKey;
    }

    public void setTitleKey(String titleKey) {
        this.titleKey = titleKey;
    }

    public void setNeedId(int needId) {
        this.needId = needId;
    }


    @Override
    public String toString() {
        return "Article{" +
                "article_id=" + article_id +
                ", article_title='" + article_title + '\'' +
                ", article_authorID=" + article_authorID +
                ", article_content='" + article_content + '\'' +
                ", article_create_time=" + article_create_time +
                ", article_module_id=" + article_module_id +
                ", article_comment_number=" + article_comment_number +
                ", article_read_number=" + article_read_number +
                ", article_forum_id=" + article_forum_id +
                ", article_forum_name='" + article_forum_name + '\'' +
                ", article_module_name='" + article_module_name + '\'' +
                ", article_author_name='" + article_author_name + '\'' +
                ", article_author_type_name='" + article_author_type_name + '\'' +
                ", article_type_name='" + article_type_name + '\'' +
                ", article_last_reply_userID=" + article_last_reply_userID +
                ", article_last_reply_time=" + article_last_reply_time +
                ", article_type_id=" + article_type_id +
                ", status=" + status +
                '}';
    }
}
