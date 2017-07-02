package org.choice.service;

import org.apache.ibatis.annotations.Param;
import org.choice.entity.*;

import java.util.List;
import java.util.Map;

/**
 * 业务接口
 * Created by user on 2017/4/20.
 */
public interface ArticleService {

    /**
     * 查询所有主题信息
     * @return
     */
    List<Article> getArticleList();

    /**
     * 查询单个主题信息
     * @param articleId
     * @return
     */
    Article getArticleById(long articleId);

    /**
     * 删除一个主题
     * @param articleId
     * @return
     */
    int deleteArticleOne(long articleId);

    /**
     * 批量删除主题
     * @param articleIds
     * @return
     */
    int deleteArticleBatch(long[] articleIds);

    /**
     * 按一定条件查询帖子
     * 查询条件用户选择
     * @param needId
     * @param startTime
     * @param endTime
     * @param titleKey  帖子标题关键字
     * @return
     */
    List<Article> getArticleByNeeds(int needId, Long startTime, Long endTime, String titleKey);

    /**
     * 设置一个帖子状态，默认审核通过
     * @param articleId
     * @return
     */
    int proveArticle(long articleId, int status);

    /**
     * 批量审核通过
     * @param articleIds
     * @return
     */
    int proveArticleBatch(long[] articleIds);

    /**
     * 主题总数量
     * @return
     */
    int articleCount();

    /**
     *
     * @param offset
     * @param countLimit
     * @return
     */
    List<Article> getArticleByPage(int offset, int countLimit);


    /**将文章中的状态码
     * 通过id查找到名称
     * @param articleList
     * @return
     */
    List<Article> setArticleFromIdToName(List<Article> articleList);

    /**
     *
     * @param articleList
     * @return
     */
    Article setArticleFromIdToName(Article articleList);

    /**
     * 查询所有帖子类型
     * @return
     */
    List<ArticleType> getArticleTypeList();

    /**
     * 查询所有版块类型列表
     * @return
     */
    List<Forum> getAtricleForumList();

    /**
     * 查询所有模块类型列表
     * @return
     */
    List<Module> getAtricleModuleList(int forumId);

    /**
     * 通过新的主题信息更新主题信息
     * @param articleTitle      主题标题
     * @param article_type_id   主题类型ID
     * @param article_forum_id  主题所属板块id
     * @param article_module_id 主题所属模块id
     * @return
     */
    int updateArticle(String articleTitle,int article_type_id, int article_forum_id,int article_module_id);



    /**
     * Hacker News 热门帖子排序算法---计算帖子得分
     * @param moduleId      模块ID，得到本模块下帖子列表。所有的热门帖子可以选择每隔模块下排名第一的帖子作为火贴推荐
     * @return Map<Long parm1,Long parm2> parm1 帖子ID，parm2 帖子得分
     */
    Map<Long,Long> setArticleScores(int moduleId);

    /**
     * 通过评论id查找评论信息
     * @param replyId
     * @return
     */
    Reply getReplyInfoById(long replyId);


    /**
     * 通过主题ID查找属于此主题下的所有评论
     * @param articleId
     * @return
     */

    List<Reply> getReplyInfoByArticleId(long articleId);


    /**
     * 发表一篇文章
     * @param article_title
     * @param article_content
     * @param article_author_id
     * @param forum_id
     * @param module_id
     * @return
     */
    int insertOneArticle(String article_title, String article_content, long article_author_id, int forum_id, int module_id);

    /**
     * 记录主题浏览次数
     * @param articleId
     * @return
     */
    int updateArticleClickCounts(long articleId);

    /**
     * 点赞，踩， 转发，收藏
     * @param aid
     * @param uid
     * @param type 1 点赞 2 踩 3 转发 4 收藏
     * @return
     */
    int articleCollet(long aid, long uid, int type);

    /**
     * 判断是否已经点赞收藏踩
     * 转发无限制
     * @param aid
     * @param uid
     * @param type
     * @return
     */
    Article articleColletCheck(long aid, long uid, int type);

    /**
     * 首页热门主题
     * @return
     */
    List<Article> getArticleListHotByScore();

    /**
     * 首页最近点击最高的主题
     * @return
     */
    List<Article> getArticleListHotByRead();
}
