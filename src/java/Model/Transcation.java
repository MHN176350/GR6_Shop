/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class Transcation {

    private int id;
    private int user_id;
    private double action;
    private double after_action;
    private String issue_date;
    private String note;

    public Transcation() {
    }

    public Transcation(int id, int user_id, double action, double after_action, String issue_date, String note) {
        this.id = id;
        this.user_id = user_id;
        this.action = action;
        this.after_action = after_action;
        this.issue_date = issue_date;
        this.note = note;
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

    public double getAfter_action() {
        return after_action;
    }

    public void setAfter_action(double after_action) {
        this.after_action = after_action;
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

    @Override
    public String toString() {
        return "Transcation{" + "id=" + id + ", user_id=" + user_id + ", action=" + action + ", after_action=" + after_action + ", issue_date=" + issue_date + ", note=" + note + '}';
    }

}
