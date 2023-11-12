/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class Feedback {

    private int f_id;
    private int user_id;
    private int p_id;
    private String issue_date;
    private String name;
    private int star;
    private String comment;
    private String img;

    public Feedback() {
    }

    public Feedback(int f_id, int user_id, int p_id, String issue_date, String name, int star, String comment, String img) {
        this.f_id = f_id;
        this.user_id = user_id;
        this.p_id = p_id;
        this.issue_date = issue_date;
        this.name = name;
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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getIssue_date() {
        return issue_date;
    }

    public void setIssue_date(String issue_date) {
        this.issue_date = issue_date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        return "Feedback{" + "f_id=" + f_id + ", user_id=" + user_id + ", p_id=" + p_id + ", issue_date=" + issue_date + ", name=" + name + ", star=" + star + ", comment=" + comment + ", img=" + img + '}';
    }

}
