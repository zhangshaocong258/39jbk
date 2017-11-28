package com.szl.controller;

import com.szl.util.CookieUtil;
import com.szl.service.MyService;
import com.szl.util.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by zsc on 2017/1/18.
 * Pattern.quote
 * 倒排列表插入两次
 */
@Controller
@SessionAttributes("forwards")
public class MyController {
    private static String modelOutPath = "/model/xinglinyuan.model";
    private static String dataInPath = "/model/train.arff";

    @Autowired
    private MyService myService;

    @RequestMapping("/")
    public String info() {
        return "information";
    }


    /**
     * @param request
     * @return
     * @RequestParam(value="q")中value要和jsp的input的name(只有name，id无所谓)相同，方法为get，post不显示
     */
    @RequestMapping("/select")
    public ModelAndView selectSym(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam(value = "gender") String gender,
                                  @RequestParam(value = "age") String age,
                                  @RequestParam(value = "profession") String profession) {
        ModelAndView mav = new ModelAndView("select");
        mav.addObject("gender", gender);
        mav.addObject("age", age);
        mav.addObject("profession", profession);
//        System.out.println("gender " + gender + " age " + age + "profession " + profession);
        return mav;
    }

    @RequestMapping("/result")
    public ModelAndView result(HttpServletRequest request, HttpServletResponse response,
                               @RequestParam(value = "gender") String gender,
                               @RequestParam(value = "age") String age,
                               @RequestParam(value = "profession") String profession,
                               @RequestParam(value = "zhengzhuang") String[] zhengzhuang,
                               @RequestParam(value = "shezhi") String[] shezhi,
                               @RequestParam(value = "shetai") String[] shetai,
                               @RequestParam(value = "mai") String[] mai) {
        ModelAndView mav = new ModelAndView("result");
        mav.addObject("gender", gender);
        mav.addObject("age", age);
        mav.addObject("profession", profession);
        mav.addObject("zhengzhuang", zhengzhuang);
        mav.addObject("shezhi", shezhi);
        mav.addObject("shetai", shetai);
        mav.addObject("mai", mai);
//        for (String str : zhengzhuang) {
//            System.out.println("zhengzhuang " + str);
//        }
//        for (String str : shezhi) {
//            System.out.println("shezhi " + str);
//        }
//        for (String str : shetai) {
//            System.out.println("shetai " + str);
//        }
//        for (String str : mai) {
//            System.out.println("mai " + str);
//        }
        try {
            List<String> zhengzhuangList = Arrays.asList(zhengzhuang);
            List<String> shezhiList = Arrays.asList(shezhi);
            List<String> shetaiList = Arrays.asList(shetai);
            List<String> maiList = Arrays.asList(mai);
            File modelFile = new File(MyController.class.getClassLoader().getResource("../../model/xinglinyuan.model").getPath());
            File trainFile = new File(MyController.class.getClassLoader().getResource("../../model/train.arff").getPath());
            File tempFile = new File(MyController.class.getClassLoader().getResource("../../model/temp.arff").getPath());
            File formatFile = new File(MyController.class.getClassLoader().getResource("../../model/format.arff").getPath());
            System.out.println("modelFile " + modelFile.getAbsolutePath());
            System.out.println("trainFile " + trainFile.getAbsolutePath());
            System.out.println("tempFile " + tempFile.getAbsolutePath());
            System.out.println("formatFile " + formatFile.getAbsolutePath());

            Repository.train(modelFile, trainFile, false);
            Repository.predict(modelFile,tempFile,formatFile,zhengzhuangList, shezhiList, shetaiList, maiList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mav;
    }

    /**
     * setCookie 0
     *
     * @return
     * @RequestParam(value="q")中value要和jsp的input的name(只有name，id无所谓)相同，方法为get，post不显示
     */
    @RequestMapping("/nav0")
    public String nav0(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attributes, @RequestParam(value = "q") String questionStr) {


//        Cookie[] cookies = request.getCookies();
//        if (cookies == null) {
//            System.out.println("没有cookie==============");
//        } else {
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals("zscNav")) {
//                    System.out.println("原值为:" + cookie.getValue());
//                    cookie.setValue("0");
////                    cookie.setPath("/");
//                    cookie.setMaxAge(60 * 60);// 设置为60min
//                    response.addCookie(cookie);
//                    break;
//                }
//            }
//        }
        if (CookieUtil.getCookie(request, "zscNav") == null) {
            Cookie cookie = new Cookie("zscNav", "0");
            cookie.setMaxAge(60);// 设置为60min
            response.addCookie(cookie);
        } else {
            Cookie cookie = CookieUtil.getCookie(request, "zscNav");
            cookie.setValue("0");
            cookie.setMaxAge(60);// 设置为60min
            response.addCookie(cookie);
        }


        attributes.addAttribute("type", "question");
        attributes.addAttribute("q", questionStr);
        attributes.addAttribute("redirect", "0");

        return "redirect:/search";
    }

    @RequestMapping("/nav1")
    public String nav1(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attributes, @RequestParam(value = "q") String questionStr) {
//        Cookie[] cookies = request.getCookies();
//        if (cookies == null) {
//            System.out.println("没有cookie==============");
//        } else {
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals("zscNav")) {
//                    System.out.println("原值为:" + cookie.getValue());
//                    cookie.setValue("1");
////                    cookie.setPath("/");
//                    cookie.setMaxAge(60);// 设置为60min
//                    response.addCookie(cookie);
//                    break;
//                }
//            }
//        }
        if (CookieUtil.getCookie(request, "zscNav") == null) {
            Cookie cookie = new Cookie("zscNav", "1");
            cookie.setMaxAge(60);
            response.addCookie(cookie);
        } else {
            Cookie cookie = CookieUtil.getCookie(request, "zscNav");
            cookie.setValue("1");
            cookie.setMaxAge(60);
            response.addCookie(cookie);
        }
        attributes.addAttribute("type", "question");
        attributes.addAttribute("q", questionStr);
        attributes.addAttribute("redirect", "1");
        return "redirect:/search";
    }
}
