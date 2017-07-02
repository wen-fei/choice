package org.choice.web;

import org.choice.entity.Article;
import org.choice.entity.Reply;
import org.choice.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by user on 2017/5/2.
 */
@Controller
@RequestMapping("/")
public class ReplyController {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private UserService userService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private CommonService commonService;

    /**
     * 后台回复帖子列表
     * @param model
     * @return
     */
    @RequestMapping("admin/reply/list")
    public String replyList(Model model){
        List<Reply> replyList = replyService.getReplyList();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //设置一些信息转换
        for (Reply reply: replyList){
            //时间转换
            reply.setReply_time_date(dateFormat.format(reply.getReply_time()));
            //用户信息
            reply.setUserInfo(userService.getUserInfoById(reply.getReply_author_id()));
            //主题信息和板块信息
            Article articleInfo = articleService.getArticleById(reply.getReply_article_id());
            articleService.setArticleFromIdToName(articleInfo);
            articleInfo.setArticle_module_name(moduleService.getModuleInfoById(articleInfo.getArticle_module_id()).getModule_name());
            reply.setArticleInfo(articleInfo);

        }

        model.addAttribute("replyList",replyList);
        return "admin/reply/reply_list";
    }

    /**
     * 前台发表一篇回复
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/newreply",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public  String newreply(@RequestBody String result, HttpServletRequest request){
        String reply_content = request.getParameter("reply_content");
        long reply_author_id = Long.valueOf(request.getParameter("reply_author_id"));
        long article_id = Long.valueOf(request.getParameter("article_id"));
        int insertResult = replyService.insertOneReply(article_id,reply_content,reply_author_id);
        if (insertResult > 0)
            result = "1";
        else
            result = "0";
        return result;
    }


    /**
     * 后台批量删除回复
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/deleteReplys", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deleteReplyBatchs(@RequestBody String result, HttpServletRequest request) {
        String ids = request.getParameter("reply_ids");
        String[] reply_ids_str = ids.split(",");
        long[] reply_ids = new long[reply_ids_str.length];
        for (int i = 0; i < reply_ids_str.length; i++) {
            reply_ids[i] = Long.valueOf(reply_ids_str[i]);
        }
        try {
            commonService.deleteBatchs("reply", "reply_id", reply_ids);
            result = "1";
            return result;
        } catch (Exception e) {
            logger.info("后台批量删除回复错误，原因：" + e);
            result = "0";
            return result;
        }
    }
}
