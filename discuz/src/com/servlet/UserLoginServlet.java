package com.servlet;

import com.dao.UserDao;
import com.encryptutil.MD5Encrypt;
import com.service.CheckLogin;
import com.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet(name = "UserLoginServlet", urlPatterns = "/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        //获取输入的验证码
        String inputCode = request.getParameter("code");

        //获取图片验证码
        String imgCode = (String) request.getSession().getAttribute("code");
        //保证验证码的一次性
        request.getSession().removeAttribute("code");

        if (!(imgCode != null && inputCode.equalsIgnoreCase(imgCode))) {
            request.setAttribute("msg", "验证码有误");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        //验证码正确进行下一步
        //获取用户名
        String username = request.getParameter("username");
        //获取密码，然后将密码使用加密工具进行加密，为了和数据库里加密后的密码进行对比
        String password = request.getParameter("password");
        //存储到session里
        request.getSession().setAttribute("username", username);
        request.getSession().setAttribute("password", password);

        //对输入的密码进行加密转换
        MD5Encrypt md5Encrypt = new MD5Encrypt();
        password = md5Encrypt.md5encrypt(password);

        //创建CheckLogin对象
        CheckLogin checkLogin = new CheckLogin();
        //将用户名传入，调用getUserId的方法，获取userId以修改密码使用
        //int id = checkLogin.getUserId(username);
        //使用CheckLogin里的findUser方法检查用户是否存在，如果不存在则提示注册后登录
        List<User> user = checkLogin.finderUser(username, password);
        if (user.size() == 0) {
            response.sendRedirect("./template/nousertransfer.html");
            return;
        }

        //使用CheckLogin里的getUser方法检查用户用户名或密码是否错误，如果错误则提示检查后重新登录
        int count = checkLogin.checkUserAndPass(username, password);
        if (count > 0) {

            //将汉字编码
            String encodeName = URLEncoder.encode(username, "utf-8");

            //跳转
            //response.sendRedirect("./template/successtransfer.html?username=" + encodeName);
            //request.getRequestDispatcher("./template/successtransfer.jsp?username=" + encodeName).forward(request, response);
            //存储到域对象，提示欢迎登录
            request.setAttribute("username", username);
            //将id存储到域对象
            //request.setAttribute("id", id);
            request.getRequestDispatcher("FindByPageServlet?pageNumber=1").forward(request, response);
        } else {
            response.sendRedirect("./template/failedlogintransfer.html");
        }
    }
}
