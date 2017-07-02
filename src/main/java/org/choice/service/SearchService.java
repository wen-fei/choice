package org.choice.service;

import org.choice.entity.Article;

import java.util.List;

/**
 * Created by user on 2017/5/18.
 */
public interface SearchService {

    //接受查询关键字，返回搜索结果
    List<Article> getSearchRes(String str);

    void train(String search_key, long selected_url_id);

}
