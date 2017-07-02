package org.choice.web;

import org.choice.entity.Article;
import org.choice.entity.ArticleType;
import org.choice.entity.Forum;
import org.choice.entity.Module;
import org.choice.service.ArticleService;
import org.choice.service.CommonService;
import org.choice.utils.JSONUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by user on 2017/4/20.
 */
@Controller
@RequestMapping("/")
public class ArticleController {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommonService commonService;

    /**
     * 后台主题列表
     * @param model
     * @param article
     * @return
     */
    @RequestMapping(value="admin/article/list")
    public String list(Model model, Article article){
        int needId = article.getNeedId();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String startTimeFromWeb = article.getStartTime();
        String endTimeFromWeb   = article.getEndTime();
        String titleKey = article.getTitleKey();
        Date now = new Date();
        //获取列表页
        if(needId == 0 && startTimeFromWeb==null && endTimeFromWeb==null && titleKey==null){
            List<Article> articleList = articleService.getArticleList();
            model.addAttribute("articleList",articleList);
        }
        else{
            //如果搜索时间为空，则默认开始时间为最小时间，即1970年，最大时间为系统当前时间，即查询所有帖子
            if(startTimeFromWeb.equals("")){
                startTimeFromWeb = dateFormat.format(0);
            }
            if(endTimeFromWeb.equals("")){
                endTimeFromWeb = dateFormat.format(now.getTime());
            }
            try{
                Long startTime = dateFormat.parse(" "+ startTimeFromWeb +" 00:00:00.000 ").getTime();
                Long endTime = dateFormat.parse(" "+ endTimeFromWeb +" 00:00:00.000 ").getTime() ;
                List<Article> articleList = articleService.getArticleByNeeds(needId,startTime,endTime,titleKey);
                model.addAttribute("articleList",articleList);
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        return "admin/article/article_list";

    }

    /**
     * 后台主题管理
     * @param model
     * @param article
     * @return
     */
    @RequestMapping(value="admin/article/control")
    public String control(Model model, Article article){
        Article article_detail = articleService.getArticleById(article.getArticle_id());
        article_detail = articleService.setArticleFromIdToName(article_detail);
        model.addAttribute("article_detail",article_detail);

        List<ArticleType> articleTypeList = articleService.getArticleTypeList();
        List<Forum>  forumList = articleService.getAtricleForumList();
        int forumId = article_detail.getArticle_forum_id();
        List<Module> moduleList = articleService.getAtricleModuleList(forumId);

        model.addAttribute("articleTypeList",articleTypeList);
        model.addAttribute("forumList",forumList);
        model.addAttribute("moduleList",moduleList);
        return "admin/article/article_control";
    }

    //controller将数据封装成json返回

    /**
     * 后台主题编辑
     * @param response
     * @param request
     */
    @RequestMapping(value="admin/article/edit", method = RequestMethod.POST)
    public void edit(HttpServletResponse response, HttpServletRequest request){
        try{
            Long article_id             = Long.valueOf(request.getParameter("article_id"));
            String article_title        = request.getParameter("article_title");
            int article_type_id         = Integer.valueOf(request.getParameter("article_type_id"));
            int article_module_name_id  = Integer.valueOf(request.getParameter("article_module_name_id"));
            int article_forum_name__id  = Integer.valueOf(request.getParameter("article_forum_name__id"));
            int resultStatus = articleService.updateArticle(article_title,article_type_id,article_forum_name__id,article_module_name_id);
            if(resultStatus > 0)
                renderData(response,"success");
            else
                renderData(response,"error");
        }catch(Exception e){
            logger.info("editError: ",e);
        }
    }


    /**
     * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
     *
     * @param response
     * @param data
     */
    private void renderData(HttpServletResponse response, String data) {
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
            printWriter.print(data);
        } catch (IOException ex) {
            logger.info(ArticleController.class.getName(), ex);
        } finally {
            if (null != printWriter) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }


    /**
     * 前台发表一篇主题
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/newarticle",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public  String newarticle(@RequestBody String result, HttpServletRequest request){
        String article_title = request.getParameter("article_title_new");
        String article_content = request.getParameter("article_content");
        long article_author_id = Long.valueOf(request.getParameter("article_author_id"));
        int forum_id = Integer.valueOf(request.getParameter("forum_id"));
        int module_id = Integer.valueOf(request.getParameter("module_id"));
        int insertResult = articleService.insertOneArticle(article_title,article_content,article_author_id,forum_id,module_id);
        if (insertResult > 0)
            result = "1";
        else
            result = "0";
        return result;
    }


    /**
     * 前台文章点赞、收藏、转发等日志记录
     * @param typeId
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/type{typeId}/update",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public  String articleCollect(@PathVariable("typeId") Integer typeId, @RequestBody String result,
                                  HttpServletRequest request){
        logger.info("typeId:" + typeId);
        long uid = Long.valueOf(request.getParameter("user_info_id"));
        long aid = Long.valueOf(request.getParameter("article_id"));
        if (typeId != 3){
            // 不是转发操作
            Article articleIn = articleService.articleColletCheck(aid, uid, typeId);
            if (articleIn != null){
                result = ""+typeId;
            }else{
                int insertResult = articleService.articleCollet(aid, uid, typeId);
                if (insertResult > 0)
                    result = "9";
                else
                    result = "8";
            }
        }else{
            int insertResult = articleService.articleCollet(aid, uid, typeId);
            if (insertResult > 0)
                result = "9";
            else
                result = "8";
        }
        return result;
    }


    /**
     * 批量删除主题
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/deleteArticles",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deleteArticleBatchs(@RequestBody String result, HttpServletRequest request){
        String ids = request.getParameter("article_ids");
        String[] article_ids_str = ids.split(",");
        long[] article_ids = new long[article_ids_str.length];
        for(int i = 0;i <article_ids_str.length; i++){
            article_ids[i] = Long.valueOf(article_ids_str[i]);
        }
        try{
            commonService.deleteBatchs("article", "article_id", article_ids);
            result = "1";
            return result;
        }catch (Exception e){
            logger.info("后台批量删除主题错误，原因：" + e);
            result = "0";
            return result;
        }
    }
}
