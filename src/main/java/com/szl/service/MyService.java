package com.szl.service;

import com.szl.domain.Discase;
import com.szl.domain.Rule;
import com.szl.dao.*;
import com.szl.domain.User;
import com.szl.util.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.File;
import java.util.List;

/**
 * Created by zsc on 2017/1/18.
 * 构造方法在@PostConstruct前执行
 * fQuestions和rQuestions是为了构建fQuestionsMap和rQuestionsMap，rQuestionsMap是用来查询，最终得到有序的结果url序号，
 * 然后通过查询fQuestionsMap得到最终的url信息，可以将rQuestionsMap和fQuestionsMap整合，节省空间
 */
@Service
public class MyService implements ServiceInterface {

    @Autowired
    private RuleDao ruleDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private DiscaseDao discaseDao;


    @PostConstruct
    public void init() {
        System.out.println("@PostConstruct方法被调用");
        File dicFile = new File(MyService.class.getClassLoader().getResource("../../model/同义词new.txt").getPath());
        File forestFile = new File(MyService.class.getClassLoader().getResource("../../model/脉舌词典带标签.txt").getPath());
        try {
            Repository.readDic(dicFile);
            Repository.readForest(forestFile);
            Repository.genRepository(ruleDao);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public User login(String username, String password) {
//        System.out.println("输入的账号:" + username + "输入的密码:" + password);
        //对输入账号进行查询,取出数据库中保存对信息
        User user = userDao.selectUserByName(username);
        if (user != null) {
            System.out.println("查询出来的账号:" + user.getUserName() + " 密码:" + user.getUserPassword());
            if (user.getUserName().equals(username) && user.getUserPassword().equals(password))
                return user;
        }
        return user;
    }

    public String register(String username, String password, String confirmPassword) {
//        System.out.println("输入的账号:" + username + "输入的密码:" + password);
        //对输入账号进行查询,取出数据库中保存对信息
        if (userDao.selectUserByName(username) == null) {
            if (password.equals(confirmPassword)) {
                User user = new User();
                user.setUserName(username);
                user.setUserPassword(password);
                userDao.insertUser(user);
                return "ok";
            } else {
                return "error2";
            }
        } else {
            return "error1";
        }

    }


//    public User selectUserById(Integer userId) {
//        return userDao.selectUserById(userId);
//    }
//
//    public User selectUserByName(String name) {
//        return userDao.selectUserByName(name);
//    }
//
//    public void updateUser(User user) {
//        userDao.updateUser(user);
//    }
//
//    public void deleteUserByName(String userName) {
//        userDao.deleteUserByName(userName);
//    }
//
//    public List<User> selectAllUser() {
//        return userDao.selectAllUsers();
//    }

    public Discase selectDiscaseById(int id) {
        return discaseDao.selectDiscaseById(id);
    }


    public void updateDiscase(Discase discase) {
        discaseDao.updateDiscase(discase);
    }

    public void deleteDiscaseById(int id) {
        discaseDao.deleteDiscase(id);
    }

    public List<Discase> selectAllDiscase() {
        return discaseDao.selectAllDiscases();
    }


    public Rule selectByName(String name) {
        return ruleDao.selectRuleByName(name);
    }


}
