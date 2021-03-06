package com.szl.controller;

import com.szl.domain.Discase;
import com.szl.domain.User;
import com.szl.util.CookieUtil;
import com.szl.service.MyService;
import com.szl.util.DiseaseInf;
import com.szl.util.Repository;
import com.szl.util.WordEntry;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.DecimalFormat;
import java.util.*;

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
    public static final String loginSession = "loginSession";

    @Autowired
    private MyService myService;


    @ResponseBody
    @RequestMapping("/add")
    public String add(@RequestParam("info") String info,
                      @RequestParam("medicalHis") String medicalHis,
                      @RequestParam("examine") String examine,
                      @RequestParam("disease") String disease) {
        System.out.println("进入addd");
        Discase discase = new Discase(1, info, medicalHis, examine, disease);
        myService.insertDiscase(discase);
        return "true";
    }


    @RequestMapping("/newcase")
    public String newcase(HttpServletRequest request) {
        return "newcase";
    }

    @ResponseBody
    @RequestMapping("/selectTest")
    public String selectTest(@RequestParam(value = "gender") String gender,
                             @RequestParam(value = "age") String age,
                             @RequestParam(value = "profession") String profession,
                             @RequestParam(value = "zhengzhuang") String[] zhengzhuang,
                             @RequestParam(value = "shezhi") String[] shezhi,
                             @RequestParam(value = "shetai") String[] shetai,
                             @RequestParam(value = "mai") String[] mai) {
        System.out.println("进入ssssss" + zhengzhuang.length);
        if (zhengzhuang.length == 0) {
            return "zhengzhuang";
        } else if (shezhi.length == 0) {
            return "shezhi";
        } else if (shetai.length == 0) {
            return "shetai";
        } else if (mai.length == 0) {
            return "mai";
        } else {
            return "true";
        }
    }


    /**
     * 必须要有@ResponseBody
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/train")
    public String train() {
        try {
            List<Discase> discaseList = myService.selectAllDiscase();
            File modelFile = new File(MyController.class.getClassLoader().getResource("../../model/xinglinyuan.model").getPath());
            File trainFile = new File(MyController.class.getClassLoader().getResource("../../model/train.arff").getPath());
            File formatFile = new File(MyController.class.getClassLoader().getResource("../../model/format.arff").getPath());
            Repository.train(modelFile, trainFile, formatFile, discaseList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "true";
    }


    @ResponseBody
    @RequestMapping(value = "/discaseAjax", produces = {"text/html;charset=UTF-8;"})
    public String discaseAjax() {
        System.out.println("discaseAjax");
        List<Discase> discaseList = myService.selectAllDiscase();
        int size = discaseList.size();
        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < size; i++) {
            JSONObject jsonObject = new JSONObject();
            Discase discase = discaseList.get(i);
            jsonObject.put("id", discase.getId());
            jsonObject.put("info", discase.getInfo());
            jsonObject.put("medicalHis", discase.getMedicalHis());
            jsonObject.put("examine", discase.getExamine());
            jsonObject.put("disease", discase.getDisease());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }


    @RequestMapping("/discase")
    public ModelAndView discase(HttpServletRequest request) {
        List<Discase> discaseList = myService.selectAllDiscase();
        ModelAndView mav = new ModelAndView("discase");
        mav.addObject("discases", discaseList);
        return mav;
    }


    /**
     * 进行修改或者删除
     * 修改后用于重定向，隐藏id，以便修改
     *
     * @param request
     * @param id
     * @param act
     * @return
     */
    @ResponseBody
    @RequestMapping("/handler")
    public String handler(HttpServletRequest request,
                          @RequestParam("id") int id,
                          @RequestParam("info") String info,
                          @RequestParam("medicalHis") String medicalHis,
                          @RequestParam("examine") String examine,
                          @RequestParam("disease") String disease,
                          @RequestParam("act") String act) {
        if (act.equals("edit")) {
            Discase discase = myService.selectDiscaseById(id);
            discase.setInfo(info);
            discase.setMedicalHis(medicalHis);
            discase.setExamine(examine);
            discase.setDisease(disease);
            myService.updateDiscase(discase);
            return "edit";
        } else {
            myService.deleteDiscaseById(id);
            return "del";
        }

    }


