package com.dao;

import com.druidutil.DruidUtil;
import com.user.Mess;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class MessDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DruidUtil.getDataSource());

    //插入操作
    public int insert(String title, String content) {
        //创建日期对象
        Date date = new Date();
        // 创建日期格式化对象,在获取格式化对象时可以指定风格
        DateFormat df = new SimpleDateFormat("yyyy‐MM‐dd HH:mm:ss");
        String addtime = df.format(date);
        String sql = "INSERT INTO mess_info VALUES (?, ?, ?, ?)";
        Object[] param = {
                null,
                title,
                content,
                addtime
        };
        int i = jdbcTemplate.update(sql, param);
        return i;
    }

    //查询所有信息操作并分页
    public List<Mess> queryMess(){
        String sql = "SELECT * FROM mess_info";

        List<Mess> messAll = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Mess.class));
        return messAll;
    }
    //查询所有信息操作并分页
    public List<Mess> findByPage(int startIndex, int pageSize){
        String sql = "SELECT * FROM mess_info ORDER BY id DESC limit ?, ?";
        Object[] params = {
                startIndex,
                pageSize
        };
        List<Mess> messFindByPage = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Mess.class), params);
        return messFindByPage;
    }
    //定义获取总页数的方法
    public int getTotalPage(int pageSize) {
        String sql = "SELECT COUNT(*) FROM mess_info";
        int totalRecord = jdbcTemplate.queryForObject(sql, int.class);
        //计算总页数
        int totalPage;
        if(totalRecord%pageSize ==0){
            totalPage = totalRecord/pageSize;
        }else{
            totalPage = totalRecord/pageSize + 1;
        }
       return totalPage;
    }
    @Test
    public void test(){
        MessDao messDao = new MessDao();
        messDao.getTotalPage(3);

    };
}
