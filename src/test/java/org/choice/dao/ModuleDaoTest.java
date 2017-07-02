package org.choice.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * Created by user on 2017/4/23.
 */
@RunWith(SpringJUnit4ClassRunner.class)
/**告诉junit spring的配置文件*/
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ModuleDaoTest {


    @Autowired
    private ModuleDao moduleDao;

    @Autowired
    private ForumDao forumDao;

    @Test
    public void queryArticleModuleList() throws Exception {

    }

    @Test
    public void queryModuleById() throws Exception {

    }

    @Test
    public void updateModuleById() throws Exception {

    }

    @Test
    public void deleteModuleById() throws Exception {

    }

    @Test
    public void getModuleCounts() throws Exception {
        int forumId = 2;
        int counts = moduleDao.getModuleCounts(forumId);
        System.out.println(counts);
    }


}