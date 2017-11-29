package com.szl.domain;

/**
 * Created by zsc on 2017/1/15.
 */
public class User {

    private int id;
    private String userName;
    private String userPassword;
    private String realName;
    private int userAge;
    private String userAddr;

    public User() {
    }

    public User(int id, String userName, String userPassword, String realName, int userAge, String userAddr) {
        this.id = id;
        this.userName = userName;
        this.userPassword = userPassword;
        this.realName = realName;
        this.userAge = userAge;
        this.userAddr = userAddr;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public int getUserAge() {
        return userAge;
    }

    public void setUserAge(int userAge) {
        this.userAge = userAge;
    }

    public String getUserAddr() {
        return userAddr;
    }

    public void setUserAddr(String userAddr) {
        this.userAddr = userAddr;
    }
}
