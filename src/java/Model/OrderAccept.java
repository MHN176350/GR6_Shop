/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Minh
 */
public class OrderAccept {

    public int oid;
    public String cname;
    public String payment;
    public String address;
    public String odate;
    public int status;

    public OrderAccept() {
    }

    public OrderAccept(int oid, String cname, String payment, String address, String odate, int status) {
        this.oid = oid;
        this.cname = cname;
        this.payment = payment;
        this.address = address;
        this.odate = odate;
        this.status = status;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOdate() {
        return odate;
    }

    public void setOdate(String odate) {
        this.odate = odate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderAccept{" + "oid=" + oid + ", cname=" + cname + ", payment=" + payment + ", address=" + address + ", odate=" + odate + ", status=" + status + '}';
    }

}
