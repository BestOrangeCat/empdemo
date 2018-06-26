package com.neuedu.controller;
import com.neuedu.entity.User;
import com.neuedu.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping(value = {"/user"})
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping(value = {"/registView"})
    public String registView(){
        return "regist";
    }
    @RequestMapping(value = {"/checkUsername"})
    public void checkUser(String username, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        User user = userService.getUserByUsername(username);
        if(user==null){
            out.print(true);
        }else {
            out.print(false);
        }
        out.close();
    }
}
