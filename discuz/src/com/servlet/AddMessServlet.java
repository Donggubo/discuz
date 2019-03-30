package com.servlet;

import com.dao.MessDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddMessServlet", urlPatterns = "/AddMessServlet")
public class AddMessServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码，在最前面设置
        request.setCharacterEncoding("UTF-8");
        //设置浏览器编码
        response.setContentType("text/html;charset=utf-8");
        //获取过滤后的提交数据，使用getAttribute()方法
        String title = (String)request.getAttribute("title");
        String content = (String)request.getAttribute("content");
        /****************测试屏蔽不良字符*****************/
        /*List<String> list = new ArrayList<>();
        list.add("你大爷");
        list.add("泥煤");
        for (String s : list) {
            if(title.contains(s)){
                title = title.replaceAll(s, "*");
            }
            if(content.contains(s)){
                content = content.replaceAll(s, "*");
            }
        }*/
        /****************测试屏蔽不良字符*****************/
        //创建MessDao对象
        MessDao messDao = new MessDao();
        int i = messDao.insert(title, content);
        //判断
        if(i > 0){
            request.getRequestDispatcher("FindByPageServlet?pageNumber=1").forward(request, response);
        }else{
            response.sendRedirect("add.jsp");
        }

    }
}
