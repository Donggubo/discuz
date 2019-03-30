package com.servlet;

import com.encryptutil.MD5Encrypt;
import com.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangePasswordServlet", urlPatterns = "/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        //获取用户名
        String username = request.getParameter("username");
        //获取旧密码、新密码和确认密码
        String prepwd = request.getParameter("prepwd");//旧密码
        String newpwd = request.getParameter("newpwd");//新密码
        String renewpwd = request.getParameter("renewpwd");//确认密码

        //再次判断新旧密码是否一致，一致的话则提示新旧密码一致
        if (prepwd.equals(newpwd)) {
            request.setAttribute("same", "原密码和新密码一致，请修改！");
            request.getRequestDispatcher("membercenter.jsp").forward(request, response);
            return;
        }
        //再次判断新密码和确认密码是否一致，不一致返回密码修改页面
        if (!newpwd.equals(renewpwd)) {
            request.setAttribute("msg", "新密码和确认密码不一致");
            request.getRequestDispatcher("membercenter.jsp").forward(request, response);
            return;
        }
        //新密码和确认密码一致进行下一步
        //将旧密码通过密码编译工具编译后传入到后台进行对比
        MD5Encrypt md5Encrypt = new MD5Encrypt();
        prepwd = md5Encrypt.md5encrypt(prepwd);
        //编译新密码
        newpwd = md5Encrypt.md5encrypt(newpwd);

        //创建userService对象
        UserService userService = new UserService();
        //通过用户名，调用校对旧密码的方法并将新密码传入
        int i = userService.chkOldpwd(username, prepwd, newpwd);
        //判断返回值是否大于0，如果大于0说明修改成功，跳到首页面进行重新登录，如果不大于0则说明旧密码不正确，返回密码修改页面
        if (i > 0) {
            //提示后点击确认跳转的代码参考https://zhidao.baidu.com/question/94788350.html
            response.getWriter().print("<script>alert('密码修改成功，请重新登录'); window.location='index.jsp' </script>");//这里提示后实现跳转
        } else {
            request.setAttribute("error", "原密码不正确请重新输入");
            request.getRequestDispatcher("membercenter.jsp").forward(request, response);
        }
    }
}
