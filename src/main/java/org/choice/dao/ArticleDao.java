package org.choice.dao;

import org.apache.ibatis.annotations.Param;
import org.choice.entity.*;

import java.util.Date;
import java.util.List;

/**
 * Created by user on 2017/4/18.
 * 帖子管理
 */
public interface ArticleDao {

    /**1.
     * 通过帖子ID查找某个帖子信息
     * @param articleId
     * @return
     */
    Article queryById(long articleId);

    /**2.
     * 通过帖子ID删除帖子
     * @param articleId
     * @return
     */
    int  deleteArticle(long articleId);

    /**3.
     * 通过帖子类型查找
     * 模糊查询
     * @param articleTypeId
     * @return
     */
    List<Article> queryByArticleType(int articleTypeId);

    /**4.
     * 通过时间段查找帖子
     * @param startTime 开始时间
     * @param endTime 结束时间,默认时间为系统当前时间
     * @return
     */
    List<Article> queryByTime(@Param("startTime")Long startTime,
                              @Param("endTime")Long endTime,
                              @Param("typeId") Integer typeId,
                              @Param("ID") Integer ID,
                              @Param("isAll")Integer isAll);

    /**5.
     * 批量删除帖子
     * @param articleIds
     * @return
     */
    int deleteArticleBatch(long[] articleIds);

    /**6.
     * 批量设置帖子状态为通过
     * @param articleIds
     * @return
     */
    int setArticleStatusBatch(long[] articleIds);

    /**7.
     * 审核帖子（0未审核、1审核通过、2审核不通过）
     * //TODO 审查帖子状态范围
     * @param articleId
     * @return
     */
    int setArticleStatus(@Param("articleId") long articleId,
                         @Param("status") int status);

    /**8.
     * 通过帖子状态查询帖子
     * @param status
     * @return
     */
    List<Article> queryByArticleStatus(int status);

    /**9.
     * 修改帖子//TODO
     * @param articleId
     * @return
     */
    int updateArticle(long articleId);

    /**10.
     * 查询帖子总数量
     * @return
     */
    int articleCounts();

    /**11.
     * 通过帖子所属板块查询
     * @param forumId
     * @return
     */
    List<Article> queryByForum(int forumId);

    /**12.
     * 通过帖子所属模块查询
     * @param moduleId
     * @return
     */
    List<Article> queryByModuleId(int moduleId);

    /**13.
     * 用于筛选帖子
     * 查询大于一定浏览次数的帖子
     * @param number
     * @return
     */
    List<Article> queryByReadNumbers(int number);

    /**14.
     * 查询满足一定评论次数的帖子
     * @param number
     * @return
     */
    List<Article> queryByReplyNumbers(int number);

    /**15.
     * 列出所有帖子信息，用于分页查询
     * @return
     */
    List<Article> queryAll(@Param("offset") int offset,
                           @Param("countLimit") int countLimit);

    /**16.
     * 条件查询，组合查询 //TODO
     * @param requirement   查询的第一个条件，用于限定列
     * @param startTime  查询的时间段
     * @param endTime
     * @param titleKey    主题帖子关键字
     * @return
     */
    List<Article> queryByNeeds(@Param("requirement") Integer requirement,
                               @Param("startTime") Long startTime,
                               @Param("endTime") Long endTime,
                               @Param("titleKey") String titleKey);

    /**17.
     * 发表一篇帖子
     * @param articleTitle
     * @param articleContent
     * @param articleAuthor
     * @param forumId
     * @param moduleId
     * @param articleTypeId
     * @return
     */
    int insertOneArticle(@Param("articleTitle")String articleTitle,
                         @Param("articleContent") String articleContent,
                         @Param("articleAuthor") long articleAuthor,
                         @Param("forumId") int forumId,
                         @Param("moduleId") int moduleId,
                         @Param("article_time") long articleTime);

    /**
     * 18. 通过帖子类型id查询帖子类型
     * @param articleTypeId
     * @return
     */
    String queryArticleType(int articleTypeId);

