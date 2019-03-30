package com.servlet;

import com.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "UserRegServlet", urlPatterns = "/UserRegServlet")
public class UserRegServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        //设置浏览器打印编码
        response.setContentType("text/html;charset=utf-8");
        //获取提交数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //获取输入的验证码
        String inputCode = request.getParameter("regcode");

        //获取图片验证码（验证码生成的servlet）
        String imgCode = (String) request.getSession().getAttribute("code");
        //保证验证码的一次性
        request.getSession().removeAttribute("code");

        if (!(imgCode != null && inputCode.equalsIgnoreCase(imgCode))) {
            response.sendRedirect("./template/regcodeerrotransfer.html");
            return;
        }

        UserDao userDao = new UserDao();
        //检查用户名是否存在
        if (userDao.isExist(username).size() != 0) {
            response.sendRedirect("./template/failedregister.html");
            return;
        }

        //数据库操作
        int i = userDao.insert(username, password);
        if (i > 0) {
            //存到session中
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("password", password);
            //将汉字编码
            String encodeName = URLEncoder.encode(username, "utf-8");
            //跳转
            //response.sendRedirect("./template/successregister.html?username=" + encodeName);
            request.getRequestDispatcher("FindByPageServlet?pageNumber=1").forward(request, response);
        } else {
            response.sendRedirect("./template/failedregister.html");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
