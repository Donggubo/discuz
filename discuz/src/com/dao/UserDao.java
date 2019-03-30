package com.dao;

import com.druidutil.DruidUtil;
import com.encryptutil.MD5Encrypt;
import com.user.User;
import org.junit.Test;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DruidUtil.getDataSource());
    //查询操作，用于检查登录时或注册时是否有此用户名
    public List<User> isExist(String username){
        String sql = "SELECT username FROM user WHERE username = ?";
        List<User> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), username);
        return list;
    }

    //注册插入操作
    public int insert(String username, String password) {
        String sql = "INSERT INTO user VALUES (?, ?, ?)";
        //创建加密对象将密码进行加密
        MD5Encrypt md5Encrypt = new MD5Encrypt();
        String encryptPassword = md5Encrypt.md5encrypt(password);

        Object[] param = {
                null,
                username,
                encryptPassword
        };
        int i = jdbcTemplate.update(sql, param);
        return i;
    }

    //查询操作
    public int getUser(String username, String password){
        /*
        * 注意这里聚合函数的使用，关键字和括号之间不能有空格
        * */
        String sql = "SELECT COUNT(*) FROM user WHERE username = ? and password = ?";
        int count = jdbcTemplate.queryForObject(sql, int.class, username, password);
        return count;
    }
    //定义修改密码的方法
    public int chkOldpwd(String username, String prepwd, String newpwd) {
        //根据用户名查询密码
        String sql="SELECT password from user where username=?";
        String pwd = null;
        try {
            pwd = jdbcTemplate.queryForObject(sql, String.class, username);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        //判断传入的密码和数据库查询的密码是否一致
        int i=0;
        if(pwd.equals(prepwd)){
            String updatePdw="UPDATE user SET password=? WHERE username=?";
            Object[] params={
                    newpwd,
                    username
            };
            try {
                i = jdbcTemplate.update(updatePdw, params);
            } catch (DataAccessException e) {
                e.printStackTrace();
            }
            return i;
        }else{
            return i;
        }
    }
}
