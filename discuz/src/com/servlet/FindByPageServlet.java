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

@WebServlet(name = "FindByPageServlet", urlPatterns = "/FindByPageServlet")
public class FindByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
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
        //调用获取查询记录的方法
        List<Mess> messFindByPage = messService.findByPage(startIndex, pageSize);
        //调用获取总页数的方法，将每页显示的条数作为参数传入
        int totalPage = messService.getTotalPage(pageSize);
        //存储到域对象
        request.setAttribute("messFindByPage", messFindByPage);
        request.setAttribute("totalPage", totalPage);//总页数存到域对象
        request.setAttribute("pageNumber", pageNumber);//将当前页码存储到域对象，点击上一页 下一页
        request.getRequestDispatcher("showmess.jsp").forward(request, response);
    }
}
