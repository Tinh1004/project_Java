/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    ConnectDB db = ConnectDB.getInstance();
    Connection con = null;
    PreparedStatement statement = null;
    ResultSet rs = null;

    public List<Product> getProducts() throws SQLException {
        List<Product> sl = new ArrayList<>();

        try {
            con = db.openConnection();
            //Hien thi theo id
            String query = "select * from ProductDB order by id desc";
            statement = con.prepareStatement(query);
            rs = statement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String productName = rs.getString(2).trim();
                double oldPrice = 0;
                if (!rs.getString(3).isEmpty()) {
                    oldPrice = Double.parseDouble(rs.getString(3));
                }
                double newPrice = Double.parseDouble(rs.getString(4));
                String productImage = rs.getString(5).trim();
                Product tmpProduct = new Product(id, productName, oldPrice, newPrice, productImage);
                sl.add(tmpProduct);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return sl;
    }

    public Product getProduct(int id) {
        Product product = new Product();
        try {
            con = db.openConnection();
            //Hien thi theo id
            String query = "select * from ProductDB where id=?";
            statement = con.prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            if (rs.next()) {
                String productName = rs.getString(2);

                double oldPrice = 0;
                if (!rs.getString(3).isEmpty()) {
                    oldPrice = Double.parseDouble(rs.getString(3));
                }
                double newPrice = Double.parseDouble(rs.getString(4));
                String productImage = rs.getString(5);
                product = new Product(id, productName, oldPrice, newPrice, productImage);
            }
            rs.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return product;
    }

    public List<Cart> getCartProducts(List<Cart> listCart) {
        List<Cart> sl = new ArrayList<>();
        for (Cart c : listCart) {
            Product product = getProduct(c.getId());
            double totalPrice = c.getQuantity() * product.getNewPrice();

            Cart newCart = new Cart();
            newCart.setId(product.getId());
            newCart.setProductName(product.getProductName());
            newCart.setOldPrice(product.getOldPrice());
            newCart.setNewPrice(product.getNewPrice());
            newCart.setProductImage(product.getProductImage());
            newCart.setPrice(totalPrice);
            newCart.setQuantity(c.getQuantity());
            sl.add(newCart);
        }

        return sl;
    }

    public double getTotalCartPrice(ArrayList<Cart> carts) {
        double sum = 0;
        try {
            for (Cart c : carts) {
                sum += c.getPrice();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sum;
    }

    public boolean createProduct(Product product) {

        try {
            con = db.openConnection();
            String query = "insert into ProductDB values(?,?,?,?)";
            // Student insert CODE here
            statement = con.prepareStatement(query);

            String str_oldPrice = "" + product.getOldPrice();
            String str_newPrice = "" + product.getNewPrice();

            statement.setNString(1, product.getProductName());
            statement.setNString(2, str_oldPrice.trim());
            statement.setNString(3, str_newPrice.trim());
            statement.setNString(4, product.getProductImage().trim());

            int rs = statement.executeUpdate();
            if (rs == 1) {
                System.out.print("Success");
                return true;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    public void deleteProduct(int id) {
        try {
            con = db.openConnection();
            String query = "DELETE FROM ProductDB WHERE id=?";
            // Student insert CODE here
            statement = con.prepareStatement(query);
            statement.setInt(1, id);
            statement.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void updateProduct(Product product) {
        String query = "UPDATE ProductDB SET productName = ?, oldPrice= ?, newPrice = ?, productImage = ?\n" +
"    WHERE id = ?;";
        
        try {
            String str_oldPrice = "" + product.getOldPrice();
            String str_newPrice = "" + product.getNewPrice();
            
            con = db.openConnection();
            statement = con.prepareStatement(query);
            
            statement.setString(1, product.getProductName());
            statement.setString(2, str_oldPrice);
            statement.setString(3, str_newPrice);
            statement.setString(4, product.getProductImage());
            statement.setInt(5, product.getId());

            statement.execute();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                con.close();
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int numberProduct() throws SQLException{
        List<Product> sl = getProducts();
        return sl.size();
    }

}
