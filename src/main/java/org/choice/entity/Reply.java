package org.choice.entity;

/**
 * Created by user on 2017/4/29.
 * 主题回复实体
 */

public class Reply {

    private long reply_id;

    private String reply_content;

    private Long reply_time;

    private String reply_time_date;

    private long reply_author_id;

    private long reply_article_id;

    private UserInfo userInfo;      //一对一

    private Article articleInfo;        //一对一

    public Article getArticleInfo() {
        return articleInfo;
    }

    public void setArticleInfo(Article articleInfo) {
        this.articleInfo = articleInfo;
    }

    public Long getReply_time() {
        return reply_time;
    }

    public void setReply_time(Long reply_time) {
        this.reply_time = reply_time;
    }

    public String getReply_time_date() {
        return reply_time_date;
    }

    public void setReply_time_date(String reply_time_date) {
        this.reply_time_date = reply_time_date;
    }

    public long getReply_id() {
        return reply_id;
    }

    public void setReply_id(long reply_id) {
        this.reply_id = reply_id;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public long getReply_author_id() {
        return reply_author_id;
    }

    public void setReply_author_id(long reply_author_id) {
        this.reply_author_id = reply_author_id;
    }

    public long getReply_article_id() {
        return reply_article_id;
    }

    public void setReply_article_id(long reply_article_id) {
        this.reply_article_id = reply_article_id;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
}
