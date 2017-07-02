package org.choice.service.impl;

import org.choice.dao.ArticleDao;
import org.choice.dao.UserDao;
import org.choice.entity.Article;
import org.choice.utils.ExcelUitl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by user on 2017/5/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
/**告诉junit spring的配置文件*/
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ArticleServiceImplTest {
    @Autowired
    private ArticleDao articleDao;

    @Test
    public void articleToExcel() throws Exception {
        List<Article> articleList = articleDao
                .queryAll(0,articleDao.articleCounts());
        LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
        OutputStream out = new FileOutputStream("test.xls");
        ExcelUitl.listToExcel(articleList,fieldMap,"article_info",out);
    }

}