//    @ResponseBody
//    @RequestMapping("/delAjax")
//    public String delAjax(HttpServletRequest request,
//                          @RequestParam("id") int id,
//                          @RequestParam("info") String info,
//                          @RequestParam("medicalHis") String medicalHis,
//                          @RequestParam("examine") String examine,
//                          @RequestParam("disease") String disease) {
//        System.out.println("delAjax " + id);
//        myService.deleteDiscaseById(id);
//        return "true";
//    }
//
//
//    @ResponseBody
//    @RequestMapping("/editAjax")
//    public String editAjax(HttpServletRequest request,
//                           @RequestParam("id") int id,
//                           @RequestParam("info") String info,
//                           @RequestParam("medicalHis") String medicalHis,
//                           @RequestParam("examine") String examine,
//                           @RequestParam("disease") String disease) {
//        System.out.println("editAjax");
//        Discase discase = myService.selectDiscaseById(id);
//        discase.setInfo(info);
//        discase.setMedicalHis(medicalHis);
//        discase.setExamine(examine);
//        discase.setDisease(disease);
//        myService.updateDiscase(discase);
//        return "true";
//    }

    /**
     * 判断权限
     *
     * @param request
     * @return
     */
    @RequestMapping("/message")
    public ModelAndView message(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(loginSession);
        ModelAndView mav = new ModelAndView("message");
        mav.addObject("user", user);
        if (user.getUserName().equals("admin")) {
            mav.addObject("privilege", "admin");
        } else {
            mav.addObject("privilege", "user");
        }
        return mav;
    }


    @RequestMapping("/exit")
    public String exit(HttpServletRequest request) {
        request.getSession().removeAttribute(loginSession);
        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        if (request.getSession().getAttribute(loginSession) != null) {
            System.out.println("已登录");
            return "redirect:/information";
        }
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    /**
     * 用于判断用户名是否存在
     *
     * @param username
     * @param password
     * @param confirmPassword
     * @return
     */
    @ResponseBody
    @RequestMapping("/registerTest")
    public String registerTest(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("confirmPassword") String confirmPassword) {
        return myService.register(username, password, confirmPassword);
    }

    @ResponseBody
    @RequestMapping("/loginTest")
    public String loginTest(HttpServletRequest request, @RequestParam("username") String username,
                            @RequestParam("password") String password,
                            @RequestParam("remember_me") String remember_me) {
        User user = myService.login(username, password);
        if (user != null) {
            request.getSession().setAttribute(loginSession, user);
            return "true";
        }
        return "false";
    }

    @RequestMapping("/information")
    public String info(HttpServletRequest request) {
        if (request.getSession().getAttribute(loginSession) == null) {
            System.out.println("未登录");
            return "403";
        }
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
        if (request.getSession().getAttribute(loginSession) == null) {
            System.out.println("未登录");
            return new ModelAndView("403");
        }
        ModelAndView mav = new ModelAndView("select");
        mav.addObject("gender", gender);
        mav.addObject("age", age);
        mav.addObject("profession", profession);
//        System.out.println("gender " + gender + " age " + age + "profession " + profession);
        return mav;
    }


    @ResponseBody
    @RequestMapping(value = "/resultAjax", produces = {"text/html;charset=UTF-8;"})
    public String resultAjax(@RequestParam(value = "zhengzhuang") String[] zhengzhuang,
                                   @RequestParam(value = "shezhi") String[] shezhi,
                                   @RequestParam(value = "shetai") String[] shetai,
                                   @RequestParam(value = "mai") String[] mai) {
        JSONArray jsonArray = new JSONArray();
        try {
            Set<WordEntry> queryResult;
            List<String> zhengzhuangList2 = new ArrayList<String>();
            Set<String> zhengzhuangList2Set = new HashSet<String>();
            List<String> zhengzhuangList = Arrays.asList(zhengzhuang);
            List<String> shezhiList = Arrays.asList(shezhi);
            List<String> shetaiList = Arrays.asList(shetai);
            List<String> maiList = Arrays.asList(mai);
            File modelFile = new File(MyController.class.getClassLoader().getResource("../../model/xinglinyuan.model").getPath());
            File tempFile = new File(MyController.class.getClassLoader().getResource("../../model/temp.arff").getPath());
            File formatFile = new File(MyController.class.getClassLoader().getResource("../../model/format.arff").getPath());

            List<DiseaseInf> results = new ArrayList<DiseaseInf>();
            results = Repository.predict(modelFile, tempFile, formatFile, zhengzhuangList, shezhiList, shetaiList, maiList);
            JSONObject resultJson = new JSONObject();
            JSONObject resultJsonPar = new JSONObject();
            for (int i = 0; i < results.size(); i++) {
                JSONObject temp = new JSONObject();
                temp.put("name", results.get(i).getName());
                temp.put("description", results.get(i).getDescription());
                temp.put("pro", results.get(i).getPro());
                resultJson.put("results" + String.valueOf(i), temp);
            }
            resultJsonPar.put("results", resultJson);
            jsonArray.add(resultJsonPar);


            JSONObject zhengzhuangJson = new JSONObject();
            JSONObject zhengzhuangJsonPar = new JSONObject();
            for (int i = 0; i < zhengzhuangList.size(); i++) {
                zhengzhuangJson.put("existZhengzhuangs" + i, zhengzhuangList.get(i));
            }
            zhengzhuangJsonPar.put("existZhengzhuangs", zhengzhuangJson);
            jsonArray.add(zhengzhuangJsonPar);
            
            

//            JSONObject shezhiJson = new JSONObject();
//            JSONObject shezhiJsonPar = new JSONObject();
//            for (int i = 0; i < shezhiList.size(); i++) {
//                shezhiJson.put("shezhis" + i, shetaiList.get(i));
//            }
//            shezhiJsonPar.put("shezhis", shezhiJson);
//            jsonArray.put(shezhiJsonPar);
//
//
//            JSONObject shetaiJson = new JSONObject();
//            JSONObject shetaiJsonPar = new JSONObject();
//            for (int i = 0; i < shetaiList.size(); i++) {
//                shezhiJson.put("shetais" + i, shetaiList.get(i));
//            }
//            shezhiJsonPar.put("shetais", shetaiJson);
//            jsonArray.put(shetaiJsonPar);
//
//
//            JSONObject maiJson = new JSONObject();
//            JSONObject maiJsonPar = new JSONObject();
//            for (int i = 0; i < maiList.size(); i++) {
//                shezhiJson.put("mais" + i, maiList.get(i));
//            }
//            shezhiJsonPar.put("mais", maiJson);
//            jsonArray.put(maiJsonPar);


            Set<String> zhengzhuangList1Set = new HashSet<String>();
            zhengzhuangList1Set.addAll(zhengzhuangList);

            //添加相关症状
            for (String str : zhengzhuangList) {
                queryResult = myService.distance(str);
                int count = 10;
                for (WordEntry disease : queryResult) {
                    count--;
                    if (count > 0) {
                        if (!zhengzhuangList1Set.contains(disease.name)) {
                            if (!disease.name.equals("恶心")) {
                                System.out.println(disease.name);
                                zhengzhuangList2Set.add(disease.name);
                            }
                        }
                    } else {
                        break;
                    }
                }
            }
            zhengzhuangList2.addAll(zhengzhuangList2Set);
//            mav.addObject("inexistZhengzhuangs", zhengzhuangList2);

            JSONObject zhengzhuang2Json = new JSONObject();
            JSONObject zhengzhuang2JsonPar = new JSONObject();
            for (int i = 0; i < zhengzhuangList2.size(); i++) {
                zhengzhuang2Json.put("inexistZhengzhuangs" + i, zhengzhuangList2.get(i));
            }
            zhengzhuang2JsonPar.put("inexistZhengzhuangs", zhengzhuang2Json);
            jsonArray.add(zhengzhuang2JsonPar);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray.toString();
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
        if (request.getSession().getAttribute(loginSession) == null) {
            System.out.println("未登录");
            return new ModelAndView("403");
        }
        ModelAndView mav = new ModelAndView("result");
        mav.addObject("gender", gender);
        mav.addObject("age", age);
        mav.addObject("profession", profession);
        List<DiseaseInf> results = new ArrayList<DiseaseInf>();
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
            Set<WordEntry> queryResult = new HashSet<WordEntry>();
            List<String> zhengzhuangList2 = new ArrayList<String>();
            Set<String> zhengzhuangList2Set = new HashSet<String>();
            List<String> zhengzhuangList = Arrays.asList(zhengzhuang);
            List<String> shezhiList = Arrays.asList(shezhi);
            List<String> shetaiList = Arrays.asList(shetai);
            List<String> maiList = Arrays.asList(mai);
            File modelFile = new File(MyController.class.getClassLoader().getResource("../../model/xinglinyuan.model").getPath());
            File tempFile = new File(MyController.class.getClassLoader().getResource("../../model/temp.arff").getPath());
            File formatFile = new File(MyController.class.getClassLoader().getResource("../../model/format.arff").getPath());
//            System.out.println("modelFile " + modelFile.getAbsolutePath());
//            System.out.println("trainFile " + trainFile.getAbsolutePath());
//            System.out.println("tempFile " + tempFile.getAbsolutePath());
//            System.out.println("formatFile " + formatFile.getAbsolutePath());

//            Repository.train(modelFile, trainFile, false);
            results = Repository.predict(modelFile, tempFile, formatFile, zhengzhuangList, shezhiList, shetaiList, maiList);
            mav.addObject("results", results);
            mav.addObject("existZhengzhuangs", zhengzhuangList);
            mav.addObject("shezhis", shezhiList);
            mav.addObject("shetais", shetaiList);
            mav.addObject("mais", maiList);
            Set<String> zhengzhuangList1Set = new HashSet<String>();
            zhengzhuangList1Set.addAll(zhengzhuangList);

            //添加相关症状
            for (String str : zhengzhuangList) {
                queryResult = myService.distance(str);
                int count = 10;
                for (WordEntry disease : queryResult) {
                    count--;
                    if (count > 0) {
                        if (!zhengzhuangList1Set.contains(disease.name)) {
                            if (!disease.name.equals("恶心")) {
                                System.out.println(disease.name);
                                zhengzhuangList2Set.add(disease.name);
                            }                        }
                    } else {
                        break;
                    }
                }
            }
            zhengzhuangList2.addAll(zhengzhuangList2Set);
            mav.addObject("inexistZhengzhuangs", zhengzhuangList2);


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

}
