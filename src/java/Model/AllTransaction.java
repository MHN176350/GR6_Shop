/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class AllTransaction {

    private int id;
    private int user_id;
    private double action;
    private String issue_date;
    private String note;
    private String f_name;
    private String l_name;

    public AllTransaction() {
    }

    public AllTransaction(int id, int user_id, double action, String issue_date, String note, String f_name, String l_name) {
        this.id = id;
        this.user_id = user_id;
        this.action = action;
        this.issue_date = issue_date;
        this.note = note;
        this.f_name = f_name;
        this.l_name = l_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getAction() {
        return action;
    }

    public void setAction(double action) {
        this.action = action;
    }

    public String getIssue_date() {
        return issue_date;
    }

    public void setIssue_date(String issue_date) {
        this.issue_date = issue_date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getF_name() {
        return f_name;
    }

    public void setF_name(String f_name) {
        this.f_name = f_name;
    }

    public String getL_name() {
        return l_name;
    }

    public void setL_name(String l_name) {
        this.l_name = l_name;
    }

    @Override
    public String toString() {
        return "AllTransaction{" + "id=" + id + ", user_id=" + user_id + ", action=" + action + ", issue_date=" + issue_date + ", note=" + note + ", f_name=" + f_name + ", l_name=" + l_name + '}';
    }

}
