package com.druidutil;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DruidUtil {
    private static DataSource dataSource = null;
    private static Connection connection = null;
    private static Properties properties = new Properties();
    //加载配置文件，一定要放在src文件夹下
    static{
        InputStream is = DruidUtil.class.getClassLoader().getResourceAsStream("druiddb.properties");
        try {
            properties.load(is);
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //提供获取DataSource方法，jdbcTemplate使用
    public static DataSource getDataSource(){
        return dataSource;
    }
    //获得Connection的方法
    public static Connection getConnection() throws SQLException {
        connection = dataSource.getConnection();
        return connection;
    }
}
