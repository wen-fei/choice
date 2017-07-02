package org.choice.service.impl;

import org.choice.dao.ReplyDao;
import org.choice.entity.Reply;
import org.choice.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by user on 2017/5/2.
 */
@Service
@Transactional
public class ReplyServiceImpl implements ReplyService{

    @Autowired
    private ReplyDao replyDao;

    @Override
    public List<Reply> getReplyList() {
        return replyDao.getReplyList();
    }

    @Override
    public List<Reply> getReplyListByArticleId(Long articleId) {
        return replyDao.getReplyListByArticleId(articleId);
    }

    @Override
    public List<Reply> getReplyListByUserId(Long userID) {
        return replyDao.getReplyListByUserId(userID);
    }

    @Override
    public List<Reply> getReplyListByTime(Long startTime, Long endTime) {
        return replyDao.getReplyListByTime(startTime,endTime);
    }

    @Override
    public List<Reply> getReplyListByModuleId(int moduleId) {
        return replyDao.getReplyListByModuleId(moduleId);
    }

    @Override
    public List<Reply> getReplyListByForumId(int forumId) {
        return replyDao.getrReplyListByForumId(forumId);
    }

    @Override
    public Reply getReplyByReplyId(Long replyId) {
        return replyDao.getReplyById(replyId);
    }

    @Override
    public Reply getReplyByReplyContent(String contentKey) {
        return replyDao.getReplyByReplyContent(contentKey);
    }

    @Override
    public int insertOneReply(Long articleId,String content, Long userId) {
        Long createTime = (new Date()).getTime();
        return replyDao.insertOneReply(articleId,createTime,content,userId);
    }

    @Override
    public int deleteOneReply(Long replyId) {
        return replyDao.deleteOneReply(replyId);
    }

    @Override
    public int deleteAllReplyByArticleId(Long articleId) {
        return replyDao.deleteAllReplyByArticleId(articleId);
    }

    @Override
    public int deleteAllReplyByUserId(Long userId) {
        return replyDao.deleteAllReplyByUserId(userId);
    }

    @Override
    public int deleteOneReplyBySelf(Long userId, Long replyId) {
        return replyDao.deleteOneReplyBySelf(userId,replyId);
    }
}
