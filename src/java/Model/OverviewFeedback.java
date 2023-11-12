/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class OverviewFeedback {

    private int f_id;
    private int order_id;
    private int user_id;
    private String name;
    private String issue_date;
    private int star;
    private String comment;
    private String img;

    public OverviewFeedback() {
    }

    public OverviewFeedback(int f_id, int order_id, int user_id, String name, String issue_date, int star, String comment, String img) {
        this.f_id = f_id;
        this.order_id = order_id;
        this.user_id = user_id;
        this.name = name;
        this.issue_date = issue_date;
        this.star = star;
        this.comment = comment;
        this.img = img;
    }

    public int getF_id() {
        return f_id;
    }

    public void setF_id(int f_id) {
        this.f_id = f_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIssue_date() {
        return issue_date;
    }

    public void setIssue_date(String issue_date) {
        this.issue_date = issue_date;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "OverviewFeedback{" + "f_id=" + f_id + ", order_id=" + order_id + ", user_id=" + user_id + ", name=" + name + ", issue_date=" + issue_date + ", star=" + star + ", comment=" + comment + ", img=" + img + '}';
    }

}
