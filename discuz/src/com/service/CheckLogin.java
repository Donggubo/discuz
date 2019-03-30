package com.service;

import com.dao.UserDao;
import com.user.User;

import java.util.List;

public class CheckLogin {
    //创建UserDao对象
    private UserDao userDao = new UserDao();
    //查找用户是否存在
    public List<User> finderUser(String username, String password){
        if(username.length() > 0 && password.length() > 0){
            List<User> userList = userDao.isExist(username);
            return userList;
        }
        return null;
    }
    //检查用户名或密码是否错误
    public int checkUserAndPass(String username, String password){
        int count = userDao.getUser(username, password);
        return count;
    }
    //定义获取用户ID的方法
    /*public int getUserId(String username) {
        int id = userDao.getUserId(username);
        return id;
    }*/
}
