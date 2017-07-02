package org.choice.web;

import org.apache.ibatis.annotations.Param;
import org.choice.entity.*;
import org.choice.service.ArticleService;
import org.choice.service.ModuleService;
import org.choice.service.RecommendService;
import org.choice.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by user on 2017/4/24.
 */
@Controller
@RequestMapping("/app")
public class AppController {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private RecommendService recommendService;

    /**
     * 主页主模块列表
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){

        Counts counts = moduleService.getCountsInfo();
        Long userCounts = userService.getUserCounts();
        model.addAttribute("countsList",counts);
        model.addAttribute("userCounts",userCounts);

        //根据不同的板块id得到不同的模块列表信息

        //1.专业课
        List<Module> zykmoduleList = moduleService.getModuleList(1);
        model.addAttribute("zykmoduleList",zykmoduleList);
        //2.公共课
        List<Module> ggkmoduleList = moduleService.getModuleList(2);
        model.addAttribute("ggkmoduleList",ggkmoduleList);

        //3.华北东北地区
        List<Module> hbdbmoduleList = moduleService.getModuleList(3);
        model.addAttribute("hbdbmoduleList",hbdbmoduleList);

        //4.华东华中华南地区
        List<Module> hdhzhnmoduleList = moduleService.getModuleList(4);
        model.addAttribute("hdhzhnmoduleList",hdhzhnmoduleList);

        //5.西北西南地区
        List<Module> xbxnmoduleList = moduleService.getModuleList(5);
        model.addAttribute("xbxnmoduleList",xbxnmoduleList);

        //6.其他高校
        List<Module> othermoduleList = moduleService.getModuleList(6);
        model.addAttribute("othermoduleList",othermoduleList);

        /*热门主题*/
        List<Article> articleListByScore = articleService.getArticleListHotByScore();
        model.addAttribute("articleListByScore",articleListByScore);

        /*热门浏览的主题*/
        List<Article> articleListByRead = articleService.getArticleListHotByRead();
        model.addAttribute("articleListByRead",articleListByRead);
        return "app/index";
    }

    /**
     * 某个模块下的所有主题列表
     * @param moduleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/module{moduleId}/list")
    public String list(@PathVariable("moduleId") int moduleId, Model model){
        //得到模块信息
        Module module = moduleService.getModuleInfoById(moduleId);
        module.setForum(moduleService.getForumInfo(module.getModule_belong_forum_id()));
        model.addAttribute("moduleInfo",module);

        Counts counts_module_info = moduleService.getCountsInfo(2,moduleId);
        model.addAttribute("moduleCounts",counts_module_info);
        //得到此模块下主题列表

        //置顶主题
        List<Article> articleList_top = moduleService.getArticlesTop(moduleId);
        articleList_top = articleService.setArticleFromIdToName(articleList_top);
        model.addAttribute("articleList_top",articleList_top);

        //火热主题
        List<Article> articleList_hot = moduleService.getArticlesHot(moduleId);
        model.addAttribute("articleList_hot",articleList_hot);

        //加精主题
        List<Article> articleList_jing = moduleService.getArticlesJing(moduleId);
        model.addAttribute("articleList_jing",articleList_jing);

        //除了置顶主题以外的主题
        List<Article> articleList_common = moduleService.getArticlesCommon(moduleId);
        articleList_common = articleService.setArticleFromIdToName(articleList_common);
        model.addAttribute("articleList",articleList_common);

        return "app/article/article_list";
    }

    /**
     * 访问一篇主题
     * @param articleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/article{articleId}/content")
    public String content(@PathVariable("articleId") Long articleId, Model model, HttpSession session){
        //得到主题信息
        Article article = articleService.getArticleById(articleId);
        //得到板块名称
        article.setArticle_forum_name(moduleService.getForumInfo(article.getArticle_forum_id()).getForum_name());
        //得到模块名称
        article.setArticle_module_name(moduleService.getModuleInfoById(article.getArticle_module_id()).getModule_name());
        //转换时间long->date
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        article.setArticle_create_time_date(dateFormat.format(article.getArticle_create_time()));
        model.addAttribute("articleInfo", article);

        //得到主题作者信息
        UserInfo articleAuthorInfo = userService.getUserInfoById(article.getArticle_authorID());
        articleAuthorInfo.setRegisterTime_date(dateFormat.format(articleAuthorInfo.getRegisterTime()));
        model.addAttribute("articleAuthorInfo",articleAuthorInfo);

        //得到此主题下回复列表
        List<Reply> replyList = articleService.getReplyInfoByArticleId(articleId);
        //得到回复作者信息、设置时间、学校
        for (Reply reply : replyList) {
            reply.setUserInfo(userService.getUserInfoById(reply.getReply_author_id()));
            UserInfo replyUserInfo = reply.getUserInfo();
            replyUserInfo.setRegisterTime_date(dateFormat.format(replyUserInfo.getRegisterTime()));
            reply.setReply_time_date(dateFormat.format(reply.getReply_time()));

        }
        model.addAttribute("replyList",replyList);
        UserInfo getsession  =(UserInfo)session.getAttribute("UserInfo_session");
        /*日志记录，每访问一次主题就插入到数据库中*/
        if (session.getAttribute("UserInfo_session") == null){
            logger.info("用户尚未登录，只统计主题表里的点击次数");

            int resu = articleService.updateArticleClickCounts(articleId);
            if (resu > 0) {
                logger.info("日志记录插入成功" + "aid:" + articleId + "read");
            } else {
                logger.info("日志记录插入出错" + "aid:" + articleId + "read");
            }
        }
        else{
            int resu = articleService.updateArticleClickCounts(articleId);
            if (resu > 0) {
                logger.info("日志记录插入成功" + "aid:" + articleId + "read");
            } else {
                logger.info("日志记录插入出错" + "aid:" + articleId + "read");
            }

            long uid = getsession.getUser_info_id();
            int insert_result = userService.insertToUserRecord_click(uid, articleId);
            if (insert_result > 0) {
                logger.info("日志记录插入成功" + "uid:" + uid + "aid:" + articleId + "read");
            } else {
                logger.info("日志记录插入出错" + "uid:" + uid + "aid:" + articleId + "read");
            }
        }


        /*推荐的主题*/
        /*用户尚未登录*/
        //距离用户注册时间过去了多久,小于三天默认认为没有操作行为

        if (session.getAttribute("UserInfo_session") == null ){
            List<Article> articleList_rec_new = recommendService.recommendForNewUser(article.getArticle_module_id());
            model.addAttribute("recArticleList",articleList_rec_new);
        }else{
            long xTime = ((new Date()).getTime() - getsession.getRegisterTime()) /(1000*60*60*24*3);
            if(xTime < 3){
                logger.info("用户id为："+getsession.getUser_info_id());
                List<Article> articleList_rec_new = recommendService.recommendForNewUser(article.getArticle_module_id());
                model.addAttribute("recArticleList",articleList_rec_new);
            }else {
                logger.info("用户id为："+getsession.getUser_info_id());
                List<Article> articleList_rec_cf = recommendService.getRecommendByUid(getsession.getUser_info_id());
                model.addAttribute("recArticleList_cf", articleList_rec_cf);
            }
        }
        return "app/article/article_reply";
    }



}

