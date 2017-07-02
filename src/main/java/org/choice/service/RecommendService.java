package org.choice.service;

import org.choice.entity.Article;

import java.util.List;

/**
 * Created by user on 2017/5/13.
 */
public interface RecommendService {

    /**
     * 根据用户id获得推荐
     * 此推荐基于用户已经有了多次行为
     * @param uid
     */
    List<Article> getRecommendByUid(long uid);

    /**
     * 对新用户和没有登录的用户做推荐
     * 推荐本模块下比较火的主题
     * @param moduleId
     * @return
     */
    List<Article> recommendForNewUser(long moduleId);

}
