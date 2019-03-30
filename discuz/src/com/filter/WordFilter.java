package com.filter;

import javax.servlet.*;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class WordFilter implements Filter {
    //放到集合中
    private List<String> list = new ArrayList<>();
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        //编码
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //获取提交的数据
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        //遍历集合并和提交的数据进行对比并将违规字符替换成*号
        for (String illegalStr : list) {
            //过滤非法字符
            if (title.contains(illegalStr) ) {
                title = title.replaceAll(illegalStr, "*");//注意要赋值给新的字符串
                request.setAttribute("title", title);
            }
            //过滤非法字符
            if(content.contains(illegalStr)) {
                content = content.replaceAll(illegalStr, "*");
                request.setAttribute("content", content);
            }
        }
        request.setAttribute("title", title);
        request.setAttribute("content", content);
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
        //将非法字符放入到init方法里，启动时只执行一次即可
        //通过config获取servletContext对象，调用getRealPath传入参数获取文件的绝对路径
        String realPath = config.getServletContext().getRealPath("/file/words.txt");//获取该文件名的绝对路径，注意参数字符串的使用

        //创建字符缓冲流并读取文件内容
        try {
            BufferedReader bf = new BufferedReader(new InputStreamReader(new FileInputStream(realPath), "utf-8"));//注意编码的转换
            String illegalStr;
            while((illegalStr = bf.readLine()) != null){
                list.add(illegalStr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
