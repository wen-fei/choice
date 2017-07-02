package org.choice.web;

import org.choice.entity.UserInfo;
import org.choice.service.UserService;
import org.choice.utils.CodeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;


/**
 * Created by user on 2017/5/5.
 */
@Controller
@RequestMapping("/app/login")
@SessionAttributes("UserSession")
public class LoginController {


    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    //用户登录
    @RequestMapping("/login")
    public String login(Model model, UserInfo userInfo_, HttpSession session){
        String user_name = userInfo_.getUser_name();
        String user_password = userInfo_.getPassword();
        UserInfo userInfo = userService.getLoginInfo(user_name,CodeUtils.EncodeByMd5(user_password));
        if(userInfo == null){
            model.addAttribute("registResult","用户名或密码错误");
            return "/error/regist_result";
        }else{
            session.setAttribute("UserInfo_session",userInfo);
            return "redirect: /app/index";
        }


    }

    //用户注册
    @RequestMapping("/regist")
    public String regist(Model model, UserInfo userInfo, HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String userName = request.getParameter("user_name_regist");
        String password = request.getParameter("user_password");
        String user_email = request.getParameter("user_email");
        int result = userService.insertOneUser(userName, CodeUtils.EncodeByMd5(password),
                user_email);
        if (result > 0){
            model.addAttribute("registResult", "注册成功，马上返回首页");
            return "/error/regist_result";
        }
        else{
            model.addAttribute("registResult", "注册失败，请重新注册");
            return "/error/regist_result";
        }

    }

    /**
     * ajax检查用户名是否使用
     *
     * @param user_name_regist
     * @return
     */
    @RequestMapping(value = "/{user_name_regist}/checkUsername",
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String checkUsername(@PathVariable String user_name_regist,
                                @RequestBody String result) {
        UserInfo userInfo = userService.checkUserName(user_name_regist);
        if (userInfo == null) {
            result = "1";
        } else {
            result = "0";
        }
        return result;
    }

    //用户退出登录
    @RequestMapping(value="/logout",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String logout(Model model, HttpSession session){
        session.removeAttribute("UserInfo_session");
        return "1";
    }


    @RequestMapping(value="/loginview")
    public String loginView(Model model){
        return "/app/user/login";
    }

    @RequestMapping(value="/registview")
    public String registView(Model model){
        return "/app/user/regist";
    }
}
