/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ngnqu
 */
public class LaptopDetail {

    private int id;
    private int product_id;
    private String cpu;
    private String ram;
    private String hard_drive;
    private String card;
    private String srceen;
    private String gate;
    private String keyboard;
    private String audio;
    private String read_memory_card;
    private String lan;
    private String wifi;
    private String bluetooth;
    private String webcam;
    private String os;
    private String pin;
    private String weigh;
    private String security;
    private String color;
    private String size;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getHard_drive() {
        return hard_drive;
    }

    public void setHard_drive(String hard_drive) {
        this.hard_drive = hard_drive;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getSrceen() {
        return srceen;
    }

    public void setSrceen(String srceen) {
        this.srceen = srceen;
    }

    public String getGate() {
        return gate;
    }

    public void setGate(String gate) {
        this.gate = gate;
    }

    public String getKeyboard() {
        return keyboard;
    }

    public void setKeyboard(String keyboard) {
        this.keyboard = keyboard;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getRead_memory_card() {
        return read_memory_card;
    }

    public void setRead_memory_card(String read_memory_card) {
        this.read_memory_card = read_memory_card;
    }

    public String getLan() {
        return lan;
    }

    public void setLan(String lan) {
        this.lan = lan;
    }

    public String getWifi() {
        return wifi;
    }

    public void setWifi(String wifi) {
        this.wifi = wifi;
    }

    public String getBluetooth() {
        return bluetooth;
    }

    public void setBluetooth(String bluetooth) {
        this.bluetooth = bluetooth;
    }

    public String getWebcam() {
        return webcam;
    }

    public void setWebcam(String webcam) {
        this.webcam = webcam;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getWeigh() {
        return weigh;
    }

    public void setWeigh(String weigh) {
        this.weigh = weigh;
    }

    public String getSecurity() {
        return security;
    }

    public void setSecurity(String security) {
        this.security = security;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public LaptopDetail(int id, int product_id, String cpu, String ram, String hard_drive, String card, String srceen, String gate, String keyboard, String audio, String read_memory_card, String lan, String wifi, String bluetooth, String webcam, String os, String pin, String weigh, String security, String color, String size) {
        this.id = id;
        this.product_id = product_id;
        this.cpu = cpu;
        this.ram = ram;
        this.hard_drive = hard_drive;
        this.card = card;
        this.srceen = srceen;
        this.gate = gate;
        this.keyboard = keyboard;
        this.audio = audio;
        this.read_memory_card = read_memory_card;
        this.lan = lan;
        this.wifi = wifi;
        this.bluetooth = bluetooth;
        this.webcam = webcam;
        this.os = os;
        this.pin = pin;
        this.weigh = weigh;
        this.security = security;
        this.color = color;
        this.size = size;
    }

    public LaptopDetail() {
    }

    @Override
    public String toString() {
        return "LaptopDetail{" + "id=" + id + ", product_id=" + product_id + ", cpu=" + cpu + ", ram=" + ram + ", hard_drive=" + hard_drive + ", card=" + card + ", srceen=" + srceen + ", gate=" + gate + ", keyboard=" + keyboard + ", audio=" + audio + ", read_memory_card=" + read_memory_card + ", lan=" + lan + ", wifi=" + wifi + ", bluetooth=" + bluetooth + ", webcam=" + webcam + ", os=" + os + ", pin=" + pin + ", weigh=" + weigh + ", security=" + security + ", color=" + color + ", size=" + size + '}';
    }
    
}
