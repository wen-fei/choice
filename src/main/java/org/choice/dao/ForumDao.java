package org.choice.dao;

import org.apache.ibatis.annotations.Param;
import org.choice.entity.Forum;

import java.util.List;

/**
 * Created by user on 2017/4/22.
 */
public interface ForumDao {
    /**
     * 查询板块列表
     * @return
     */
    List<Forum> queryForumList();

    /**
     * 根据forum表里的板块管理员ID查询板块管理员信息
     * 需要使用函数 ArticleDao 22
     * @param forumControllerId
     * @return
     */
    String queryForumControllerInfo(Long forumControllerId);

    /**
     * 更新板块ID板块信息
     * @param forumId  板块ID
     * @param forumName 板块名
     * @param forumControllerId 板块管理员ID
     * @return
     */
    int updateForumInfo(@Param("forumId") Integer forumId,
                        @Param("forumName") String forumName,
                        @Param("forumControllerId") Long forumControllerId);

    /**
     * 根据板块ID删除板块
     * @param forumId
     * @return
     */
    int deleteForum(int forumId);


    /**
     * 通过板块id查询板块信息
     * @param forumId
     * @return
     */
    Forum getForumInfo(int forumId);
}
