package org.choice.service.impl;

import org.choice.dao.ArticleDao;
import org.choice.dao.ForumDao;
import org.choice.dao.ModuleDao;
import org.choice.dao.SchoolDao;
import org.choice.entity.Counts;
import org.choice.entity.Article;
import org.choice.entity.Forum;
import org.choice.entity.Module;
import org.choice.entity.School;
import org.choice.service.ModuleService;
import org.choice.service.UserService;
import org.choice.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
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
public class ModuleServiceImpl implements ModuleService {

    private ModuleService moduleService;

    private UserService userService;

    @Resource
    private ForumDao forumDao;

    @Resource
    private ModuleDao moduleDao;

    @Resource
    private ArticleDao articleDao;

    @Resource
    private SchoolDao schoolDao;


    @Override
    public List<Forum> getForumList() {
        return forumDao.queryForumList();
    }

    @Override
    public int deleteForum(int forumId) {
        return forumDao.deleteForum(forumId);
    }

    @Override
    public int updateForum(int forumId, String forumName, Long forumControllerId) {
        return forumDao.updateForumInfo(forumId, forumName, forumControllerId);
    }

    @Override
    public List<Module> getModuleList(int forumId) {
        return moduleDao.queryArticleModuleList(forumId);
    }

    @Override
    public List<Module> getModuleAll() {
        return moduleDao.getModuleAll();
    }

    @Override
    public int deleteModule(int moduleId) {
        return moduleDao.deleteModuleById(moduleId);
    }

    @Override
    public int getModuleCounts(int forumId) {
        return moduleDao.getModuleCounts(forumId);
    }

    @Override
    public List<Article> getArticleListByModuleID(int ModuleId) {
        return moduleDao.getArticleListByModuleID(ModuleId);
    }

    @Override
    public School getSchoolInfo(int moduleId) {
        return moduleDao.getSchoolInfoByModuleId(moduleId);
    }

    @Override
    public Forum getForumInfo(int forumId) {
        return forumDao.getForumInfo(forumId);
    }

    @Override
    public List<Module> getModuleInfo() {
        return moduleDao.getModuleInfo();
    }

    @Override
    public Counts getCountsInfo() {
        //查询所有时，前两个参数不起作用
        return CountsInfo(1,1,1);
    }

    @Override
    public Counts getCountsInfo(int typeId, int ID) {
        return CountsInfo(typeId,ID,0);
    }

    @Override
    public Module getModuleInfoById(int moduleId) {
        return moduleDao.queryModuleById(moduleId);
    }

    @Override
    public School getSchoolInfoById(int schoolId) {
        return schoolDao.getSchoolInfoById(schoolId);
    }

    @Override
    public List<Article> getArticlesHot(int moduelId) {
        return moduleDao.getArticlesHot(moduelId);
    }

    @Override
    public List<Article> getArticlesJing(int moduleId) {
        return moduleDao.getArticlesJing(moduleId);
    }

    @Override
    public List<Article> getArticlesTop(int moduleId) {
        return moduleDao.getArticlesTop(moduleId);
    }

    @Override
    public List<Article> getArticlesCommon(int moduleId) {
        return moduleDao.getArticlesCommon(moduleId);
    }

