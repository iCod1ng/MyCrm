package com.bb.controller;

import com.bb.entity.PageBean;
import com.bb.entity.User;
import com.bb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/User")
public class UserController {
    @Autowired
    private  IUserService userService;

    Integer pageSize = 5;
    Integer pageNumber = 1;

    @RequestMapping("/index")
    public String index(){
        return "login";
    }

    @RequestMapping(value = "/logincheck",method = RequestMethod.POST)
    public String loginCheck(@RequestParam Map<String,Object> params,Model model,HttpServletRequest request){
        System.out.println("=====");
        model.addAllAttributes(params);

        String userName = (String)params.get("userName");
        String password = (String)params.get("password");
        System.out.println("userName"+userName);
        System.out.println("password"+password);
        boolean isValidUser = userService.hasMatchUser(userName,password);
        System.out.println("===="+isValidUser+"=====");
        if(!isValidUser){
            String errorWords = "用户名或密码错误";
            model.addAttribute("error",errorWords);
            return "login";

        }else {
            System.out.println("logInPage"+pageNumber);
            User user = userService.findUserByName(userName);
            System.out.println(user.getUserName());
            user.setLastVisit(new Date());
            user.setLastIp(request.getLocalAddr());
            userService.loginSuccess(user);
            pageNumber = 1;
            PageBean<User> pageBean = userService.searchPage(pageNumber,pageSize,params);

            model.addAttribute("pageBean",pageBean);
            return "logSuccess";
        }
    }

    @PostMapping("/search")
    public String search(@RequestParam Map<String,Object> params,Model model){

        model.addAllAttributes(params); //数据回显，用于分页查询
        String pageNumberStr = (String)params.get("currentPage");
        if(pageNumberStr==null){
            pageNumber = 1;
        }else {
            pageNumber = Integer.parseInt(pageNumberStr);
        }
        System.out.println("====page:"+pageNumber);
        PageBean<User> pageBean = userService.searchPage(pageNumber,pageSize,params);
        model.addAttribute("pageBean",pageBean);
        return "logSuccess";
    }

    @GetMapping("/update")
    public void updateCredit(HttpServletRequest request){
        long credit = Long.parseLong(request.getParameter("credit"));

    }

    @PostMapping("/isExist")
    public void isExist(HttpServletRequest request,HttpServletResponse response) throws  IOException{
        String username = request.getParameter("username");
        System.out.println("==="+username);
        Boolean isExist = userService.isExistUserName(username);
        response.getWriter().write("{\"isExist\":"+isExist+"}");
    }

    @RequestMapping("/get/{id}")
    @ResponseBody
    public User info(@PathVariable Long id){
        return userService.selectUser(id);
    }

    @RequestMapping("/save")
    @ResponseBody
    public void save(HttpServletRequest request){
        long id = Long.parseLong(request.getParameter("userId"));
        long credits = Long.parseLong(request.getParameter("credit"));
        userService.updateCredits(id,credits);
    }


}
