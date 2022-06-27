/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Product {
    private int id;
    private String productName;
    private double oldPrice;
    private double newPrice;
    private String productImage;
    
    public Product(){
        
    }
    
    public Product(int id, String name, double oldPrice, double newPrice, String image){
        this.id = id;
        this.productName = name;
        this.oldPrice = oldPrice;
        this.newPrice = newPrice;
        this.productImage = image;
    }
    
    public Product(String name, double oldPrice, double newPrice, String image){
        this.productName = name;
        this.oldPrice = oldPrice;
        this.newPrice = newPrice;
        this.productImage = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String name) {
        this.productName = name;
    }

    public double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public double getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(double newPrice) {
        this.newPrice = newPrice;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String image) {
        this.productImage = image;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + productName + ", oldPrice=" + oldPrice + ", newPrice=" + newPrice + ", image=" + productImage + '}';
    }
    
    
    
}
