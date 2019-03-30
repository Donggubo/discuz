package com.user;
/**
 * 
 * Mess实体类
 * 
 * @author 董
 *
 */
public class Mess {
    private int id;
    private String title;
    private String content;
    private String addtime;

    public Mess() {
    }

    public Mess(int id, String title, String content, String addtime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.addtime = addtime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    @Override
    public String toString() {
        return "Mess{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", addtime='" + addtime + '\'' +
                '}';
    }
}
