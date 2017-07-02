package org.choice.utils;

import org.apache.tools.ant.taskdefs.Java;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.regex.Pattern;

import static java.lang.Math.pow;
import static java.lang.Math.log;

/**
 * Created by user on 2017/4/26.
 */
public class MLUtils {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 帖子得分平滑处理
     * 处理成分段函数，使小的值更小，大的值增长更慢
     * @param score
     * @return
     */
    public static double  final_score( double score){
        double result = 0;
        if(score<20){
            result = pow(score, 2)/20;
        }
        else if (20<=score && score <=200)
            result = score;
        else{
            result=200*log(score)+200-200*log(200);
        }
        return result;
    }

    public static String Html2Text(String inputString){
        String htmlStr = inputString; //含html标签的字符串
        String textStr ="";
        java.util.regex.Pattern p_script;
        java.util.regex.Matcher m_script;
        java.util.regex.Pattern p_style;
        java.util.regex.Matcher m_style;
        java.util.regex.Pattern p_html;
        java.util.regex.Matcher m_html;
        java.util.regex.Pattern p_char;
        java.util.regex.Matcher m_char;

        try{
            String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> }
            String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> }
            String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式
            String regEx_char = "\\s*|\\t|\\r|\\n";   //去处空格换行回车

            p_script = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);
            m_script = p_script.matcher(htmlStr);
            htmlStr = m_script.replaceAll(""); //过滤script标签

            p_style = Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE);
            m_style = p_style.matcher(htmlStr);
            htmlStr = m_style.replaceAll(""); //过滤style标签

            p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
            m_html = p_html.matcher(htmlStr);
            htmlStr = m_html.replaceAll(""); //过滤html标签

            p_char = Pattern.compile((regEx_char),Pattern.CASE_INSENSITIVE);
            m_char = p_char.matcher(htmlStr);
            htmlStr = m_char.replaceAll("");

            textStr = htmlStr;
        }catch(Exception e){
            System.out.println("neiNewsAction -----"+"Html2Text: " + e.getMessage());
        }
        return textStr;//返回文本字符串
    }


}
