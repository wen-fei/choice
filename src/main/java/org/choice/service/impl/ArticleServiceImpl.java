package org.choice.service.impl;

import org.choice.Exception.ExcelException;
import org.choice.dao.ArticleDao;
import org.choice.dao.ReplyDao;
import org.choice.entity.*;
import org.choice.service.ArticleService;
import org.choice.utils.ExcelUitl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by user on 2017/4/20.
 */
@Service
@Transactional
public class ArticleServiceImpl implements ArticleService{
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    //注入service依赖
    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private ReplyDao replyDao;

    /**
     * 显示帖子详细信息，列表
     * @return
     */
    public List<Article> getArticleList() {
        List<Article> articleList = articleDao.queryAll(0,articleDao.articleCounts());
        return  setArticleFromIdToName(articleList);
    }

    public Article getArticleById(long articleId) {
        return articleDao.queryById(articleId);
    }

    public int deleteArticleOne(long articleId) {
        return articleDao.deleteArticle(articleId);
    }

    public int deleteArticleBatch(long[] articleIds) {
        return articleDao.deleteArticleBatch(articleIds);
    }

    /*用于搜索*/
    public List<Article> getArticleByNeeds(int needId, Long startTime, Long endTime, String titleKey) {
        List<Article> articleList = articleDao.queryByNeeds(needId,startTime,endTime,titleKey);
        return  setArticleFromIdToName(articleList);

    }

    public int proveArticle(long articleId, int status) {

        return articleDao.setArticleStatus(articleId,status);
    }

    public int proveArticleBatch(long[] articleIds) {
        return articleDao.setArticleStatusBatch(articleIds);
    }

    public int articleCount() {
        return articleDao.articleCounts();
    }

    public List<Article> getArticleByPage(int offset, int countLimit) {
        return articleDao.queryAll(offset,countLimit);
    }

    @Override
    public List<Article> setArticleFromIdToName(List<Article> articleList) {
        for(Article article:articleList){
            //设置板块名称
            String forumName = articleDao.queryArticleForumName(article.getArticle_forum_id());
            article.setArticle_forum_name(forumName);

            //设置模块名称
            String moduleName = articleDao.queryArticleModuleName(article.getArticle_module_id());
            article.setArticle_module_name(moduleName);

            //设置主题类型
            String articleTypeName =  articleDao.queryArticleType(article.getArticle_type_id());
            article.setArticle_type_name(articleTypeName);

            //主题作者信息
            UserInfo authorInfos = articleDao.queryArticleAuthorInfo(article.getArticle_authorID());
            article.setArticle_author_name(authorInfos.getName());
            String authorTypeName = articleDao.queryArticleAuthorTypeName(authorInfos.getUser_type());
            article.setArticle_author_type_name(authorTypeName);

            //设置最后回复用户信息
            UserInfo lastUserInfos = articleDao.queryArticleAuthorInfo(article.getArticle_last_reply_userID());
            article.setArticle_last_reply_username(lastUserInfos.getName());


            //板块时间转换，时间戳转换成Data格式
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            article.setArticle_create_time_date(dateFormat.format(article.getArticle_create_time()));
            article.setArticle_last_reply_time_date(dateFormat.format(article.getArticle_last_reply_time()));

            //设置发布状态
            String article_type = articleDao.queryArticleStatus(article.getStatus());
            article.setArticle_status_name(article_type);

            //设置主题数量
            article.setArticle_counts(articleDao.articleCounts());
        }
        return articleList;
    }

    @Override
    public Article setArticleFromIdToName(Article article) {
        //设置板块名称
        String forumName = articleDao.queryArticleForumName(article.getArticle_forum_id());
        article.setArticle_forum_name(forumName);

        //设置模块名称
        String moduleName = articleDao.queryArticleModuleName(article.getArticle_module_id());
        article.setArticle_module_name(moduleName);

        //设置主题类型
        String articleTypeName = articleDao.queryArticleType(article.getArticle_type_id());
        article.setArticle_type_name(articleTypeName);

        //主题作者信息
        UserInfo authorInfos = articleDao.queryArticleAuthorInfo(article.getArticle_authorID());
        article.setArticle_author_name(authorInfos.getName());
        String authorTypeName = articleDao.queryArticleAuthorTypeName(authorInfos.getUser_type());
        article.setArticle_author_type_name(authorTypeName);

        //板块时间转换，时间戳转换成Data格式
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        article.setArticle_create_time_date(dateFormat.format(article.getArticle_create_time()));
//        article.setArticle_last_reply_time_date(dateFormat.format(article.getArticle_last_reply_time()));

        //设置发布状态
        String article_type = articleDao.queryArticleStatus(article.getStatus());
        article.setArticle_status_name(article_type);
        return article;
    }

    @Override
    public List<ArticleType> getArticleTypeList() {
        return articleDao.queryArticleTypeList();
    }

    @Override
    public List<Forum> getAtricleForumList() {
        return articleDao.queryArticleForumList();
    }

    @Override
    public List<Module> getAtricleModuleList(int forumId) {
        return articleDao.queryArticleModuleList(forumId);
    }

    @Override
    public int updateArticle(String articleTitle,int article_type_id, int article_forum_id, int article_module_id){
        return articleDao.updateArticle(articleTitle,article_type_id,article_forum_id,article_module_id);
    }

    @Override
    public Map<Long, Long> setArticleScores(int moduleId) {
        List<Article> articleList = articleDao.queryByModuleId(moduleId);
        for (Article article : articleList){
            Long article_read_counts  = article.getArticle_read_number();
            Long article_reply_counts = (long) article.getArticle_comment_number();
            int article_good_counts  = article.getArticle_good_counts();
            double scores = 0.4*article_reply_counts + 0.01*article_read_counts+0.5*article_good_counts;
            article.setArticle_scores(scores);
        }
        return null;
    }

    @Override
    public Reply getReplyInfoById(long replyId) {
        return replyDao.getReplyById(replyId);
    }

    @Override
    public List<Reply> getReplyInfoByArticleId(long articleId) {
        return replyDao.getReplyListByArticleId(articleId);
    }

    @Override
    public int insertOneArticle(String article_title, String article_content, long article_author_id, int forum_id, int module_id) {
        Long article_time = (new Date()).getTime();
        return articleDao.insertOneArticle(article_title,article_content,article_author_id,forum_id,module_id,article_time);
    }

    @Override
    public int updateArticleClickCounts(long articleId) {
        return articleDao.updateArticleClickCounts(articleId);
    }

    @Override
    public int articleCollet(long aid, long uid,int type) {
        long time = (new Date()).getTime();
        return articleDao.articleCollet(aid,uid,time,type);
    }

    @Override
    public Article articleColletCheck(long aid, long uid, int type) {
        return articleDao.articleColletCheck(aid, uid, type);
    }

    @Override
    public List<Article> getArticleListHotByScore() {
        return articleDao.getArticleListHotByScore();
    }

    @Override
    public List<Article> getArticleListHotByRead() {

        long endTime = (new Date()).getTime();
        long startTime = endTime - 7*24*60*60*1000;
        return articleDao.getArticleListHotByRead(startTime,endTime);
    }


    public void articleToExcel() throws FileNotFoundException, ExcelException {
        List<Article> articleList = articleDao
                .queryAll(0,articleDao.articleCounts());
        LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
        OutputStream out = new FileOutputStream("test.excel");
        ExcelUitl.listToExcel(articleList,fieldMap,"article_info",out);

    }
}
