package com.service;

import com.dao.UserDao;

public class UserService {
   private UserDao userDao = new UserDao();

    public int chkOldpwd(String username, String prepwd, String newpwd) {
        int i = userDao.chkOldpwd(username, prepwd, newpwd);
        return i;
    }
}
