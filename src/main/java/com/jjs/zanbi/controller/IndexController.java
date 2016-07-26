package com.jjs.zanbi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2016/7/26.
 */

@Controller
public class IndexController {


    @RequestMapping("test")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("administration/login");
        return mv;

    }

    @RequestMapping("main")
    public ModelAndView main() {
        ModelAndView mv = new ModelAndView("administration/main");
        return mv;

    }
}
