package com.myproject.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
    @RequestMapping("/")
    public String index(){
        return "redirect:index.html";
    }
}
