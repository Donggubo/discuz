package com.pagebean;

import java.util.List;

public class PageBean<T> {
    private List<T> data; //当前页数据列表,需要通过limit查询
    private int curPage; //当前页,已知数据,从页面上传递过来
    private int totalPage; //总页数,通过总记录数和每页显示的条数计算出来
    private int count; //总记录数,需要通过count(*)查询
    private int pageSize; //每页显示多少条数据,已知数据
    /**
     * curPage和pageSize是已知的数据,通过一个带参构造器方便创建pageBean对象
     * @param curPage 当前页
     * @param pageSize 每页显示多少条数据
     */
    public PageBean(int curPage, int pageSize) {
        this.curPage = curPage;
        this.pageSize = pageSize;
    }

    /**
     * 获取limit中开始的索引
     * @return 分页开始索引
     */
    public int getStartIndex(){
        return (this.curPage - 1) * this.pageSize;
    }
    /**
     * 获取总页数
     * 通过总记录数和每页显示的条数相除计算出来,
     * 若两者可以整除,总页数就是商
     * 若两者不可以整除,总页数就是商+1
     * @return 总页数
     */
    public int getTotalPage() {
        return (int) Math.ceil(count*1.0/pageSize);
    }
//getter和setter方法省略

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
