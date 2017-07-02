package org.choice.service;

import org.choice.entity.Reply;

import java.util.List;

/**
 * Created by user on 2017/5/2.
 */
public interface ReplyService {

    /**
     * 1. 得到所有评论
     * @return
     */
    List<Reply> getReplyList();

    /**
     * 2. 得到属于某个主题的所有评论
     * @param articleId 主题ID
     * @return
     */
    List<Reply> getReplyListByArticleId(Long articleId);

    /**
     * 3. 得到属于某个用户的所有评论
     * @param userID 用户id
     * @return
     */
    List<Reply> getReplyListByUserId(Long userID);

    /**
     * 4. 按时间段查找评论
     * @param startTime 起始时间
     * @param endTime   结束时间
     * @return
     */
    List<Reply> getReplyListByTime(Long startTime, Long endTime);

    /**
     * 5. 得到评论列表通过模块ID
     * @param moduleId  模块ID
     * @return
     */
    List<Reply> getReplyListByModuleId(int moduleId);

    /**
     * 6. 得到评论列表通过板块id
     * @param forumId   板块id
     * @return
     */
    List<Reply> getReplyListByForumId(int forumId);

    /**
     * 7. 通过评论id查找某个评论
     * @param replyId 评论id
     * @return
     */
    Reply getReplyByReplyId(Long replyId);

    /**
     * 8. 通过评论内容关键字查找某个评论
     * @param contentKey
     * @return
     */
    Reply getReplyByReplyContent(String contentKey);

    /**
     * 9. 增加一条评论
     * @param articleId 所属主题id
     * @param content   评论内容
     * @Param createTime 发表时间默认为当前时间
     * @param userId    作者id
     * @return
     */
    int insertOneReply(Long articleId,String content, Long userId);

    /**
     * 10. 删除某条评论
     * @param replyId 评论id
     * @return
     */
    int deleteOneReply(Long replyId);

    /**
     * 11. 删除某个主题下所有评论
     * @param articleId  主题id
     * @return
     */
    int deleteAllReplyByArticleId(Long articleId);

    /**
     * 12. 删除属于某个用户的所有评论
     * @param userId
     * @return
     */
    int deleteAllReplyByUserId(Long userId);

    /**
     * 13. 用户删除自己所发表的某个评论
     * @param userId   用户ID
     * @param replyId  评论ID
     * @return
     */
    int deleteOneReplyBySelf(Long userId, Long replyId);
}
