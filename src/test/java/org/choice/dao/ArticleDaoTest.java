package org.choice.dao;

import org.choice.entity.Article;
import org.choice.entity.ArticleType;
import org.choice.entity.Forum;
import org.choice.entity.Module;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * Created by user on 2017/4/19.
 * 配置spring和junit的整合，這樣junit在启动时就会加载spring容器
 */
@RunWith(SpringJUnit4ClassRunner.class)
/**告诉junit spring的配置文件*/
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ArticleDaoTest {



    //注入Dao实现依赖
    @Autowired
    private ArticleDao articleDao;


    @Test
    public void queryById() throws Exception {
        long articleId= 1002L;
        Article article = articleDao.queryById(articleId);
        System.out.println(article);
    }

    @Test
    public void deleteArticle() throws Exception {
        long articleId = 1001;
        int result = articleDao.deleteArticle(articleId);
        System.out.println(result);
    }

    @Test
    public void queryByArticleType() throws Exception {
        int typeId = 1;
        List<Article> articleList = articleDao.queryByArticleType(typeId);
        for(Article article : articleList){
            System.out.println(article);
        }

    }

    @Test
    public void queryByTime() throws Exception {
        List<Article> articleList = articleDao.queryByTime(0L,1493767833990L,1,0,1);
        for (Article article:articleList)
            System.out.println(article);
    }

    @Test
    public void deleteArticleBatch() throws Exception {
//        long[] articleIds = {10001,}
        //TODO
    }

    @Test
    public void setArticleStatusBatch() throws Exception {
        long[] articleIds = new long[] {1000,1002,1003,1004};
        int result = articleDao.setArticleStatusBatch(articleIds);
        if(result > 0)
            System.out.println("设置成功");
        else{
            System.out.println("设置失败");
        }
    }

    @Test
    public void setArticleStatus() throws Exception {
        long articleId = 1000L;
        int status = 2;
        int result = articleDao.setArticleStatus(articleId,status);
        if (result > 0)
            System.out.println("修改成功");
        else{
            System.out.println("修改失败");
        }
    }

    @Test
    public void queryByArticleStatus() throws Exception {
        int status = 2;
        List<Article> articleList = articleDao.queryByArticleStatus(status);
        for(Article article:articleList)
            System.out.println(article);
    }
    @Test
    public void updateArticle() throws Exception {
        long articleId = 1000;
        int result = articleDao.updateArticle(articleId);
    }

    @Test
    public void articleCounts() throws Exception {
        int articleCount =  articleDao.articleCounts();
        System.out.println(articleCount);
    }

    @Test
    public void queryByForum() throws Exception {
        int forumId = 2;
        List<Article> articleList = articleDao.queryByForum(forumId);
        for (Article article:articleList)
            System.out.println(article);
    }

    @Test
    public void queryByModule() throws Exception {
        int moduleId = 1;
        List<Article> articleList = articleDao.queryByModuleId(moduleId);
        for (Article article:articleList)
            System.out.println(article);
    }

    @Test
    public void queryByReadNumbers() throws Exception {
        int readCount = 1;
        List<Article> articleList = articleDao.queryByReadNumbers(readCount);
        for (Article article:articleList)
            System.out.println(article);
    }

    @Test
    public void queryByReplyNumbers() throws Exception {
        int replyCount = 1;
        List<Article> articleList = articleDao.queryByReplyNumbers(replyCount);
        for (Article article:articleList)
            System.out.println(article);
    }

    @Test
    public void queryAll() throws Exception {
        int offset = 0;
        int countLimit = 5;
        List<Article> articleList = articleDao.queryAll(offset, countLimit);
        for (Article article:articleList)
            System.out.println(article);
    }

    @Test
    public void queryByNeeds() throws Exception {
        int requirement = 1;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Long startTime = dateFormat.parse("2017-01-13 00:12:00").getTime();
        Long endTime   = dateFormat.parse("2017-10-13 01:12:00").getTime();
        String titleKey = "开";
        List<Article> articleList = articleDao.queryByNeeds(requirement,startTime,endTime,titleKey);
        for (Article article: articleList)
            System.out.println(article);


    }

    @Test
    public void insertOneArticle() throws Exception {

    }

    @Test
    public void queryArticleForumList() throws Exception{
        List<Forum> forumList = articleDao.queryArticleForumList();
        for (Forum  forum : forumList)
            System.out.println(forum);
    }

    @Test
    public void queryArticleModuleList() throws Exception{
        int forumId = 1;
        List<Module> moduleList = articleDao.queryArticleModuleList(forumId);
        for (Module module : moduleList)
            System.out.println(module);
    }

    @Test
    public void queryArticleTypeList() throws Exception{
        List<ArticleType> articleTypeList = articleDao.queryArticleTypeList();
        for (ArticleType articleType : articleTypeList)
            System.out.println(articleType);
    }

    @Test
    public void getCountsInfo() throws Exception {
        System.out.println(articleDao.getCountsInfo().getArticleCounts());
    }

    @Test
    public void insertOneArticle1() throws Exception {
        String article_title = "东南大学专业课资料共享";
        String article_content = "<td class=\"t_f\" id=\"postmessage_2130778\">\n" +
                "<i class=\"pstatus\"> 本帖最后由 zhaowuling 于 2015-9-30 17:15 编辑 </i><br>\n" +
                "<br>\n" +
                "感谢两年多跟我在一起扯淡闲聊的小伙伴。废话不多，言归正传。<br>\n" +
                "1、关于上课。软件学院研究生第一年是在苏州，总共有一百多人，其中，只有软件工程和网络工程是属于计软学院的，微电子归集成电路学院管，信息技术归仪科管。第一学期软工网工开的课都是偏基础理论的课程，如软件工程导论、面向对象程序设计、软件项目管理等，还有英语政治等课程。根据我们这一届和下一届的学生反馈，大家好像对第一学期的课程吐槽较多，觉得没用，好多人会拿东南软院的课程和同城的中科大软院比，人家的课程各种高大上，因此，好多人会抱怨。东南软院不是没有高大上的课程，只是将这些课程放在了第二学期。不过，当那些高大上的课程开了以后，大家又都不想去上了。唉，人有时候确实很怪。<br>\n" +
                "2、关于实践。我觉得东南这一块做的还是不错的。第一学期，为了配合软件工程课程群，会让大家开发一个小的软件。第二学期开学，学校会请专门的培训公司培训大家，还是一个小项目，大概一个月时间。然后4到5月份就是大家找实习的时候了，我们那一届找的公司总体上还算可以，实习工资大多数在3500左右，当然，也有去BAT等牛逼互联网公司的。<br>\n" +
                "3、关于导师。软件学院导师是在第一学期中后期开始选的，都是计软院的老师。如果第二年出去实习，那么导师基本上就是挂名的，只负责审核论文开题和修改审核毕业论文。如果第二年要去实验室的话，这个导师就跟学术研究生的导师是一样的。<br>\n" +
                "4、关于奖助学金。从2014秋开始，软院学生每年会有6000助学金和4000奖学金。<br>\n" +
                "5、关于软硬件资源。由于在苏州办学，因此，感受不到东南大学本部的氛围。但是苏州那边的硬件资源和环境还是相当不错的。大多数同学都觉得比南京好。每个实验室14人左右，空调24小时开放，每人一台电脑。总之，硬件资源绝对没问题。专业课老师一般都是从南京坐高铁过来的，上完课就回去了。<br>\n" +
                "6、关于毕业。东南软件学院弹性毕业制，2-4年不等，不过只需要交两年学费。两年毕业没有大家想得那样难，其实只要你能在实习期间完成毕业论文，两年毕业还是没问题的。<br>\n" +
                "7、关于就业。软工网工目前就业单位都还不错，去正规的IT互联网企业做研发的，应该有一半左右的人税前年薪加奖金可以拿到15w以上，拿到BAT等互联网公司offer的就更高了，还有个别去大国企或研究所的，这个待遇不好衡量。用人单位压根不会区分什么专硕学硕，人家更看重的是学校名气还有个人能力，像中电那些比较好的研究所，要求本硕都是985。<br>\n" +
                "ps：东南软院的学生还是比较用功的，大家晚上一般都到11点左右才回宿舍，软院的学生都是根据自己的爱好以及将来想去的公司，买书自学，大牛很多的。</td>";
        long article_author_id = 2;
        int forumId = 4;
        int moduleId= 28;
        long time = (new Date()).getTime();
        int result = articleDao.insertOneArticle(
            article_title,article_content,article_author_id,
                forumId,moduleId,time
        );
        System.out.println(result);

    }

    @Test
    public void articleCollet() throws Exception {
        int type = 1;
        long aid = 1;
        long uid = 1;
        long time = (new Date()).getTime();
        int result = articleDao.articleCollet(aid,uid,time,type);
    }


}