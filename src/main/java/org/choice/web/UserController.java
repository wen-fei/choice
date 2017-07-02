package org.choice.web;

import org.choice.entity.*;
import org.choice.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.text.resources.fr.FormatData_fr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by user on 2017/5/2.
 */
@Controller
@RequestMapping("/")
public class UserController {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommonService commonService;

    /**
     * 后台用户信息列表
     * @param model
     * @return
     */
    @RequestMapping("admin/user/list")
    public String list(Model model){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<UserInfo> userInfoList = userService.getUserList();
        //设置信息
        for(UserInfo userInfo: userInfoList){
            userInfo.setRegisterTime_date(dateFormat.format(userInfo.getRegisterTime()));
        }
        model.addAttribute("userInfoList",userInfoList);
        return "admin/user/user_list";
    }

    /**
     * 后台用户浏览过的主题信息列表
     * @param model
     * @return
     */
    @RequestMapping("admin/user/read")
    public String readHistory(Model model){
        return "admin/user/read_history";

    }

    /**
     * 用户回复的帖子列表
     * @param model
     * @return
     */
    @RequestMapping("admin/user/reply")
    public String replyHistroy(Model model){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Reply> replyList = replyService.getReplyList();
        for(Reply reply:replyList){
            reply.setUserInfo(userService.getUserInfoById(reply.getReply_author_id()));
            Article article = articleService.getArticleById(reply.getReply_article_id());
            articleService.setArticleFromIdToName(article);
            reply.setArticleInfo(article);
            reply.setReply_time_date(dateFormat.format(reply.getReply_time()));
        }
        model.addAttribute("replyList",replyList);
        return "admin/user/reply_story";
    }

    /**
     * 用户信息页
     * @param user_info_id
     * @param model
     * @return
     */
    @RequestMapping("app/user/user_info{user_info_id}/info")
    public String user_info(@PathVariable long user_info_id,  Model model){
        //根据用户查找用户信息
        UserInfo userInfo = userService.getUserInfoById(user_info_id);
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        userInfo.setRegisterTime_date(dateFormat.format(userInfo.getRegisterTime()));
        model.addAttribute("user_info_detail",userInfo);
        return "/app/user/user_info";
    }

    /**
     * 设置用户信息
     * @param user_info_id
     * @param model
     * @return
     */
    @RequestMapping("app/user/user_info{user_info_id}/setting")
    public String user_info_setting(@PathVariable long user_info_id,  Model model, HttpSession session){
        //根据用户查找用户信息
        if(session.getAttribute("UserInfo_session") != null) {
            UserInfo userInfo = userService.getUserInfoById(user_info_id);
            model.addAttribute("user_info_detail", userInfo);
            return "/app/user/user_info_edit";
        }else{
            session.setAttribute("edit_userInfo_error","noRight");
            return "redirect: /app/user/user_info"+ user_info_id +"/info";
        }
    }


    /**
     * 修改用户信息
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/user/user_info{user_info_id}/edit",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String user_info_edit(@RequestBody String result, HttpServletRequest request, HttpSession session){
        if(session.getAttribute("UserInfo_session") != null){
            try{
                long user_info_id = Long.valueOf(request.getParameter("user_info_id"));
                String name = request.getParameter("name");
                String user_email = request.getParameter("user_email");
                int exam_year = Integer.valueOf(request.getParameter("exam_year"));
                int user_gender = Integer.valueOf(request.getParameter("user_gender"));
                String  user_home_province = request.getParameter("user_home_province");
                String  user_home_city = request.getParameter("user_home_city");
                String  user_ben_school = request.getParameter("user_ben_school");
                String  user_want_school = request.getParameter("user_want_school");

                int updaterow = userService.updateUserInfo(user_info_id,name,user_email,
                        exam_year, user_gender,user_home_province,user_home_city,user_ben_school,user_want_school);

                if (updaterow > 0){
                    result = "1";
                }else{
                    result = "0";
                }
            }
            catch (Exception e){
                System.out.println(e);
            }
        }else{
            // 用户尚未登录，无权修改信息
            result = "2";
        }

        return result;

    }

    /**
     * 后台批量删除用户
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/deleteUsers", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deleteUserBatchs(@RequestBody String result, HttpServletRequest request) {
        String ids = request.getParameter("user_ids");
        String[] user_ids_str = ids.split(",");
        long[] user_ids = new long[user_ids_str.length];
        for (int i = 0; i < user_ids_str.length; i++) {
            user_ids[i] = Long.valueOf(user_ids_str[i]);
        }
        try {
            commonService.deleteBatchs("user_info", "user_info_id", user_ids);
            result = "1";
            return result;
        } catch (Exception e) {
            logger.info("后台批量删除用户错误，原因：" + e);
            result = "0";
            return result;
        }
    }

    /**
     * 设置管理员
     * @param result
     * @param model
     * @param request
     * @param type
     * @return
     */
    @RequestMapping(value = "admin/user/setController/{type}",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String setController(@RequestBody String result, Model model, HttpServletRequest request, @PathVariable("type") int type){
        //设置板块管理员
        result = "0";
        if(type == 1){
            int forum_id = Integer.valueOf(request.getParameter("forum_id"));
            long user_id = Long.valueOf(request.getParameter("user_id"));
            UserInfo userInfo_forum = userService.getUserInfoById(user_id);
            if (userInfo_forum == null){
                result = "3";
            }else{
                int update_result_forum = userService.setController(forum_id, user_id, type);
                if(update_result_forum > 0)
                    result = "1";
                else
                    result = "0";
                return  result;
            }
        }else if(type==2){
            int module_id = Integer.valueOf(request.getParameter("module_id"));
            long user_id = Long.valueOf(request.getParameter("user_id"));
            UserInfo userInfo_module = userService.getUserInfoById(user_id);
            if (userInfo_module == null){
                result = "3";
            }else {
                int update_result_module = userService.setController(module_id, user_id, type);
                if (update_result_module > 0)
                    result = "1";
                else
                    result = "0";
                return result;
            }
        }else{
            result = "0";
            return result;
        }
        return result;
    }

    /**
     * 设置版块管理员显示模块信息
     * @param model
     * @return
     */
    @RequestMapping(value = "admin/user/setController_forum")
    public  String setController_forum_init(Model model){
        List<Forum> forumList = moduleService.getForumList();
        model.addAttribute("forum_list",forumList);
        return "/admin/user/setController_forum";
    }

    /**
     * 设置模块管理员显示版块信息
     * @param model
     * @return
     */
    @RequestMapping(value = "admin/user/setController_module")
    public  String setController_module_init(Model model){
        List<Module> moduleList = moduleService.getModuleAll();
        model.addAttribute("module_list",moduleList);
        return "/admin/user/setController_module";
    }
}
