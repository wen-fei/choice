package org.choice.service.impl;

import org.choice.dao.ArticleDao;
import org.choice.entity.Article;
import org.choice.entity.Recommendations;
import org.choice.service.RecommendService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by user on 2017/5/13.
 */
@Service
@Transactional
public class RecommendServiceImpl implements RecommendService{

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private ArticleDao articleDao;

    @Override
    public List<Article> getRecommendByUid(long uid) {

        /*执行python脚本，将推荐结果插入数据库中*/
        try{
            Process proc = Runtime.getRuntime()
                    .exec("python  C:\\Users\\user\\Desktop\\ml\\CF\\recommendations.py " +uid);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                //
                logger.info("python脚本 执行完毕");
                logger.info("python 执行日志输出："+line);
            }
            proc.waitFor();
        }catch (Exception e){
            System.out.println("python脚本错误："+e);
        }

        /*从数据库中获取结果*/
        List<Recommendations> recommendationsList = articleDao.getRecArticleIdList();
        List<Article> articleList = new ArrayList<Article>();
        for(Recommendations recommendations : recommendationsList){
            long aid = recommendations.getAid();
            Article article = articleDao.queryById(aid);
            articleList.add(article);
        }
        return articleList;
    }

    @Override
    public List<Article> recommendForNewUser(long moduleId) {
        return articleDao.getRecAticleByModuleId(moduleId);
    }
}
