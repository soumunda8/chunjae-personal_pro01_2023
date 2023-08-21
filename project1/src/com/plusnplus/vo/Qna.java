package com.plusnplus.vo;

public class Qna {

    private int qno;
    private String title;
    private String content;
    private String answer;
    private String author;
    private String resdate;
    private String answerdate;
    private boolean answeryn;
    private String name;

    public int getQno() {
        return qno;
    }

    public void setQno(int qno) {
        this.qno = qno;
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

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    public String getAnswerdate() {
        return answerdate;
    }

    public void setAnswerdate(String answerdate) {
        this.answerdate = answerdate;
    }

    public boolean isAnsweryn() {
        return answeryn;
    }

    public void setAnsweryn(boolean answeryn) {
        this.answeryn = answeryn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Qna{" +
                "qno=" + qno +
                ", content='" + content + '\'' +
                ", answer='" + answer + '\'' +
                ", resdate='" + resdate + '\'' +
                ", answerdate='" + answerdate + '\'' +
                ", answeryn=" + answeryn +
                ", name='" + name + '\'' +
                '}';
    }

}