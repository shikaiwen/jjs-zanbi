package com.jjs.zanbi.utils;

import com.github.pagehelper.PageInfo;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/7/27.
 */
public class WebUtils {

    static ScriptEngineManager manager = new ScriptEngineManager() ;
    static ScriptEngine engine = manager.getEngineByName("js");

    public static Integer getSubMemByJs(String expression){

        try {
            Object obj = engine.eval(expression);

            System.out.println(obj);
            return (Integer) obj;

        } catch (ScriptException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static HttpSession getSession(){
        ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpSession session = sra.getRequest().getSession();
        return session;
    }

    public static HttpServletRequest getRequest(){
        ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest req = sra.getRequest();
        return req;
    }


    public static HttpServletResponse getResponse(){
        ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return sra.getResponse();
    }


    public static Map getEasyUiPageData(PageInfo pageInfo){
        Map map = new LinkedHashMap();
        map.put("total", pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }

}
