package com.szl.service;

import com.szl.domain.Rule;
import com.szl.dao.*;
import com.szl.util.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.File;

/**
 * Created by zsc on 2017/1/18.
 * 构造方法在@PostConstruct前执行
 * fQuestions和rQuestions是为了构建fQuestionsMap和rQuestionsMap，rQuestionsMap是用来查询，最终得到有序的结果url序号，
 * 然后通过查询fQuestionsMap得到最终的url信息，可以将rQuestionsMap和fQuestionsMap整合，节省空间
 */
@Service
public class MyService implements ServiceInterface {
    private static final String synonymDicPath = "同义词new.txt";

//    private List<Forward> fQuestions;
//    private List<Reverse> rQuestions;
//    private Map<String, Reverse> rQuestionsMap = new HashMap<String, Reverse>();
//    private Map<String, Forward> fQuestionsMap = new HashMap<String, Forward>();
//
//    private List<Forward> fPeoples;
//    private List<Reverse> rPeoples;
//    private Map<String, Reverse> rPeoplesMap = new HashMap<String, Reverse>();
//    private Map<String, Forward> fPeoplesMap = new HashMap<String, Forward>();
//
//    private List<Forward> fTopics;
//    private List<Reverse> rTopics;
//    private Map<String, Reverse> rTopicsMap = new HashMap<String, Reverse>();
//    private Map<String, Forward> fTopicsMap = new HashMap<String, Forward>();

    @Autowired
    private RuleDao ruleDao;



    @PostConstruct
    public void init() {
        System.out.println("@PostConstruct方法被调用");
        File file = new File(MyService.class.getClassLoader().getResource("../../model/同义词new.txt").getPath());
        try {
            Repository.readDic(file);
            Repository.genRepository(ruleDao);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }



//    private List<Forward> getFQuestions() {
//        return questionForwardDao.selectAll();
//    }

    public Rule selectByName(String name) {
        return ruleDao.selectRuleByName(name);
    }



}
