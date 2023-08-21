package com.plusnplus.vo;

public class Comment {

    private int cno;
    private String author;
    private String content;
    private String resdate;
    private int bno;
    private String name;

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cno=" + cno +
                ", author='" + author + '\'' +
                ", content='" + content + '\'' +
                ", resdate='" + resdate + '\'' +
                ", bno=" + bno +
                ", name='" + name + '\'' +
                '}';
    }

}
