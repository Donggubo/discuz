package com.service;

import com.dao.MessDao;
import com.user.Mess;

import java.util.List;

public class MessService {
    private MessDao messDao = new MessDao();
    public List<Mess> findByPage(int startIndex, int pageSize) {
        List<Mess> messFindByPage = messDao.findByPage(startIndex, pageSize);
        return messFindByPage;
    }
    //定义获取总页数的方法
    public int getTotalPage(int pageSize){
        int totalPage = messDao.getTotalPage(pageSize);
        return totalPage;
    }
}
