package org.choice.web;

import org.choice.entity.Article;
import org.choice.entity.Forum;
import org.choice.entity.Module;
import org.choice.service.ModuleService;
import org.choice.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by user on 2017/4/23.
 */
@Controller
@RequestMapping("/admin/module")
public class ModuleController {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ModuleService moduleService;


    @Autowired
    private UserService userService;


    /**
     * 板块列表
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model ){
        List<Forum> forumList = moduleService.getForumList();
        //设置每一个板块下模块数量和板块管理员名称
        for (Forum forum:forumList) {
            forum.setModuleCounts(moduleService.getModuleCounts(forum.getForum_id()));
            forum.setUserInfo(userService.getUserInfoById(forum.getForum_controller_id()));
        }
        model.addAttribute("forumList",forumList);
        return "admin/module/module_list";
    }

    /**
     * 专业课模块列表
     * @param model
     * @return
     */
    @RequestMapping("/zyk")
    public String professor_subject(Model model){
        int ForumId = 1;
        List<Module> moduleList = setModuleInfo(ForumId);
        model.addAttribute("PSModuleList",moduleList);
        return "admin/module/professor_subject";
    }

    /**
     * 公共课模块列表
     * @param model
     * @return
     */
    @RequestMapping("ggk")
    public String public_subject(Model model){
        int ForumId = 2;
        List<Module> moduleList = setModuleInfo(ForumId);
        model.addAttribute("ggkModuleList",moduleList);
        return "admin/module/public_subject";
    }

    /**
     * 高校模块列表
     * @param model
     * @return
     */
    @RequestMapping("/school")
    public String school_module(Model model){
        int ForumId3 = 3;
        int ForumId4 = 4;
        int ForumId5 = 5;
        //华北东北地区
        List<Module> moduleList_3 = setModuleInfo(ForumId3);
        //华北华中西南地区
        List<Module> moduleList_4 = setModuleInfo(ForumId4);
        //西北西南地区
        List<Module> moduleList_5 = setModuleInfo(ForumId5);

        //需要手动初始化申请空间，如果初始化为null，则会报错
        List<Module> moduleList = new ArrayList<Module>();
        for (Module module : moduleList_3){
            moduleList.add(module);
        }
        for (Module module : moduleList_4){
            moduleList.add(module);
        }

        for (Module module : moduleList_5){
            moduleList.add(module);
        }
        for (Module module:moduleList){
            //设置学校信息
            module.setSchool(moduleService.getSchoolInfo(module.getModule_id()));
            module.setForum(moduleService.getForumInfo(module.getModule_belong_forum_id()));
        }
        model.addAttribute("schoolModuleList",moduleList);
        return "admin/module/school_module";
    }

    //----------------------其他----------------------//

    /**
     * 根据板块id查找相应的信息，并替换id
     * @param ForumId
     * @return
     */
    public List<Module> setModuleInfo(int ForumId) {
        List<Module> moduleList = moduleService.getModuleList(ForumId);
        //设置模块下文章数量、浏览数量、评论数量和板块管理员名称
        for (Module module:moduleList) {
            //本模块下文章列表
            List<Article> articleList = moduleService.getArticleListByModuleID(module.getModule_id());

            //设置模块下主题数量
            module.setModule_article_count(articleList.size());

            //获取管理员信息
            module.setUserInfo(userService.getUserInfoById(module.getModule_controller_id()));

            Long articleReadCounts = 0L;
            Long articleReplyCounts = 0L;
            for (Article article: articleList){

                //TODO 最近一周、一个月、一年的数据统计
                articleReadCounts += article.getArticle_read_number();
                articleReplyCounts+= article.getArticle_comment_number();
            }
            module.setModule_read_count(articleReadCounts);
            module.setModule_reply_count(articleReplyCounts);
        }
        return moduleList;
    }
}