    /**
     * 19. 查询帖子所属板块名
     * @param forumId
     * @return
     */
    String queryArticleForumName(int forumId);
    /**
     * 20. 查询帖子所属模块名
     * @param moduleID
     * @return
     */
    String queryArticleModuleName(int moduleID);

    /**
     * 21. 查询帖子作者名称,作者类型ID
     * @param articleAuthorId
     * @return
     */
    UserInfo queryArticleAuthorInfo(long articleAuthorId);

    /**
     * 22. 查询帖子作者身份名称
     * @param userTypeId
     * @return
     */
    String queryArticleAuthorTypeName(int userTypeId);

    /**
     * 23. 查询帖子类型
     * @return
     */
    String queryArticleStatus(int articleStatusId);

    /**
     *24. 查询帖子板块列表
     * @return
     */
    List<Forum> queryArticleForumList();

    /**
     *25. 查询帖子模块列表
     * @return
     */
    List<Module> queryArticleModuleList(int forumId);

    /**
     *26. 查询帖子类型列表
     */
    List<ArticleType> queryArticleTypeList();

    /**
     * 27. 更新主题
     * @param articleTitle    主题名称
     * @param article_type_id 主题类型id
     * @param article_forum_id  主题所属板块id
     * @param article_module_id 主题所属模块id
     * @return
     */
    int updateArticle(@Param("articleTitle") String articleTitle,
                      @Param("article_type_id") int article_type_id,
                      @Param("article_forum_id") int article_forum_id,
                      @Param("article_module_id") int article_module_id);

    /**
     * 28. 获取统计信息
     * @return
     */
    Counts getCountsInfo();

    /**
     * 29. 通过模块id和主题类型查找不同的帖子类表
     * @param articleType   主题类型
     * @param moduleId      模块id
     * @return
     */
    List<Article> getArticleListByModuleIdAndArticleType(@Param("articleType") int articleType,
                                                         @Param("moduleId") int moduleId);

    /**
     * 更新帖子得分
     * @return
     */
    int updateArticleScores(@Param("articleId") Long articleId,
                            @Param("articleScores") Integer articleScores);

    /**
     * 设置某个模块火贴根据一定规则
     * 这里的得分是经过计算得来的，所以直接取
     * 需要定时设置，每次更新评分时设置，所以写在python里
     * @return
     */
    int setHotArticleByRules();

    /**
     * 用户点击了一篇主题
     * @param articleId
     * @return
     */
    int updateArticleClickCounts(long articleId);

    /**
     * 点赞，踩， 转发，收藏
     * @param aid
     * @param uid
     * @param time
     * @param type 1 点赞 2 踩 3 转发 4 收藏
     * @return
     */
    int articleCollet(@Param("aid") long aid,
                      @Param("uid") long uid,
                      @Param("time") long time,
                      @Param("type") int type);

    /**
     * 判断是否已经点赞收藏踩
     * 转发无限制
     * @param aid
     * @param uid
     * @param type
     * @return
     */
    Article articleColletCheck(@Param("aid") long aid,
                           @Param("uid") long uid,
                           @Param("type") int type);


    /**
     * 获取推荐结果
     * @return
     */
    List<Recommendations> getRecArticleIdList();

    /**
     * 获取某模块下排名靠前的主题前五名
     * @param moduleId
     * @return
     */
    List<Article> getRecAticleByModuleId(long moduleId);

    /**
     * 首页热门主题
     * @return
     */
    List<Article> getArticleListHotByScore();

    /**
     * 首页最近点击最多的主题
     * @return
     */
    List<Article> getArticleListHotByRead(@Param("startTime") long startTime,
                                          @Param("endTime") long endTime);


    // 搜索结果

    /**
     * 通过urlid查找url
     * @param rowid
     * @return
     */
    ArticleUrl  getUrlByRowId(long rowid);

    List<SearchRes> getSearchResult();
}
