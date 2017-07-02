package org.choice.dao;

import org.apache.ibatis.annotations.Param;
import org.choice.entity.*;

import java.util.List;

/**
 * Created by user on 2017/4/23.
 */
public interface ModuleDao {
    /**
     * 1. 根据板块ID查询此板块下帖子模块列表
     * @return
     */
    List<Module> queryArticleModuleList(int forumId);

    /**
     * 2. 根据模块id查询模块信息
     * @param moduleId
     * @return
     */
    Module queryModuleById(int moduleId);
    /**
     * 3. 根据模块id修改模块信息
     * @param moduleId
     * @return
     */
    int updateModuleById(@Param("moduleId") Integer moduleId,
                         @Param("moduleName") String moduleName,
                         @Param("moduleControllerId") Long moduleControllerId,
                         @Param("moduleBelongForumId") Integer moduleBelongForumId);

    /**
     * 4. 根据模块Id删除模块信息
     * @param moduleId
     * @return
     */
    int deleteModuleById(int moduleId);

    /**
     * 5. 根据板块Id查询属于本板块下的模块数量
     * @param forumId
     * @return
     */
    int getModuleCounts(int forumId);

    /**
     * 6. 根据模块ID得到本模块下的文章列表
     * @param moduleId
     * @return
     */
    List<Article> getArticleListByModuleID(int moduleId);

    /**
     * 7. 根据模块id查找学校信息，这里的模块id和学校id相同
     * 学校为固定的学校，不需要新增加学校了
     * @param moduleId
     * @return
     */
    School getSchoolInfoByModuleId(int moduleId);

    /**
     * 8. 得到所有模块信息
     * @return
     */
    List<Module> getModuleInfo();

    /**
     * 9. 查询某模块下火贴
     * @param moduelId
     * @return
     */
    List<Article> getArticlesHot(Integer moduelId);

    /**
     * 10. 查询某模块下加精帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesJing(Integer moduleId);

    /**
     * 11. 查询某模块下置顶帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesTop(Integer moduleId);

    /**
     * 12. 查询某模块下普通帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesCommon(Integer moduleId);

    /**
     * 13. 查询所有模块
     * @return
     */
    List<Module> getModuleAll();

    /**
     * 14. 查询所有版块
     * @return
     */
    List<Forum> getForumAll();

}
