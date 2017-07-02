package org.choice.service.impl;

import org.choice.dao.ArticleDao;
import org.choice.entity.Article;
import org.choice.entity.Recommendations;
import org.choice.entity.SearchRes;
import org.choice.service.SearchService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by user on 2017/5/18.
 */
@Service
@Transactional
public class SearchServiceImpl implements SearchService {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private ArticleDao articleDao;


    @Override
    public List<Article> getSearchRes(String str) {
         /*执行python脚本，将推荐结果插入数据库中*/
        try{
            Process proc = Runtime.getRuntime()
                    .exec("python  C:\\Users\\user\\Desktop\\ml\\search\\search.py " + str);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                //
                logger.info("search脚本执行完毕");
                logger.info("search脚本执行日志输出："+line);
            }
            proc.waitFor();
        }catch (Exception e){
            System.out.println("search脚本错误："+e);
        }

        /*从数据库中获取结果*/
        List<SearchRes> SearchResList = articleDao.getSearchResult();
        List<Article> articleList = new ArrayList<Article>();
        for(SearchRes search : SearchResList){
            long url_rowid = search.getUrlid();
            String url = articleDao.getUrlByRowId(url_rowid).getUrl();
            // 提取主题id
            String pattern = ".*article(.*)/content";
            Pattern regex = Pattern.compile(pattern);
            Matcher m = regex.matcher(url);
            if(m.find()){
                System.out.println("article id is :" + m.group(1));
                Article article = articleDao.queryById(Long.valueOf(m.group(1)));
                articleList.add(article);
            }else{
                logger.info("提取主题ID出错，找不到结果" + url);
            }

        }
        return articleList;
    }

    @Override
    public void train(String search_key, long selected_url_id) {
        /*执行python脚本，将推荐结果插入数据库中*/
        // 传参数无法传中文？
        try{
            Process proc = Runtime.getRuntime()
                    .exec("python  C:\\Users\\user\\Desktop\\ml\\search\\nn.py " + search_key.trim() +" "+ selected_url_id);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                logger.info("train脚本执行日志输出："+line);
            }
            logger.info("train脚本执行完毕");
            proc.waitFor();
        }catch (Exception e){
            System.out.println("train脚本错误："+e);
        }
    }
}
