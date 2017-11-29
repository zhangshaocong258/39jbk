package com.szl.dao;

import com.szl.domain.User;

import java.util.List;

/**
 * Created by zsc on 2017/1/15.
 */
public interface UserDao {

    public void insertUser(User user);

    public User selectUserById(int userId);

    public User selectUserByName(String userName);

    public List<User> selectAllUsers();

    public void updateUser(User user);

    public void deleteUser(int Id);

    public void deleteUserByName(String userName);


}
