package com.servlet;

import com.service.MessService;
import com.user.Mess;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowTitleServlet", urlPatterns = "/ShowTitleServlet")
public class ShowTitleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        //获取用户名，用于提示欢迎发言
        String username = request.getParameter("username");
        //获取当前页
        String pageNumberStr = request.getParameter("pageNumber");
        //每页显示的条数
        int pageSize = 3;
        //转为数字
        int pageNumber;
        try{
            pageNumber = Integer.valueOf(pageNumberStr);
            //当pageNumber小于1时，默认值为1
            if(pageNumber<1){
                pageNumber=1;
            }
        }catch (NumberFormatException e){
            //如果出现非数字转换异常，则默认值为1
            pageNumber=1;
        }
        //计算startIndex
        int startIndex = (pageNumber-1)*pageSize;
        //创建service对象
        MessService messService = new MessService();
        List<Mess> messFindByPage = messService.findByPage(startIndex, pageSize);
        //存储到域对象
        request.setAttribute("messFindByPage", messFindByPage);
        request.setAttribute("username", username);
        //请求转发
        request.getRequestDispatcher("add.jsp").forward(request, response);
    }
}
