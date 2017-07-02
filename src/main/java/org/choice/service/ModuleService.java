package org.choice.service;

import org.choice.entity.Counts;
import org.choice.entity.Article;
import org.choice.entity.Forum;
import org.choice.entity.Module;
import org.choice.entity.School;

import java.util.List;

/**
 * Created by user on 2017/4/23.
 */
public interface ModuleService {


    /**
     * 查询所有版块列表
     * @return
     */
    List<Forum> getForumList();


    /**
     * 根据板块id删除板块，同时将属于这个板块下的所有模块的板块id设置为null
     * @param forumId
     * @return
     */
    int deleteForum(int forumId);

    /**
     * 修改板块信息
     * @param forumId       板块ID
     * @param forumName     板块名称
     * @param forumControllerId 板块管理员ID
     * @return
     */
    int updateForum(int forumId, String forumName, Long forumControllerId);

    /**
     * 根据板块id获取模块列表
     * @param forumId
     * @return
     */
    List<Module> getModuleList(int forumId);

    /**
     * 查询所有模块列表
     * @return
     */
    List<Module> getModuleAll();

    /**
     * 根据模块id删除模块
     * @param moduleId
     * @return
     */
    int deleteModule(int moduleId);

    /**
     * 根据板块ID查询属于本板块的模块数量
     * @param forumId
     * @return
     */
    int getModuleCounts(int forumId);

    /**
     * 根据模块ID得到属于本模块下的文章列表
     * @param ModuleId
     * @return
     */
    List<Article> getArticleListByModuleID(int ModuleId);

    /**
     * 通过模块id获取学校信息
     * @param moduleId
     * @return
     */
    School getSchoolInfo(int moduleId);

    /**
     * 通过板块id获取板块信息
     * @param forumId
     * @return
     */
    Forum getForumInfo(int forumId);

    /**
     * 获取所有模块信息
     * @return
     */
    List<Module> getModuleInfo();

    /**
     * 获取统计信息，无参默认查询所有统计信息
     * @return
     */

    Counts getCountsInfo();
    /**
     * 获取统计信息
     * @param typeId   值为1 按版块id查，值为2按模块id查
     * @param ID  板块id或模块id
     * @return
     */
    Counts getCountsInfo(int typeId, int ID);


    /**
     * 通过模块id得到模块信息
     * @param moduleId
     * @return
     */
    Module getModuleInfoById(int moduleId);

    /**
     * 通过学校ID得到学校信息
     * @param schoolId
     * @return
     */
    School getSchoolInfoById(int schoolId);

    /**
     * 查询某模块下火贴
     * @param moduelId
     * @return
     */
    List<Article> getArticlesHot(int moduelId);

    /**
     * 查询某模块下加精帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesJing(int moduleId);

    /**
     * 查询某模块下置顶帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesTop(int moduleId);

    /**
     * 查询普通帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesCommon(int moduleId);

}
