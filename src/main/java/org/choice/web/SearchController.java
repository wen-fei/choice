package org.choice.web;

import org.choice.entity.Article;
import org.choice.entity.SearchRes;
import org.choice.service.ArticleService;
import org.choice.service.SearchService;
import org.choice.utils.MLUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by user on 2017/5/18.
 */
@Controller
@RequestMapping("/")
public class SearchController {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;

    @Autowired
    private SearchService searchService;

    @RequestMapping("app/search")
    public String search(Model model, HttpServletRequest request){
        String search_keys = request.getParameter("searchKey");
        System.out.println("search_key is:" + search_keys);
        List<Article> articleList = searchService.getSearchRes(search_keys);
        List<SearchRes> searchResList = new ArrayList<SearchRes>();
        if (articleList.size() == 0){
            String str = "搜索结果不存在";
            model.addAttribute("searchres",str);
        }else{
            for (Article article: articleList){
                SearchRes searchRes = new SearchRes();
                searchRes.setArticle_id(article.getArticle_id());
                searchRes.setArticle_title(article.getArticle_title());

                //清洗数据
                String content = MLUtils.Html2Text(article.getArticle_content());
                searchRes.setArticle_content(content);
                searchRes.setSearchKey(search_keys);
                searchResList.add(searchRes);
            }
            model.addAttribute("searchres", searchResList);
        }

        return "/app/search/search";
    }

    @RequestMapping("app/train/{article_id}/{search_key}")
    public String train(Model model, HttpServletRequest request,
                        @PathVariable("article_id") long article_id,
                        @PathVariable("search_key") String search_key){
        //在跳转到主题页面之前对神经网络进行训练
        System.out.println(article_id);
        System.out.println(search_key);
        searchService.train(search_key, article_id);
        return "redirect: /app/article"+article_id+"/content";

    }
}
