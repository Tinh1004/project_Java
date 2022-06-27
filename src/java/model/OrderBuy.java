/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderBuy {
    private String O_date;
    private String productName;
    private String newPrice;
    private int quantiry;
    private String userName;

    public OrderBuy(String O_date, String productName, String newPrice, int quantiry, String userName) {
        this.O_date = O_date;
        this.productName = productName;
        this.newPrice = newPrice;
        this.quantiry = quantiry;
        this.userName = userName;
    }

    public String getO_date() {
        return O_date;
    }

    public void setO_date(String O_date) {
        this.O_date = O_date;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(String newPrice) {
        this.newPrice = newPrice;
    }

    public int getQuantiry() {
        return quantiry;
    }

    public void setQuantiry(int quantiry) {
        this.quantiry = quantiry;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "OrderBuy{" + "O_date=" + O_date + ", productName=" + productName + ", newPrice=" + newPrice + ", quantiry=" + quantiry + ", userName=" + userName + '}';
    }
    
    
}
