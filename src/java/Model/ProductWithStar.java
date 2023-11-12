/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class ProductWithStar {

    private int product_id;
    private float avg_star;
    private int avg_star_int;
    private boolean w_check;

    public ProductWithStar() {
    }

    public ProductWithStar(int product_id, float avg_star, int avg_star_int, boolean w_check) {
        this.product_id = product_id;
        this.avg_star = avg_star;
        this.avg_star_int = avg_star_int;
        this.w_check = w_check;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public float getAvg_star() {
        return avg_star;
    }

    public void setAvg_star(float avg_star) {
        this.avg_star = avg_star;
    }

    public int getAvg_star_int() {
        return avg_star_int;
    }

    public void setAvg_star_int(int avg_star_int) {
        this.avg_star_int = avg_star_int;
    }

    public boolean isW_check() {
        return w_check;
    }

    public void setW_check(boolean w_check) {
        this.w_check = w_check;
    }

}
