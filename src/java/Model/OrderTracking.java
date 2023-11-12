/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author MILAMILO
 */
public class OrderTracking {

    private int tracking_id;
    private int order_id;
    private String order_confirm;
    private String picked_up_by_courier;
    private String on_the_way;
    private String ready_for_picked_up;
    private String received;
    private String return_demand;
    private String return_failed;
    private String complete;

    public OrderTracking() {
    }

    public OrderTracking(int tracking_id, int order_id, String order_confirm, String picked_up_by_courier, String on_the_way, String ready_for_picked_up, String received, String return_demand, String return_failed, String complete) {
        this.tracking_id = tracking_id;
        this.order_id = order_id;
        this.order_confirm = order_confirm;
        this.picked_up_by_courier = picked_up_by_courier;
        this.on_the_way = on_the_way;
        this.ready_for_picked_up = ready_for_picked_up;
        this.received = received;
        this.return_demand = return_demand;
        this.return_failed = return_failed;
        this.complete = complete;
    }

    public int getTracking_id() {
        return tracking_id;
    }

    public void setTracking_id(int tracking_id) {
        this.tracking_id = tracking_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrder_confirm() {
        return order_confirm;
    }

    public void setOrder_confirm(String order_confirm) {
        this.order_confirm = order_confirm;
    }

    public String getPicked_up_by_courier() {
        return picked_up_by_courier;
    }

    public void setPicked_up_by_courier(String picked_up_by_courier) {
        this.picked_up_by_courier = picked_up_by_courier;
    }

    public String getOn_the_way() {
        return on_the_way;
    }

    public void setOn_the_way(String on_the_way) {
        this.on_the_way = on_the_way;
    }

    public String getReady_for_picked_up() {
        return ready_for_picked_up;
    }

    public void setReady_for_picked_up(String ready_for_picked_up) {
        this.ready_for_picked_up = ready_for_picked_up;
    }

    public String getReceived() {
        return received;
    }

    public void setReceived(String received) {
        this.received = received;
    }

    public String getReturn_demand() {
        return return_demand;
    }

    public void setReturn_demand(String return_demand) {
        this.return_demand = return_demand;
    }

    public String getReturn_failed() {
        return return_failed;
    }

    public void setReturn_failed(String return_failed) {
        this.return_failed = return_failed;
    }

    public String getComplete() {
        return complete;
    }

    public void setComplete(String complete) {
        this.complete = complete;
    }

    @Override
    public String toString() {
        return "OrderTracking{" + "tracking_id=" + tracking_id + ", order_id=" + order_id + ", order_confirm=" + order_confirm + ", picked_up_by_courier=" + picked_up_by_courier + ", on_the_way=" + on_the_way + ", ready_for_picked_up=" + ready_for_picked_up + ", received=" + received + ", return_demand=" + return_demand + ", return_failed=" + return_failed + ", complete=" + complete + '}';
    }

}