    /**
     * 查询统计信息函数抽取公共部分
     * @param typeId   模块or板块 1是forum 2 是module
     * @param ID        模块id或者板块id
     * @param isAll     是否是查询所有 1是0否
     * @return
     */
    public Counts CountsInfo(int typeId, int ID, int isAll){

        Long nowTime = (new Date()).getTime();
        Long currentWeekMonDay = DateUtils.getFirstDayOfWeek(new Date()).getTime();
        Long lastWeekMonday  = currentWeekMonDay - 60480000;
        Long currentMonthFirstDay = DateUtils.getFirstDayOfMonth(new Date()).getTime();
        Long lastMonthFirstDay   = currentMonthFirstDay - 60480000*4;
        List<Article> todayArticleList = articleDao.queryByTime(DateUtils.getStartTime(), DateUtils.getEndTime(), typeId, ID, isAll);
        List<Article> yesterdayArticleList = articleDao.queryByTime(DateUtils.getStartTime()-86400000,DateUtils.getEndTime()-86400000, typeId, ID, isAll);
        List<Article> currentWeekArticleList = articleDao.queryByTime(currentWeekMonDay,nowTime, typeId, ID,isAll );
        List<Article> lastWeekArticleList = articleDao.queryByTime(lastWeekMonday,currentWeekMonDay, typeId, ID ,isAll);
        List<Article> currentMonthArticleList = articleDao.queryByTime(currentMonthFirstDay,nowTime, typeId, ID,isAll);
        List<Article> lastMonthArticleList = articleDao.queryByTime(lastMonthFirstDay,currentWeekMonDay, typeId, ID,isAll);


        System.out.println("todayArticleList" + todayArticleList);
        //获得统计信息对象
        Counts articleCounts = articleDao.getCountsInfo();
        //主题总数已经在mapper统计
        //设置今日帖子总数
        articleCounts.setTodayArticleCounts((long)todayArticleList.size());
        //循环统计，也可以放在数据库中统计

        //今日数据
        Long todayReplyCounts = 0L;
        Long todayReadCounts = 0L;
        Long todayArticleCounts = 0L;

        for(Article article : todayArticleList){
            todayReplyCounts += article.getArticle_comment_number();
            todayReadCounts += article.getArticle_read_number();
          //  todayArticleCounts += article.getArticle_id();
        }
        todayArticleCounts = (long)todayArticleList.size();
        System.out.println(todayArticleCounts);

        articleCounts.setTodayArticleCounts(todayArticleCounts);
        articleCounts.setTodayReadCounts(todayReadCounts);
        articleCounts.setTodayReplyCounts(todayReplyCounts);

        //昨日数据
        Long yesterdayReplyCounts = 0L;
        Long yesterdayReadCounts = 0L;
        Long yesterdayArticleCounts = 0L;
        for(Article article : yesterdayArticleList){
            yesterdayReplyCounts += article.getArticle_comment_number();
            yesterdayReadCounts += article.getArticle_read_number();
//            yesterdayArticleCounts += article.getArticle_id();
        }
        yesterdayArticleCounts = (long)yesterdayArticleList.size();
        articleCounts.setYesterdayArticleCounts(yesterdayArticleCounts);
        articleCounts.setYesterdayReadCounts(yesterdayReadCounts);
        articleCounts.setYesterdayReplyCounts(yesterdayReplyCounts);

        //本周数据
        Long currentWeekReplyCounts = 0L;
        Long currentWeekReadCounts = 0L;
        Long currentWeekArticleCounts = 0L;
        for(Article article : currentWeekArticleList){
            currentWeekReplyCounts += article.getArticle_comment_number();
            currentWeekReadCounts += article.getArticle_read_number();
//            currentWeekArticleCounts += article.getArticle_id();
        }
        currentWeekArticleCounts = (long)currentWeekArticleList.size();
        articleCounts.setCurrentWeekArticleCounts(currentWeekArticleCounts);
        articleCounts.setCurrentWeekReadCounts(currentWeekReadCounts);
        articleCounts.setCurrentWeekReplyCounts(currentWeekReplyCounts);
        //上周数据
        Long lastWeekReplyCounts = 0L;
        Long lastWeekReadCounts = 0L;
        Long lastWeekArticleCounts = 0L;
        for(Article article : lastWeekArticleList){
            lastWeekReplyCounts += article.getArticle_comment_number();
            lastWeekReadCounts += article.getArticle_read_number();
//            lastWeekArticleCounts += article.getArticle_id();
        }
        lastWeekArticleCounts = (long)lastWeekArticleList.size();
        articleCounts.setLastWeekArticleCounts(lastWeekArticleCounts);
        articleCounts.setLastWeekReadCounts   (lastWeekReadCounts);
        articleCounts.setLastWeekReplyCounts  (lastWeekReplyCounts);

        //本月数据
        Long currentMonthReplyCounts = 0L;
        Long currentMonthReadCounts = 0L;
        Long currentMonthArticleCounts = 0L;
        for(Article article : currentMonthArticleList){
            currentMonthReplyCounts += article.getArticle_comment_number();
            currentMonthReadCounts += article.getArticle_read_number();
//            currentMonthArticleCounts += article.getArticle_id();
        }
        currentMonthArticleCounts = (long)currentMonthArticleList.size();
        articleCounts.setCurrentMonthArticleCounts(currentMonthArticleCounts);
        articleCounts.setCurrentMonthReadCounts   (currentMonthReadCounts);
        articleCounts.setCurrentMonthReplyCounts  (currentMonthReplyCounts);

        //上月数据
        Long lastMonthReplyCounts = 0L;
        Long lastMonthReadCounts = 0L;
        Long lastMonthArticleCounts = 0L;
        for(Article article : lastMonthArticleList){
            lastMonthReplyCounts += article.getArticle_comment_number();
            lastMonthReadCounts += article.getArticle_read_number();
//            lastMonthArticleCounts += article.getArticle_id();
        }
        lastMonthArticleCounts = (long)lastMonthArticleList.size();
        articleCounts.setLastMonthArticleCounts(lastMonthArticleCounts);
        articleCounts.setLastMonthReadCounts   (lastMonthReadCounts);
        articleCounts.setLastMonthReplyCounts  (lastMonthReplyCounts);

        //统计会员信息

        return articleCounts;
    }


}
